##############################################################
# translating lme4 parameter's names to brms language
##########################################################

translation <- function(lme4_tidy) {
    
    for (i in 1:length(lme4_tidy$term) ) {
        
        if (substr(lme4_tidy$term[i], 1, 1) == "(") {
            
            lme4_tidy$term[i] <- "b_Intercept"
            
        } else if (lme4_tidy$group[i] == "Residual") {
            
            lme4_tidy$term[i] <- "sigma"
            
        } else if (substr(lme4_tidy$term[i], 1, 14) == "sd_(Intercept)") {
            
            lme4_tidy$term[i] <-
                paste0("sd_",
                    substr(lme4_tidy$term[i], 16,
                        nchar(lme4_tidy$term[i]) ), "__Intercept")
            
        } else if (substr(lme4_tidy$term[i], 1, 3) == "sd_" &
                grepl("(Intercept)", lme4_tidy$term[i]) == FALSE) {
            
            lme4_tidy$term[i] <-
                paste0("sd_", lme4_tidy$group[i], "_",
                    substr(lme4_tidy$term[i],
                        3, nchar(lme4_tidy$term[i]) - nchar(lme4_tidy$group[i]) - 1) )
            
        } else if (substr(lme4_tidy$term[i], 1, 3) == "cor") {
            
            lme4_tidy$term[i] <-
                paste0("cor_",lme4_tidy$group[i], "__Intercept__",
                    substr(lme4_tidy$term[i], 17,
                        nchar(lme4_tidy$term[i]) - nchar(lme4_tidy$group[i]) - 1) )
            
        } else {
            
            lme4_tidy$term[i] <- paste0("b_", lme4_tidy$term[i])
            
        }
        
    }
    
    return(lme4_tidy)
}
