############################################################
#
# 	Basic signal processing functions for EMG
# 	Frank Borg 2010 -
# 	  a. borgbros@netti.fi
#	    b. frank.borg@chydenius.fi
#	  Welmed Project, www.welmed.fi
#	  University of Jyväskylä
#	  Kokkola University Consortium Chydenius
#	  Bondegatan 2B, FIN-67701 Karleby, Finland 
#
#	
#
#	Version 19. August 2011
#
# corrected error in lines() argument of EMG_cauchyt() and related
# where time argument was missing in lines() -- 31.1.2014
#
############################################################

# Auxillary function

next2n <- function(n){
	if(n < 2) return(1)
	k <- 0
	m <- 1
	while(m < n){
		m <- 2*m
		k <- k+1
	}
	return(m)
}


# Wrapper for a basic plotting of EMG data. 
# Interactivity: Right clicking the graph will show the index of the point; to stop: left click --> stop.
# Indexes of the selected points are returned  
# Input:
#		V --			EMG data, array
#		sampFreq -- 	sampling frequency
#		start --		plots points V[start:stop]
#		stop --
#		title -- 	title for graph
#		ylab --		label for y-axis, also other parameters can be passed on to the built-in plot function
# Output:
#		list(fs = sampFreq, start = start, stop = stop, stdev = sd(V[start:stop]), locations = loc)
#		.....
#		locations --	vector with indexes of selected points	
EMG_plot <- function(V, 
					sampFreq = 1000, 
					start = 1, 
					stop = length(V), 
					title = paste("EMG data (", start, ", ", stop, ")"), ylab = "", ...){

	n <- length(V)
	if(n < 1) 
	if(start < 1) start <- 1
	if(stop > n) stop <- n
	if(stop <= start) return(-1) 
	if(sampFreq < 1) return(-3)
	
	time0 <- 1000*start/sampFreq
	time1 <- 1000*stop/sampFreq
	
	time <- 1000*seq(start, stop, 1)/sampFreq # time values in millisecond
	
	print(plot(time, V[start:stop], main = title, xlab = "Time (ms)", ylab = ylab, type = "l", ...))
	loc <- identify(time, V[start:stop]) # right clicking the graph will show the index of the point; to stop: left click --> stop 
	out <- list(fs = sampFreq, time0 = time0, time1 = time1, stdev = sd(V[start:stop]), locations = loc)
	
	return(out)

}

# This function computes the rectified values (absolute values) after we have subtracted the mean.
# Input: V -- vector with row EMG data
# Output: vector with rectified elements
EMG_rect <- function(V, 
					sampFreq = 1000, 
					plot = FALSE){
	n <- length(V)
	rectV <- abs(V - mean(V))
	n <- length(V)
	if(plot) print(plot(seq(0,n-1,1)*1000/sampFreq, rectV, type = "l", 
	main = "Rectified EMG", xlab = "Time (ms)", ylab = "rEMG"))
	return(list(rect = rectV, fs = sampFreq))

}

# Computes the Averaged Rectified Value (ARV) with lag = 0.
# Input: V -- vector with raw EMG data
#		sampFreq -- sampling rate S/s for the EMG data [default: 1000 S/s]
#        DT -- time window for the averaging in ms [default: 250 ms]
# Output: vector of averaged data
EMG_arv <- function(V, 
					sampFreq = 1000, 
					DT = 250, 
					plot = FALSE){
	n <- length(V)
	m <- floor(DT*sampFreq/1000) # size of DT in terms of number of points
	if(m < 2) return(-1)
	filter1 <- rep(1/m, m)
	rectV <- abs(V - mean(V))
	rectV <- filter(rectV, filter1, sides = 2, method = "convolution") # sides = 2 gives lag = 0
	if(plot) print(plot(seq(0,n-1,1)*1000/sampFreq, rectV, main = paste("Average Rectfied EMG (DT = ", DT, " ms)"), 
	type = "l", xlab = "Time (ms)", ylab = "avrEMG"))
	return(list(arv = rectV, fs = sampFreq, DT = DT)) 

}

# Computes an envelope for rectified EMG based on the RMS = sqrt(x1*x1 + .... + xn*xn)/n) with lag = 0.
# Input: V -- vector with raw EMG data
#		sampFreq -- sampling rate S/s for the EMG data [default: 1000 S/s]
#        DT -- time window for the averaging in ms [default: 250 ms]
# Output: vector of RMS data

EMG_rms <- function(V, 
					sampFreq = 1000, 
					DT = 250, 
					plot = FALSE, ...){
	n <- length(V)
	m <- floor(DT*sampFreq/1000) # size of DT in terms of number of points
	if(m < 2) return(-1)
	if(m > n) return(-2)
	filter1 <- rep(1/m, m)
	rectV <- abs(V - mean(V))
	rectV <- sqrt(filter(rectV*rectV, filter1, sides = 2, method = "convolution", ...)) # sides = 2 gives lag = 0
	if(plot) print(plot(seq(0,n-1,1)*1000/sampFreq, rectV, main = paste("RMS EMG (DT = ", DT, " ms)"), type = "l", 
	xlab = "Time (ms)", ylab = "rmsEMG")) 	
	return(list(rms = rectV, fs = sampFreq, DT = DT)) 

}

# Calculates the EMG turns per second (Willison 1963) = here the number of times amplitude of EMG crosses +/- limFact*stdev(EMG) per second.
# Input: 
#		V -- vector with raw EMG data
#		sampFreq -- sampling rate S/s for the EMG data [default: 1000 S/s]
#		limFact -- +/- stdev(V)*limFact determines the crossing level
#        DT -- time window for the averaging in ms [default: 250 ms]
# Output: 
#		list(turns.ps = turns_per_sec, turns.where = turns)
#		turns.ps -- turns per second
#		turns.where -- time points [index] where turns are counted 
EMG_turns <- function(V, 
					  sampFreq = 1000, 
					  limFact = 1.5, 
					  DT = 250, 
					  plot = FALSE){
	n <- length(V)
	limA <- sd(V)*limFact
	V_ <- V - mean(V) # subtract offset/bias
	m <- floor(sampFreq*DT/1000) 	
	if(m < 2) return(-1)
	if(m >= n) return(-2)
	turns <- rep(0,n)
	for(i in 1:(n-1)){
		if(V_[i] < limA & V_[i+1] >= limA) { # crosses upper level
			turns[i] <- 1.0
		}
		if(V_[i] > -limA & V_[i+1] <= -limA) { # crosses lower level 
			turns[i] <- 1.0 
		}
	}
	filt1 <- 1000*rep(1, m)/DT # normalization corresponds to turns per second
#	return(sqrt(filter(turns, filt1, sides = 2, method = "convolution"))) # sides = 2 gives lag = 0
	
	turns_per_sec <- filter(turns, filt1, sides = 2, method = "convolution") # sides = 2 gives lag = 0
	
	if(plot) {
		ymax <- max(turns_per_sec, na.rm = TRUE)
		print(plot(seq(0,n-1,1)*1000/sampFreq, ylim = c(0, ymax + 1), 
		turns_per_sec, main = paste("EMG, turns A (DT = ", DT, " ms)"), 
		type = "l", xlab = "Time (ms)", ylab = "turnsEMG")) 	
		scale_ <- max(1, 0.05*ymax)
		print(lines(seq(0,n-1,1)*1000/sampFreq, turns*scale_, col = "red"))		
	}	
	
#	return(scale_)
	return(list(turns.ps = turns_per_sec, turns.where = turns)) 
	
}

# Calculates the EMG turns per second (Willison 1963,1964) = here the number of consequtive turns whose amplitude difference exceeds limFact*stdev, counted per unit time. 
# Input: V -- vector with raw EMG data
#		sampFreq -- sampling rate S/s for the EMG data [default: 1000 S/s]
#		limFact -- stdev(V)*limFact determines the minimum difference between consequtive turns that are counted
#        DT -- time window for the averaging in ms [default: 500 ms]
# Output: 
#		list(turns.ps = turns_per_sec, turns.where = turns)
#		turns.ps -- turns per second
#		turns.where -- time points [index] where turns are counted 
EMG_wturns <- function(V, 
					   sampFreq = 1000, 
					   limFact = 1.5, 
					   DT = 250, 
					   plot = FALSE){
	n <- length(V)
	limA <- sd(V)*limFact
	V_ <- V - mean(V) # subtract offset/bias
	y <- diff(V_)
	m <- floor(sampFreq*DT/1000) 	
	if(m < 2) return(-1)
	if(m >= n) return(-2)
	turns <- rep(0,n)
	turnsi <- c(1)
	k <- 1
	
	for(i in 1:(n-2)){
		if(y[i]*y[i+1] < 0)
			if(abs(V_[turnsi[k]] - V_[i+1]) > limA){
				k <- k+1
				turnsi <- c(turnsi, i)
				turns[i+1] <- 1
			}		
		
	}
	filt1 <- 1000*rep(1, m)/DT # normalization corresponds to turns per second
	turns_per_sec <- filter(turns, filt1, sides = 2, method = "convolution") # sides = 2 gives lag = 0
	
	if(plot) {
		ymax <- max(turns_per_sec, na.rm = TRUE)
		print(plot(seq(0,n-1,1)*1000/sampFreq, ylim = c(0, ymax + 1), turns_per_sec, 
		main = paste("EMG, turns B (DT = ", DT, " ms)"), type = "l", 
		xlab = "Time (ms)", ylab = "turnsEMG")) 	
		scale_ <- max(1, 0.05*ymax)
		print(lines(seq(0,n-1,1)*1000/sampFreq, turns*scale_, col = "red"))		
	}
	
	return(list(turns.ps = turns_per_sec, turns.where = turns)) 
}


# EMG turns with histogram method. This is as EMG_wturns but uses the the histogram method
# instead of the *filter* function in order to sum up the turns per second.
EMG_whturns <- function(V, 
					    sampFreq = 1000, 
						limFact = 1.5, 
						DT = 250, 
						plot = FALSE){
	n <- length(V)
	limA <- sd(V)*limFact
	V_ <- V - mean(V) # subtract offset/bias
	y <- diff(V_)
	m <- floor(sampFreq*DT/1000) 	
	if(m < 2) return(-1)
	if(m >= n) return(-2)
	turns <- rep(0,n)
	turnsi <- c(1)
	k <- 1
	
	for(i in 1:(n-2)){
		if(y[i]*y[i+1] < 0)
			if(abs(V_[turnsi[k]] - V_[i+1]) > limA){
				k <- k+1
				turnsi <- c(turnsi, i)
				turns[i+1] <- 1
			}		
		
	}
	
	n_m <- floor(n/m)
	thist <- rep(0, n_m)
	for(i in 1:(n-1)) {
		ii <- floor(i/m)+1
		thist[ii] <- thist[ii] + turns[i] # cumputes the histogram of the nr of turns in the n_m subdivisions of the time interval
	}
	
	thist <- 1000*thist/DT
	
	if(plot) {
		
		ymax <- max(thist, na.rm = TRUE)
		time_ <- 1000*seq(0, n, m)/sampFreq
		print(plot(time_[1:length(thist)], thist, type = "l", main = "EMG turns, histogram method"))
		scale_ <- max(1, 0.05*ymax)
		print(lines(time_[1:length(thist)], turns*scale_, col = "red"))		
	}
	
	return(list(turns.ps = thist, turns.where = turns)) 
}



####  filters --> ####


# boxcar window
filtBoxcar <- function(n){
	if(n < 1) return(-1)
	return(rep(1,n))
} 

# Hann
filtHann <- function(n){
	if(n < 2) return(-1)
	fH <- rep(0,n)
	dummy <- 2*pi/n
	for(i in 1:n) fH[i] <- 0.5*(1- cos(dummy*(i-1)))
	return(fH)
}

# Bartlett -- triangular
filtBartlett <- function(n){
	if(n < 2) return(-1)
	fH <- rep(1,n)
	n2 <- n/2.0
	for(i in 1:n)
		fH[i] <- 1- abs((i - 1 - n2)/n2)
	return(fH)
}

# Welch
filtWelch <- function(n){
	if(n < 2) return(-1)
	fH <- rep(1,n)
	n2 <- n/2.0
	for(i in 1:n)
		fH[i] <- 1- ((i - 0.5 - n2)/n2)^2
	return(fH)
}

### <-- filters ###


#### spectrum functions --> ####


# Power spectrum density (PSD) estimate, 50% overlap method
# Input:
#		V -- EMG data 	
#		filt -- windowing method, one of the filter functions [default: filtWelch]
#		sampFreq -- sampling frequency S/s
#		DT -- window size in terms of ms
# Output:
#		list(psd = pw[1:m2]/scalef, freq = fq, meanf = meanf, medianf = medianf_)
#		psd -- Vector with elements = power (modulus of Fourier coeffcient squared)
#		freq -- frequency values for indexes i = 1 ... m2
#		meanf -- mean frequency
#		medianf -- median frequency
EMG_spec <- function(V, 
					 filt = filtWelch, 
					 sampFreq = 1000, 
					 DT = 256, 
					 highPass = 10, 
					 lowPass = 500, 
					 plot = FALSE){
	m <- floor(sampFreq*DT/1000) # window size in number of points
	if(m < 2) return(-1)
	n <- length(V)
	if(n < 2) return(-2)
	k <- floor(n/m)
	if(k < 2) return(-3)
	m_ <- nextn(m) # friendly size for fft
	filt_ <- filt(m)
	pw <- rep(0, m_)
	for(i in 1:k){
		i0 <- m*(i-1)+1
		i1 <- i0 + m -1
		x <- V[i0:i1]
		x <- x - mean(x)
		x <- x*filt_ # applies windowing function
		if(m_ > m) x <- c(x, rep(0, m_-m)) # zero-padding
		fx <- fft(x)
		pw <- pw + Re(fx*Conj(fx)) # sum squared amplitudes
	}
	
	m2 <- floor(m_/2)
	
	# overlapping windows
	if(m2 > 1)
	for(i in 1:(k-1)){
		i0 <- m*(i-1)+1 + m2
		i1 <- i0 + m -1
		x <- V[i0:i1]
		x <- x - mean(x)
		x <- x*filt_ # applies windowing function
		if(m_ > m) x <- c(x, rep(0, m_-m)) # zero-padding
		fx <- fft(x)
		pw <- pw + Re(fx*Conj(fx))
	}	
	
	fq <- seq(0,m2-1,1)*sampFreq/m_
	
	# calculate mean and median frequency
	meanf <- 0
	sump <- 0
	
	# calculate mean frequncy
	for(i in 1:m2){
		if(fq[i] >= highPass ){
			meanf <- meanf + fq[i]*pw[i]
			sump <- sump + pw[i] 
			if(fq[i] > lowPass) break
		}
	}	
	if(1 + sump == sump) return(-3) 
	meanf <- meanf/sump
	
	med_ <- sump*0.5 # 50% of the total power in the selected bandwidth
	medianf_ <- -1 
	sump_ <- 0
		
	# calculate median frequency
	for(i in 1:m2){
		if(fq[i] >= highPass ){
			sump_ <- sump_ + pw[i] 
			if(sump_ >= med_) { 
				medianf_ <- fq[i]
				break
			}	
		}
	}
	## end mean/median calc ##
	
	scalef <- mean(filt_*filt_)
	
	if(plot){
		print(plot(fq, pw[1:m2]/scalef, type = "l", xlab = "Frequency (Hz)", 
		ylab = "Power",  main = paste("Spectral density (DT =", DT, " ms)")))
	}
	
	return(list(psd = pw[1:m2]/scalef, freq = fq, meanf = meanf, medianf = medianf_)) # scaling equalizes the effects of different filters
	
}


# Auxillary function. Uses fourier power coefficients to calculate mean and median frequency.
# Input:
#		powV --		vector of power coefficients (magnitude of Fourier coeffcients squared)
#		highPass --	lower frequency limit
#		lowPass --	higher frequency limit
#		sampFreq --	sampling frequency (Hz)
# Output:
#		returns list(meanf = meanf, medianf = medianf, parameters = parameters)
#		with
#		parameters = list(fs <- sampFreq, highPass = highPass, lowPass = lowPass)
EMG_meanf <- function(powV, highPass = 10, lowPass = 500, sampFreq = 1000){
        n <- length(powV)
        if(sampFreq < 10) return(-1)
        if(highPass >= lowPass) return(-3)
        T_ <- n/sampFreq 
        n2 <- floor(n/2)  
        if(n2 < 2) return(-2)
        freq <- seq(0,n2-1,1)/T_
        k <- 0
        meanf <- 0
        sump <- 0
        
        # calculate mean frequncy
        for(i in 1:n2){
                if(freq[i] >= highPass ){
                        meanf <- meanf + freq[i]*powV[i]
                        sump <- sump + powV[i] 
                        if(freq[i] > lowPass) break
                }
        }       
        if(1 + sump == sump) return(-3) 
        meanf <- meanf/sump
        
        sump_ <- 0
        med_ <- sump*0.5 # 50% of the total power in the selected bandwidth
        medianf_ <- -1 
        
        # calculate median frequency
        for(i in 1:n2){
                if(freq[i] >= highPass ){
                        sump_ <- sump_ + powV[i] 
                        if(sump_ >= med_) { 
                                medianf <- freq[i]
                                break
                        }       
                }
        }
        
	parameters <- list(fs <- sampFreq, lowPass = lowPass, highPass = highPass)
    return(list(meanf = meanf, medianf = medianf, parameters = parameters))
        
}


# Uses Short Time Fourier Transformation method to calculate mean and median frequency as functions of time.
# Divides the input data into bins of size DT (in ms) for which it calculates the spectrum and the mean/median frequency.
# Uses 50% overlap.
# Input:
#		V -- EMG data
#		filt -- window function
#		sampFreq -- sampling frequency S/s
#		lowPass -- upper limit of the frequency band used for calculating mean/median frequency
#		highPass -- lower limit of the frequency band used for calculating mean/median frequency
#		DT -- window size in ms. Nominal frequency resolution 1/DT.
# Output:
#		list(meanf = meanf_[1,], medianf = meanf_[2,], time = seq(0, 2*k-2,1)*DT_) 
#		meanf -- array with mean frequency vs time
#		medianf -- array with median frequency vs time
#       time -- array with the time values time[i] that correspond to the index values i
EMG_stft_f <- function(V, 
					   filt = filtWelch, 
					   sampFreq = 1000, 
					   lowPass = 10, 
					   highPass = 500, 
					   DT = 256, 
					   plot = FALSE){
	m <- floor(sampFreq*DT/1000) # window size in number of points
	if(m < 2) return(-1)
	n <- length(V)
	if(n < 2) return(-2)
	k <- floor(n/m)
	if(k < 2) return(-3)
	m_ <- nextn(m) # friendly size for fft
	filt_ <- filt(m)
	meanf_ <- matrix(0,2,2*k-1)
		
	for(i in 1:k){
		i0 <- m*(i-1)+1
		i1 <- i0 + m -1
		x <- V[i0:i1]
		x <- x - mean(x)
		x <- x*filt_ # applies windowing function
		if(m_ > m) x <- c(x, rep(0, m_-m)) # zero-padding
		fx <- fft(x)
		pw <- Re(fx*Conj(fx)) # sum squared amplitudes
		lst <- EMG_meanf(pw, lowPass, highPass, sampFreq)
		meanf_[1,2*i-1] <- lst$meanf
		meanf_[2,2*i-1] <- lst$medianf
	}
	
	m2 <- floor(m/2)
	
	# overlapping windows
	if(m2 > 1)
	for(i in 1:(k-1)){
		i0 <- m*(i-1)+1 + m2
		i1 <- i0 + m -1
		x <- V[i0:i1]
		x <- x - mean(x)
		x <- x*filt_ # applies windowing function
		if(m_ > m) x <- c(x, rep(0, m_-m)) # zero-padding
		fx <- fft(x)
		pw <- Re(fx*Conj(fx))
		lst <- EMG_meanf(pw, lowPass, highPass, sampFreq)
		meanf_[1,2*i] <- lst$meanf
		meanf_[2,2*i] <- lst$medianf
	}	
	
	if(plot){
		DT_ <- 1000*n/sampFreq/(2*k-2) # ms
		ymax <- max(meanf_, na.rm = TRUE)
		ymin <- min(meanf_, na.rm = TRUE) 
		print(plot(seq(0, 2*k-2,1)*DT_, meanf_[1,], main = "STFT, mean et median frequency", 
		xlab = "Time (ms)", ylab = "Mean/Median frequency (blue)",  
		ylim = c(ymin, ymax), type = "l"))
		print(lines(seq(0, 2*k-2,1)*DT_, meanf_[2,], col = "blue"))
	}	
	
	parameters = list(fs = sampFreq, lowPass = lowPass, highPass = highPass, DT = DT)
	
	return(list(meanf = meanf_[1,], medianf = meanf_[2,], time = seq(0, 2*k-2,1)*DT_, parameters = parameters))
}

# Calculates and plots the spectrum using the built-in spectrum function <spectrum> with the autoregression method "ar"
# Input:
#		V -- 		raw EMG data 1D
#		sampFreq -- 	sampling frequency
# Output:
#		See the output values for spectrum [command: ?spectrum].	
EMGx_spec <- function(V, sampFreq = 1000, ...){
	V <- V - mean(V)
	spectrum(ts(V, frequency = sampFreq), log = "no", method = "ar", ...)
	return(res)
}

#### EMG-envelope --> ####

# Auxillary filter function
filtfBW0 <- function(freq, freqc, n){
	
	if(1 + freqc == freqc) return(0)
	if(n <= 0) return(0)
	return(1/(1 + (abs(freq/freqc))^n))
}

filtfCrit2 <- function(freq, freqc){
	
	if(1 + freqc == freqc) return(0)
	if(n <= 0) return(0)
	return(1/(1 + 1i*freq/freqc)^2)
}



# EMG low pass filter/envelope function. A zero-lag version of the Butterworth filter.
# Input:
#		V -- 		raw EMG data, 1D array
#		sampFreq -- sampling frequency
#		cutOff -- 	cut-off frequency
#		orderN -- 	order of the filter
# Output:
#		list(bw0 = Re(Vf_[1:n]), time = 1000*seq(0,n-1,1)/sampFreq)
#		bw0 -- 		vector containing filtered output
#		time -- 	the time array (millisecond)
EMG_bw0 <- function(V, 
				    sampFreq = 1000, 
					cutOff = 4, 
					orderN = 4, 
					plot = FALSE){
	n <- length(V)
	V_ <- abs(V - mean(V)) # rectifying
	n_ <- nextn(n) # fft friendly size
	if(n_ > n) V_ <- c(V_, rep(0, n_ - n)) # zero-padding
	T_ = n_/sampFreq
	fV_ <- fft(V_)
	
	# calculating the frequency array fq
	if((n_ %% 2) == 1) { # for odd n_	
		n2_ <- (n_ - 1)/2
		fq <- seq(1,n2_, 1)/T_ 
		fq <- c(0, fq, -rev(fq))
		#fq <- c(0, fq, -fq)
	}
	else { # for even n_
		n2_ <- n_/2
		fq <- seq(1,n2_,1)/T_
		fq	<- c(0, fq, -rev(fq[1:(n2_ -1)]))
		#fq	<- c(0, fq, -fq[1:(n2_ -1)])
	}
	
	# filtering the Fourier coefficients
	for(i in 1:n_) fV_[i] <- fV_[i]*filtfBW0(fq[i], cutOff, orderN)
	# inverse fft and normalization -- for large cutOff it should return the original signal 
	Vf_ <- fft(fV_, inverse = TRUE)/n_
	
	if(plot){
		print(plot(1000*seq(0,n-1,1)/sampFreq, Re(Vf_[1:n]), type = "l", main = paste("EMG envelope (bw0), 
		fc = ", cutOff, " Hz"), xlab = "Time (ms)", ylab = "bw0EMG"))
	}
	
	parameters <- list(fs = sampFreq, fc = cutOff, order = orderN)
	
	return(list(bw0 = Re(Vf_[1:n]), time = 1000*seq(0,n-1,1)/sampFreq, parameters = parameters))
	
}


# EMG low pass filter/envelope function. A phase shifted 2nd order critically damped filter.
# Input:
#		V -- 		raw EMG data, 1D array
#		sampFreq -- sampling frequency
#		cutOff -- 	cut-off frequency
# Output:
#		list(crit2 = Re(Vf_[1:n]), time = 1000*seq(0,n-1,1)/sampFreq)
#		crit2 -- 	vector containing filtered output
#		time -- 	time array (millisecond)
EMG_crit2 <- function(V, 
					  sampFreq = 1000, 
					  cutOff = 4, 
					  plot = FALSE){
	n <- length(V)
	V_ <- abs(V - mean(V)) # rectifying
	n_ <- nextn(n) # fft friendly size
	if(n_ > n) V_ <- c(V_, rep(0, n_ - n)) # zero-padding
	T_ = n_/sampFreq
	fV_ <- fft(V_)
	
	# calculating the frequency array fq
	if((n_ %% 2) == 1) { # for odd n_	
		n2_ <- (n_ - 1)/2
		fq <- seq(1,n2_, 1)/T_ 
		fq <- c(0, fq, -rev(fq))
		#fq <- c(0, fq, -fq)
	}
	else { # for even n_
		n2_ <- n_/2
		fq <- seq(1,n2_,1)/T_
		fq	<- c(0, fq, -rev(fq[1:(n2_ -1)]))
		#fq	<- c(0, fq, -fq[1:(n2_ -1)])
	}
	
	# filtering the Fourier coefficients
	for(i in 1:n_) fV_[i] <- fV_[i]*filtfCrit2(fq[i], cutOff)
	# inverse fft and normalization -- for large cutOff it should return the original signal 
	Vf_ <- fft(fV_, inverse = TRUE)/n_
	
	if(plot){
		print(plot(1000*seq(0,n-1,1)/sampFreq, Re(Vf_[1:n]), type = "l", main = paste("EMG envelope (crit2), fc = ", 
		cutOff, " Hz"), xlab = "Time (ms)", ylab = "crit2EMG"))
	}

	parameters = list(fs = sampFreq, fc = cutOff)
	
	return(list(crit2 = Re(Vf_[1:n]), time = 1000*seq(0,n-1,1)/sampFreq), parameters = parameters)
}


#### <-- EMG-envelope ####

#### <-- spectrum functions ####

#### simulated EMG --> #####

# Simulates stationary EMG signal with power spectrum density determined by the parameters lF (low frequency) and hF (high frequeny). 
# Model by E Shwedik et al 1977, IEEE Trans BME 24:417-24 (see also SENIAM 1999:70).
# Input:
#		n -- 				size of output data
#		sampFrequency -- 	sampling frequency
#		lF -- 				determines the low frequency end of the power spectrum
#		hF -- 				determines the high frequency end of the power spectrum (these parameters determine the theretical 
#			  				mean frequency of the power spectrum.
# Output:
#		list(sim = x[1:n], lF = lF, hF = hF, maxpowf = maxpowf, meanf = meanf)
#		sim -- 		simulated EMG data
#		hF -- 		high frequency limit parameter
#		lF -- 		low frequency limit parameter
#		maxpowf -- 	theoretical estimate of frequency where power will peak
#		meanf --  	theoretical mean frequency
EMG_sim <- function(n = 2048, 
					sampFreq = 1000, 
					lF = 10, 
					hF = 100, 
					plot = FALSE){
	if(n < 10) return(-1)
	if(sampFreq < 1) return(-2)
	if(lF >= hF) return(-3)
	n_ <- nextn(n) # friendly number for fft
	T_ <- n/sampFreq
	fq <- seq(1,n_,1)/T_ # frequency array
	amp <- rep(1,n_)
	arg <- runif(n_,0,1)*2*pi
	for(i in 1:n_) amp[i] <- exp(1i*arg[i])*hF^2*fq[i]/(sqrt(fq[i]^2 + lF^2)*(fq[i]^2 + hF^2))
	# apply inverse fft to simulated Fourier coefficients which must be an array of type 
	# c(c_0, c_1, ..., c_n, Conj(c_n, ..., c_1)) in order to produce a real signal. c_0 corresponds to the mean value of the signal. -->
	fx <- c(c(0,amp), Conj(rev(amp))) 
	x <- Re(fft(fx, inverse = TRUE))
	
	err <- 1
	
	if(lF >= hF) {
		 meanf <- "Err: lF set larger than hF"
		 maxpowf <- "Err: lF set larger than hF"
		err <- -1
	}
	if(lF < 1) {
		meanf <- "Err: lF too small"
		maxpowf <- "Err: lF too small"
		err <- -2
	}
	
	if(err > 0){
		meanf <- (2*hF/pi)*(hF^2 -lF^2 - 2*lF^2* log(hF/lF))/(hF - lF)^2 # theoretical mean frequency
		maxpowf <- sqrt(sqrt((hF/2)^4 + (lF*hF)^2/2) - (lF/2)^2) # theoretical frequency where max power is attained
	}	
		
	if(plot){
		print(plot(1000*seq(0,n-1,1)/sampFreq, x[1:n], type = "l", main = paste("Simulated EMG (lF = ", lF, ", hF = ", hF, ")"), 
		xlab = "Time (ms)", ylab = "simEMG"))
	}
	
	parameters <- list(fs = sampFreq, lF = lF, hF = hF)
	
	return(list(sim = x[1:n], maxpowf = maxpowf, meanf = meanf, parameters = parameters))
}   



#### <-- simulated EMG #####

#### Correlation, coherence funs --> ####


# Calculates the statistical coherency of two timeseries X and Y of the same length: 
#
#		coh(f) = <Conj(X(f))*Y(f)>/sqrt(<Conj(X(f))*X(f)>)/sqrt(<Conj(Y(f))*Y(f)>).
#
# It is based on an averaging procedure <.> which is defined by dividing the times serie 
# into blocks of time length DT. Quantities Q are calculated for these blocks and one 
# obtains <Q> by averaging Q over the blocks. For the blocks we use here a 50 % overlap.
# Input:
#		X -- 			data array 1D
#		Y -- 			data array 1D
#		sampFreq -- 	sampling frequency of the time series
#		DT -- 			size of the blocks in milliseconds
# Output:
#		list(coh = z, freq = fq, transf = h)
# 		coh -- 			coherency vector 
#		freq -- 		frequency (i-1)/DT up to i = floor(m/2)
#		transf -- 		transfer function H, y = H*x + n, in the frequency domain  
EMG_coh <- function(X, 
					Y, 
					sampFreq = 1000, 
					DT = 2000, 
					plot = FALSE){
	m <- floor(sampFreq*DT/1000) # window size in number of points
	if(m < 2) return(-1)
	n <- length(X)
	ny <- length(Y)
	if(ny != n) return(-4)
	if(n < 2) return(-2)
	k <- floor(n/m)
	if(k < 2) return(-3)
	m_ <- nextn(m) # friendly size for fft
#	m_ <- next2n(m)
	fxy <- rep(0, m_)
	fxx <- rep(0, m_)
	fyy <- rep(0, m_)
	
#	return(c(m_, n))
	
	for(i in 1:k){
		i0 <- m*(i-1)+1
		i1 <- i0 + m -1
		x <- X[i0:i1]
		x <- x - mean(x)
		y <- Y[i0:i1]
		y <- y - mean(y)
		
		if(m_ > m) {
			x <- c(x, rep(0, m_-m)) # zero-padding
			y <- c(y, rep(0, m_-m))
		}	
		fx <- fft(x)
		fxx <- fxx + Conj(fx)*fx
		fy <- fft(y)
		fyy <- fyy + Conj(fy)*fy
		fxy <- fxy + Conj(fx)*fy
	}
	
	m2 <- floor(m/2)
	
	# overlapping windows
	if(m2 > 1)
	for(i in 1:(k-1)){
	
		i0 <- m*(i-1)+1 + m2
		i1 <- i0 + m -1
		x <- X[i0:i1]
		x <- x - mean(x)
		y <- Y[i0:i1]
		y <- y - mean(y)
		
		if(m_ > m) {
			x <- c(x, rep(0, m_-m)) # zero-padding
			y <- c(y, rep(0, m_-m))
		}	
		
		fx <- fft(x)
		fxx <- fxx + Conj(fx)*fx
		fy <- fft(y)
		fyy <- fyy + Conj(fy)*fy
		fxy <- fxy + Conj(fx)*fy
	}	
	
	fxxyy <- sqrt(abs(fxx))*sqrt(abs(fyy))
#	mx <- min(abs(fxxyy))
#	if(mx + 1 == 1) fxxyy <- fxxyy + 1e-15
	z <- fxy/fxxyy
	h <- fxy/fxx # transfer function
	z <- z[1:m2]
	fq <- seq(0,m2-1,1)*sampFreq/m_ 	
	
	if(plot){
		maxy <- max(abs(c(Re(z), Im(z))))
		print(plot(fq, Re(z), 
		ylim = c(-maxy, maxy), type = "l", main = paste("Coherence plot, DT = ", DT, " (ms)"), 
		xlab = "Frequency", ylab = "Re (blue)/Im (red)", col = "blue"))
		print(lines(fq, Im(z), col = "red"))
	}
	
	return(list(coh = z, freq = fq, transf = h[1:m2]))
}


# Cross Correlation function ccf(t) := <X(u)Y(u-t)> /sqrt(<X^2>*<Y^2>) calculated using the fft method.
# This can be used for investigating e.g. whether Y contains a rough time shifted copy of X.
# Mean values ere subtracted from X and Y before proscessing.
# Input:
#		X -- 			vector with data points 
#		Y -- 			vector with data points
#		m -- 			2*m points in the ccf plot 
#		sampFreq -- 	sampling frequency
# Output:
#		list(ccf = ccf_, lag = lag, parameters = parameters)
#		ccf	--			2*m-1 ccf complex coefficients centered on zero lag
#		lag --        	lag ms
#		additional parameters can be passed to plot function
EMG_ccf <- function(X, 
					Y, 
					m = 50, 
					sampFreq = 1000, 
					plot = FALSE, ...){
	
	n <- length(X)
	if(m < 1) m <- 50
	if(n < 2*m+1) return(-3)
	if(sampFreq < 1) return(-2)
	
	if(length(Y) != n) return(-1)
	
	n_ <- nextn(1*n)

	time <- 1000*seq(0, n_ -1, 1)/sampFreq  # time in ms
		
	 	X_ <- X - mean(X)
		Y_ <- Y - mean(Y)
	
	if(n_ > n){
		fx <- fft(c(X_, rep(0, n_-n)))
		fy <- fft(c(Y_, rep(0, n_-n)))
	}	
	else {
		fx <- fft(X_)
		fy <- fft(Y_)
	}
	
	fxy <- fft(Conj(fx)*fy, inverse = TRUE)/n_
	
	w <- fxy/(sqrt(sum(X_^2))*sqrt(sum(Y_^2)))	
		
	ccf_ <- c(w[(n_-m + 1):(n_-1)], w[1:m]) # ccf coefficents centered on zero lag
	
	lag <- seq(-m+1,m-1, 1)*1000/sampFreq # lag in ms
	
	if(plot){
	#	print(plot(time[1:n], Re(w[1:n]), main = "Correlation", xlab = "Time (ms)", type = "l", ...))
		print(plot(lag, Re(ccf_), main = "Correlation", xlab = "Lag (ms)", type = "l", ylab = "CCF", ...))
	}
	
	parameters <- list(fs = sampFreq, n = n, m = m)
	
	return(list(ccf = ccf_, lag = lag, parameters = parameters))	
	
}


# EMG coherency fun based on the built-in spectrum function and plot.spec.coherency
# For information run ?spectrum
EMGx_coh <- function(X, Y, sampFreq = 1000, ...){

	n <- length(X)
	xy <- c(X - mean(X),Y - mean(Y))
	xy <- matrix(xy, n, 2)
	res <- spectrum(ts(xy, frequency = sampFreq), log = "no", plot = FALSE,  ...)
	#res <- spec.pgram(ts(xy, frequency = sampFreq), log = "no", plot = TRUE,  ...)
	print(plot.spec.coherency(res))	
	return(res)
}

# EMG CCF function based on the built-in ccf function. Lag opposite to EMG_ccf.
# For information run ?ccf 
EMGx_ccf <- function(X, Y, sampFreq = 1000, title = "Cross-correlation", ...){
	
	ccf_ <- ccf(ts(X - mean(X), frequency = sampFreq), ts(Y - mean(Y), frequency = sampFreq), type = "c")
	
	return(ccf_)
}

#### <-- Correlation, coherence funs ####

# Morlet-vTscharner Filter Bank Intensity Analysis inspired by v Tscharner (2000), J of Electromyography and Kinesiology 10: 433 - 445.
# The first version of this was written for Matlab v 6.1.
# Input: 
#	 	V -- 		1-dim data 
#	 	fs -- 		sampling frequency of data (S/s)
# 		alpha -- 	sqrt(alpha) characterizes the width of the freg. distribution of the Morlet function [typ. value alpha = 150]
# 		J -- 		number of center frequencies, indexed j = 0, ..., J-1 [typ. value J = 10]
# 		q -- 		offset parameter that determines the values of the center frequencies [typ. value q = 1.45]
# 		scale -- 	scale parameter that determines the values of the center frequencies [typ. value q = 0.5]
#		fc_exp --   exponent in the formula for the center frequencies [typical value 2.0]	
# 	
# Output:
# 		list(powc = B, freqc = Fc, meanf = meanf, parameters = parameters) 
#		powc -- 		N*J-matrix consisting of J columns (of size N) with power values corresponding to the center frequencies (index j), powc[time, freqc]  
# 		freqc -- 	array of the center frequenices
#		meanf -- 	array of time indexed mean frequencies based on averaging the center frequencies using power as weight
#		parameters -- list of the parameters = list(alpha = alpha, J = J, q = q_, fc_exp = fc_exp, scale = scale_)
EMG_morvt <- function(V, 
					  fs = 1000, 
					  alpha = 150, 
					  J = 10, 
					  q_ = 1.45, 
					  scale_ = 0.5, 
					  fc_exp = 2,
					  plot = FALSE) {

 explimit <- 20 # if x > explimit set exp(-x) = 0
 n <- length(V) 
 n_ <- nextn(n)
 T_ <- n_/fs 

 time <- seq(1,n,1)*1000/fs	
 
# calculating the frequency array fq
	if((n_ %% 2) == 1) { # for odd n_	
		n2_ <- (n_ - 1)/2
		fq <- seq(1,n2_, 1)/T_ 
		fq <- c(0, fq, -rev(fq))
		#fq <- c(0, fq, -fq)
	}
	else { # for even n_
		n2_ <- n_/2
		fq <- seq(1,n2_,1)/T_
		fq	<- c(0, fq, -rev(fq[1:(n2_ -1)]))
		#fq	<- c(0, fq, -fq[1:(n2_ -1)])
	}
 I_ <- seq(0, J-1, 1)
 Fc <- (q_ + I_)^fc_exp/scale_ # center frequencies according to the r = 2 formula
 lambda <- 2*pi*pi/alpha
 if(n_ > n)
	FX <- fft(c(V - mean(V), rep(0, n_ - n)))
 else
	FX <- fft(V - mean(V))
 
 B <- matrix(0, n, J)
 powc <- matrix(0, n, J)
 Q <- rep(0, n_)
 
  
 for(j in 1:J) {
	dummy <- lambda/Fc[j]
	for(k in 1:n_){
		u <- dummy*(fq[k] - Fc[j])^2
	#	return(u > explimit)
		if(u > explimit) 
			Q[k] <- 0
		else 
			Q[k] <- 1/exp(u)
	}
 
	S <- fft(FX*Q, inverse = TRUE)
	#powc[,j] <- abs(S[1:n]^2)/n/n
	powc[,j] <- abs(S[1:n]^2)/n_
 }
 
 meanf <- rep(0,n)
 
 for(i in 1:n)
	meanf[i] = mean(Fc*powc[i,])/mean(powc[i,])
 
	if(plot){
		
		maxp <- max(powc)
		labels = round(Fc[1:J])
		plot(time, powc[,1]/maxp, ylim = c(0,J), type = "l", yaxt = "n", main = "Morlet-vT Intensity analysis", 
		xlab = "Time (ms)", ylab = "Center frequency")
		if(J > 1)
		for(j in 2:J)
			lines(time, powc[,j]/maxp + j -1)
		axis(side = 2, at = 0:(J-1), labels = labels)
	} 
 
 parameters <- list(alpha = alpha, J = J, q = q_, fc_exp = fc_exp, scale = scale_)
 return(list(powc = powc, freqc = Fc, meanf = meanf, parameters = parameters))
 
}

# The Morlet function in frequency space
# Input:
#	f -- 		frequency argument
#	alpha --	sqrt(alpha) characterizes the width of the freg. distribution of the Morlet function [typ. value alpha = 150]
#	fc -- 	    center frequency
# Output:
#   function value		
EMG_fmorlet <- function(f = 0,
						alpha = 150,
						fc = 100){

	z <- 2*(pi^2)*((f - fc)^2)/alpha/fc
#	if(z > 30) return(0)
	return(1/exp(z))	
						
}

# Plots ten (or any other number) Morlet functions in frequency space at the center frequencies,
# and the sum of all the functions.
# Input:
# 		n -- 		number of points to be plotted
#		fmax --		upper range of the frequency interval
# For other input parameters see the function EMG_morvt.
# Output:
# Returns list(sum = ftot, freqc = Fc, parameters = parameters)
EMG_morvt_demo1 <- function(n = 1000, 
							fmax = 500, 
							alpha = 150, 
							J = 10, 
							q_ = 1.45, 
							scale_ = 0.5, 
							fc_exp = 2,
							plot = TRUE){

	
	
 if(n < 100) n <- 100
 f <- seq(1,n,1)*fmax/n 		
 I_ <- seq(0, J-1, 1)
 Fc <- (q_ + I_)^fc_exp/scale_ # center frequencies 
 
 ftot <- rep(0, n)
 for(j in 1:J) ftot <- ftot + EMG_fmorlet(f = f, alpha = alpha, fc = Fc[j])
 maxx <- max(1.2, ftot)
 
 xlab <- "Frequency (Hz)"
 ylab <- "Amplitude"
 main <- "Morlet-vT frequency decomposition"	
 
 if(plot){
	plot(f, EMG_fmorlet(f = f, alpha = alpha, fc = Fc[1]), ylim = c(0, maxx), 
	xlab = xlab, ylab = ylab, main = main, type = "l")
	for(j in 2:J) lines(f, EMG_fmorlet(f = f, alpha = alpha, fc = Fc[j]))
    lines(f, ftot, col = "red")
 }

 parameters <- list(n = n, fmax = fmax, alpha = alpha, J = J, q = q_, fc_exp = fc_exp, scale = scale_)
 return(list(sum = ftot, freqc = Fc, parameters = parameters))
}

#########################################################################

# Cauchy wavelet in frequency space
# Input:
#		f -- 			frequency (f >= 0)
#		s -- 			scale
#		fc -- 			center frequency
#
# Output:
#		function value (real valued)	
#

EMG_Cauchy <- function( f = 0,
					    fc = 10,
						s = 0.3){
	
	if(f < 0) return(0)
	if(fc <= 0) return(0)
	eta <- s*fc
	x <- f/fc
	z <- exp((1-x)*eta)
	z <- (x^eta)*z
	return(z)	
}						

# Plots ten (or any other number) Cauchy functions in frequency space at the center frequencies,
# and the sum of all the functions.
# Input:
# 		n -- 		number of points to be plotted
#		fmax --		upper range of the frequency interval
# For other input parameters see the function EMG_cauchyvt.
# Output:
# Returns list(sum = ftot, freqc = Fc, parameters = parameters)
EMG_cauchy_demo1 <- function(n = 1000, 
							fmax = 500, 
							J = 10, 
							q_ = 1.45, 
							scale_ = 0.5,
							fc_exponent = 2,	
							plot = TRUE){

	
	
 if(n < 100) n <- 100
 f <- seq(1,n,1)*fmax/n 		
 I_ <- seq(0, J-1, 1)
 Fc <- (q_ + I_)^fc_exponent/scale_ # center frquencies
 
 ftot <- rep(0, n)
 for(j in 1:J) ftot <- ftot + EMG_Cauchy(f = f, fc = Fc[j], s = scale_)
 maxx <- max(1.2, ftot)
 
 xlab <- "Frequency (Hz)"
 ylab <- "Amplitude"
 main <- "Cauchy-vT frequency decomposition"	
 
 if(plot){
	plot(f, EMG_Cauchy(f = f, fc = Fc[1], s = scale_), ylim = c(0, maxx), 
	xlab = xlab, ylab = ylab, main = main, type = "l")
	for(j in 2:J) lines(f, EMG_Cauchy(f = f, fc = Fc[j], s = scale_))
    lines(f, ftot, col = "red")
 }

 parameters <- list(n = n, fmax = fmax, fc_exp = fc_exponent, J = J, q = q_, scale = scale_)
 return(list(sum = ftot, freqc = Fc, parameters = parameters))
}


# Cauchy-vTscharner Filter Bank Intensity Analysis defined by v Tscharner (2000), J of Electromyography and Kinesiology 10: 433 - 445.
# Employs the damping factor and the smoothing of the **power**.
# This implementation made in cooperation with W Jeffrey Armstrong.
# Uses a Gaussian filter for low pass filtering *power*.
# Input: 
#	 	V -- 		1-dim data 
#	 	fs -- 		sampling frequency of data (S/s)
# 		J -- 		number of center frequencies, indexed j = 0, ..., J-1 [typ. value J = 10]
# 		q -- 		offset parameter that determines the values of the center frequencies [typ. value q = 1.45]
# 		scale -- 	scale parameter that determines the values of the center frequencies [typ. value q = 0.5]
# 	
# Output:
# 		list(powc = B, freqc = Fc, meanf = meanf, parameters = parameters) 
#		powc -- 		N*J-matrix consisting of J columns (of size N) with power values corresponding to the center frequencies (index j), powc[time, freqc]  
#		aver_pow_x --	average power of the in data V (this is essentially sd(V)^2
#		aver_pow_y --   average power based on the powc output
# 		freqc -- 	array of the center frequenices
#		meanf -- 	array of time indexed mean frequencies based on averaging the center frequencies using power as weight
#		parameters -- list of the parameters = list(alpha = alpha, J = J, q = q_, scale = scale_)
EMG_cauchyvt <- function(V, 
					  fs = 1000, 
					  J = 11, # must be at least 2
					  q_ = 1.45, 
					  scale_ = 0.3,  # value 0.3 adapted for EMG
					  fc_exp = 1.959,
					  plot = FALSE) {


 if(J < 2) return(-1)
 
 n <- length(V) 
 n_ <- nextn(n)
 
 T_ <- n_/fs 

 time <- seq(1,n,1)*1000/fs	
 
# calculating the frequency array fq
	if((n_ %% 2) == 1) { # for odd n_	
		n2_ <- (n_ - 1)/2
		fq <- seq(1,n2_, 1)/T_ 
		fq <- c(0, fq, -rev(fq))
		#fq <- c(0, fq, -fq)
	}
	else { # for even n_
		n2_ <- n_/2
		fq <- seq(1,n2_,1)/T_
		fq	<- c(0, fq, -rev(fq[1:(n2_ -1)]))
		#fq	<- c(0, fq, -fq[1:(n2_ -1)])
	}
 I_ <- seq(0, J-1, 1)
 Fc <- (q_ + I_)^fc_exp/scale_ # center frequencies 

 if(n_ > n)
	FX <- fft(c(V - mean(V), rep(0, n_ - n)))
 else
	FX <- fft(V - mean(V))
 
 B <- matrix(0, n_, J)
 powc <- matrix(0, n, J)
 Q <- rep(0, n_)
 G <- rep(0, n_)
 Q1 <- matrix(0, n_, J)
   
	for(j in 1:J) {

		for(k in 1:n_){
			Q1[k,j] <- EMG_Cauchy(f = fq[k], fc = Fc[j], s = scale_)
		}
 
	}
 
	for(j in 1:J) {

		for(k in 1:n_){
			Q[k] <- EMG_Cauchy(f = fq[k], fc = Fc[j], s = scale_)
			G[k] <- fkGauss(j, fq[k])
			for(s in 1:(J-2))
				if(fq[k] > (Fc[s]+Fc[s+1])/2 & fq[k] <= (Fc[s+1]+Fc[s+2])/2)
					Q[k] <- Q[k]/sqrt(Q1[k,s]^2 + Q1[k,s+1]^2 + Q1[k,s+2]^2)  # **damping**
			
		}
		S <- fft(FX*Q, inverse = TRUE) # apply Cauchy-vT filter
		B[,j] <- 2*abs(S[1:n_]^2)/n_   # **power**
		B[,j] <- Re(fft(fft(B[,j])*G, inverse = TRUE))/n_ # low pass Gauss filtering of **power**
		powc[,j] <- B[1:n, j]
	}
  
 meanf <- rep(0,n)
 
 for(i in 1:n)
	meanf[i] = mean(Fc*powc[i,])/mean(powc[i,])
 
	if(plot){
		
		maxp <- max(powc)
		labels = round(Fc[1:J])
		plot(time, powc[,1]/maxp, ylim = c(0,J), type = "l", yaxt = "n", main = "Cauchy-vT Intensity analysis w/ Gaussian filter and damping", 
		xlab = "Time (ms)", ylab = "Center frequency")
		if(J > 1)
		for(j in 2:J)
			lines(time, powc[,j]/maxp + j -1)
		axis(side = 2, at = 0:(J-1), labels = labels)
	} 
 
 aver_pow_x <- sd(V)^2 # average power of signal
 aver_pow_y <- sum(powc)/n/n # average power based on the powc output
 parameters <- list(J = J, q = q_, fc_exp = fc_exp, scale = scale_)
 return(list(powc = powc, aver_pow_x = aver_pow_x, aver_pow_y = aver_pow_y, freqc = Fc, meanf = meanf, parameters = parameters))
 
}


# Cauchy-vTscharner Filter Bank Intensity Analysis defined by v Tscharner (2000), J of Electromyography and Kinesiology 10: 433 - 445.
# Adaption for MMG: Beck et alii (2008), Biomedical Signal Processing and Control 3: 255 - 266.
# Employs the damping factor and the smoothing of power.
# This implementation made in cooperation with W Jeffrey Armstrong.
# Uses a Gaussian filter for low pass filtering of **power**.
# Input: 
#	 	V -- 		1-dim data 
#	 	fs -- 		sampling frequency of data (S/s)
# 		J -- 		number of center frequencies, indexed j = 0, ..., J-1 [typ. value J = 10]
# 		q -- 		offset parameter that determines the values of the center frequencies [typ. value q = 1.45]
# 		scale -- 	scale parameter that determines the values of the center frequencies [typ. value q = 0.5]
# 	
# Output:
# 		list(powc = B, freqc = Fc, meanf = meanf, parameters = parameters) 
#		powc -- 		N*J-matrix consisting of J columns (of size N) with power values corresponding to the center frequencies (index j), powc[time, freqc]  
#		aver_pow_x --	average power of the in data V (this is essentially sd(V)^2
#		aver_pow_y --   average power based on the powc output
# 		freqc -- 	array of the center frequenices
#		meanf -- 	array of time indexed mean frequencies based on averaging the center frequencies using power as weight
#		parameters -- list of the parameters = list(alpha = alpha, J = J, q = q_, scale = scale_)
EMG_cauchyvt2 <- function(V, 
					  fs = 1000, 
					  J = 11, # must be at least 2
					  q_ = 1.45, 
					  scale_ = 1,  # value 1 adapted for MMG
					  fc_exp = 1.959,
					  plot = FALSE) {


 if(J < 2) return(-1)
 
 n <- length(V) 
 n_ <- nextn(n)
 
 T_ <- n_/fs 

 time <- seq(1,n,1)*1000/fs	
 
# calculating the frequency array fq
	if((n_ %% 2) == 1) { # for odd n_	
		n2_ <- (n_ - 1)/2
		fq <- seq(1,n2_, 1)/T_ 
		fq <- c(0, fq, -rev(fq))
		#fq <- c(0, fq, -fq)
	}
	else { # for even n_
		n2_ <- n_/2
		fq <- seq(1,n2_,1)/T_
		fq	<- c(0, fq, -rev(fq[1:(n2_ -1)]))
		#fq	<- c(0, fq, -fq[1:(n2_ -1)])
	}
 I_ <- seq(0, J-1, 1)
 Fc <- (q_ + I_)^fc_exp/scale_ # center frequencies 

 if(n_ > n)
	FX <- fft(c(V - mean(V), rep(0, n_ - n)))
 else
	FX <- fft(V - mean(V))
 
 B <- matrix(0, n_, J)
 powc <- matrix(0, n, J)
 Q <- rep(0, n_)
 G <- rep(0, n_)
 Q1 <- matrix(0, n_, J)
   
	for(j in 1:J) {

		for(k in 1:n_){
			Q1[k,j] <- EMG_Cauchy(f = fq[k], fc = Fc[j], s = scale_)
		}
 
	}
 
	for(j in 1:J) {

		for(k in 1:n_){
			Q[k] <- EMG_Cauchy(f = fq[k], fc = Fc[j], s = scale_)
			G[k] <- fk2Gauss(j, fq[k])
			for(s in 1:(J-2))
				if(fq[k] > (Fc[s]+Fc[s+1])/2 & fq[k] <= (Fc[s+1]+Fc[s+2])/2)
					Q[k] <- Q[k]/sqrt(Q1[k,s]^2 + Q1[k,s+1]^2 + Q1[k,s+2]^2)  # **damping**
			
		}
		S <- fft(FX*Q, inverse = TRUE) # apply Cauchy-vT filter
		B[,j] <- 2*abs(S[1:n_]^2)/n_   # **power**
		B[,j] <- Re(fft(fft(B[,j])*G, inverse = TRUE))/n_ # low pass Gauss filtering of **power**
		powc[,j] <- B[1:n, j]
	}
  
 meanf <- rep(0,n)
 
 for(i in 1:n)
	meanf[i] = mean(Fc*powc[i,])/mean(powc[i,])
 
	if(plot){
		
		maxp <- max(powc)
		labels = round(Fc[1:J])
		plot(time, powc[,1]/maxp, ylim = c(0,J), type = "l", yaxt = "n", main = "Cauchy-vT Intensity analysis w/ Gaussian filter and damping", 
		xlab = "Time (ms)", ylab = "Center frequency")
		if(J > 1)
		for(j in 2:J)
			lines(time, powc[,j]/maxp + j -1)
		axis(side = 2, at = 0:(J-1), labels = labels)
	} 
 
 aver_pow_x <- sd(V)^2 # average power of signal
 aver_pow_y <- sum(powc)/n/n # average power based on the powc output
 parameters <- list(J = J, q = q_, fc_exp = fc_exp, scale = scale_)
 return(list(powc = powc, aver_pow_x = aver_pow_x, aver_pow_y = aver_pow_y, freqc = Fc, meanf = meanf, parameters = parameters))
 
}


# Gaussian filter -->

fk2Gauss <- function(j = 0, f = 0){ # filter in frequency space adapted for MMG
	sigma <- 0
	if(j == 1) sigma <- 114.75 # 3/8 * time resolution in ms [Beck et al 2008] for scale = 1, q = 1.45
	if(j == 2) sigma <- 66.75
	if(j == 3) sigma <- 48.75
	if(j == 4) sigma <- 38.25
	if(j == 5) sigma <- 31.5
	if(j == 6) sigma <- 27
	if(j == 7) sigma <- 23.25
	if(j == 8) sigma <- 21
	if(j == 9) sigma <- 18.75
	if(j == 10) sigma <- 16.5
	if(j == 11) sigma <- 15.75
	if(sigma < 0.001) return(1)
	sigma <- sigma/1000 # from ms to sec 
	return (exp(-(2*(pi*f*sigma)^2))) # filter in frequency space: sigma(freq)*sigma(time) = 1/2/pi

}

fkGauss <- function(j = 0, f = 0){ # filter in frequency space adapted for EMG
	sigma <- 0
	if(j == 1) sigma <- 28.69 # 3/8 * time resolution in ms [v Tscharner 2000] for scale = 0.3, q = 1.45
	if(j == 2) sigma <- 22.12
	if(j == 3) sigma <- 15.19
	if(j == 4) sigma <- 11.81
	if(j == 5) sigma <- 9.75
	if(j == 6) sigma <- 8.06 
	if(j == 7) sigma <- 7.31 
	if(j == 8) sigma <- 6.19 
	if(j == 9) sigma <- 5.62
	if(j == 10) sigma <- 5.06 
	if(j == 11) sigma <- 4.50
	if(sigma < 0.001) return(1)
	sigma <- sigma/1000 # from ms to sec 
	return (exp(-(2*(pi*f*sigma)^2))) # filter in frequency space: sigma(freq)*sigma(time) = 1/2/pi

}




#######################################################################
# Multi-resolution analysis (MRA). A wrapper for mra function of the <wavelets> package.
# Input:
#		X --			EMG data, vector
#		sampFreq -- 	Sampling freguency
#		J -- 		number of levels, restricted by the size if the filter and data [see Jmax in the code below]
#		filter --     the wavelet filter: haar, d4, d6, ..., d20 (Daubechies), c6, c12, ..., c30, and so on. For information enter ?wt.filter  
#		plot --		if set TRUE plots the detail D decomposition of the signal
#		... --		paramters that can be passed on to the mra function
# Output:
#		returns the output of the mra function, for information enter ?mra 
#		The output is a S4 class object with slots. For instance, the detail coefficients are in @D[[level]], and the sum coefficients in @S[[level]
EMGx_mra <- function(X, 
					 sampFreq = 1000, 
					 J = Jmax, # use J = Jmax to obtain full resolution 
					 filter = "haar", 
					 plot = FALSE, 
					 title = paste("MRA, filter = ", filter), ...){

	n <- length(X)
	
	n_ <- nextn(n,2) # mra fun *seems* to require data size = power of 2
	
	X_ <- X
	
	if(n_ > n) X_ <- c(X, rep(0, n_ - n)) 
	
	if(sampFreq < 1) return(-2) 
	
	time <- seq(1,n,1)*1000/sampFreq
	
	library(wavelets)
	
	filter_info <- wt.filter(filter)
	
	fn <- filter_info@L # filter length
	
	Jmax <- floor(log((n-1)/(fn-1) +1)/log(2)) # highest level of resolution
	
	if(J > Jmax){
		print(paste("Too big J. Jmax = ", Jmax))
		return(-1)
	}	
	
	xw <- mra(X_, n.levels = J, filter = filter, ...)
	mx <- max(X) 
	nl <- xw@level # number of levels
	
	# sums the components ...
	
	sumF <- rep(0,n)
	sumF <- xw@S[[nl]][1:n] + xw@D[[nl]][1:n]
	for(i in 1:(nl-1)) sumF <- sumF + xw@D[[i]][1:n] 
	
	# sumF is the reconstituted signal, should be = X
	
	if(plot){
		labels = 1:nl
		print(plot(time, X/mx, ylim = c(-1,J+1), col = "green",  type = "l", yaxt = "n", main = title, 
		xlab = "Time (ms)", ylab = "Level"))
		if(nl > 1)
		for(j in 1:nl)
			#print(lines(xw@D[[j]]/mx + j))
		  print(lines(time, xw@D[[j]]/mx + j))
		axis(side = 2, at = 0:(nl), labels = c("EMG",labels))
		
	}
	parameters = list(fs = sampFreq, J = J, Jmax = Jmax, filter = filter)
	return(list(mra = xw, parameters = parameters))

}


# Downsamples vector X[1:n] with n points to a vector z with n2 < n points
# Input:
#		X --		data vector
#		n --		n must be of the size of X or less
#		n2 --	size of downsampled vector z
# Output:
#		z -- 	downsampled vector (returned by the function)	
downSample <- function(X, n, n2){
	if(n2 < 2) return(-1)
	z <- rep(0, n2)
	for(i in 1:n2){
		j <- 1 + floor((i*(n-1)/n2))
		z[i] <- X[j]
	}
	return(z)	
}