# function from here: https://jroberayalas.netlify.com/post/notes-on-statistical-rethinking-chapter-6-overfitting-regularization-and-information-criteria/

# ... are the fitted models
compare_waic <- function (..., sort = "WAIC", func = "WAIC") 
{
    mnames <- as.list(substitute(list(...)))[-1L]
    
    L <- list(...)
    if (is.list(L[[1]]) && length(L) == 1) {L <- L[[1]]}
    
    classes <- as.character(sapply(L, class))
    if (any(classes != classes[1])) {
        warning("Not all model fits of same class.\nThis is usually a bad idea, because it implies they were fit by different algorithms.\nCheck yourself, before you wreck yourself.")
    }
    
    nobs_list <- try(sapply(L, nobs))
    if (any(nobs_list != nobs_list[1])) {
        nobs_out <- paste(mnames, nobs_list, "\n")
        nobs_out <- concat(nobs_out)
        warning(concat("Different numbers of observations found for at least two models.\nInformation criteria only valid for comparing models fit to exactly same observations.\nNumber of observations for each model:\n", 
            nobs_out))
    }
    
    dSE.matrix <- matrix(NA, nrow = length(L), ncol = length(L))
    
    if (func == "WAIC") {
        WAIC.list <- lapply(L, function(z) WAIC(z, pointwise = TRUE))
        
        ### The next three lines have been augmented from Roberto's code
        
        p.list  <- sapply(WAIC.list, function(x) x$estimates["p_waic", "Estimate"])
        se.list <- sapply(WAIC.list, function(x) x$estimates["waic", "SE"])
        IC.list <- sapply(WAIC.list, function(x) x$estimates["waic", "Estimate"])
        #mnames <- sapply(WAIC.list, function(x) x$model_name)
        colnames(dSE.matrix) <- mnames
        rownames(dSE.matrix) <- mnames
        for (i in 1:(length(L) - 1)) {
            for (j in (i + 1):length(L)) {
                waic_ptw1 <- WAIC.list[[i]]$pointwise[ , 3]
                waic_ptw2 <- WAIC.list[[j]]$pointwise[ , 3]
                dSE.matrix[i, j] <- as.numeric(sqrt(length(waic_ptw1) * 
                        var(waic_ptw1 - waic_ptw2)))
                dSE.matrix[j, i] <- dSE.matrix[i, j]
            }
        }
    }
    
    #if (!(the_func %in% c("DIC", "WAIC", "LOO"))) {
    #    IC.list <- lapply(L, function(z) func(z))
    #}
    IC.list <- unlist(IC.list)
    dIC <- IC.list - min(IC.list)
    w.IC <- rethinking::ICweights(IC.list)
    if (func == "WAIC") {
        topm <- which(dIC == 0)
        dSEcol <- dSE.matrix[, topm]
        result <- data.frame(WAIC = IC.list, pWAIC = p.list, 
            dWAIC = dIC, weight = w.IC, SE = se.list, dSE = dSEcol)
    }
    
    #if (!(the_func %in% c("DIC", "WAIC", "LOO"))) {
    #    result <- data.frame(IC = IC.list, dIC = dIC, weight = w.IC)
    #}
    rownames(result) <- mnames
    if (!is.null(sort)) {
        if (sort != FALSE) {
            if (sort == "WAIC") 
                sort <- func
            result <- result[order(result[[sort]]), ]
        }
    }
    new("compareIC", output = result, dSE = dSE.matrix)
}
