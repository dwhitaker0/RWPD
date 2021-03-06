peakarea <- function(fitresults,x,peakheight,shape){
	# If the function is lorentzian function, the fitness should be defined as follows.
	# The fitresults are the fitting results of GA.
	# The peakheight is the results of the PEAKHEIGHTS function.
	# The yf is a collection of each fitting peak.
	NumPeaks <- length(peakheight);
	g <- matrix(0,NumPeaks,length(x))
	yf <- matrix(0,NumPeaks,length(x))
	area <- matrix(0,1,NumPeaks)
	for(m in 1:NumPeaks){
		g[m,] <- peakshape(x,fitresults[2*m-1],fitresults[2*m],1);
		yf[m,] <- g[m,]*peakheight[m];
		area[m] <- integration(x,yf[m,]);
	}
	output <- list(area=area,yf=yf)
	return(output)
}