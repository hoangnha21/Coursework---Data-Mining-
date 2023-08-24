x <- c(9,8,12,6,1,10,10,10,8,516,8,6,4,19,100)
# a. Compute the mean of x
mean_res <- mean(x)
cat('Mean : ' , mean_res)

# b. compute the standard deviation of x
sd_res<-sd(x)
cat('Standard Deviation : ' , sd_res)
# c. compute the range of x
rng_res= range(x)
cat('Range : ', rng_res)

#d. Provide five number summary of x
f_no=fivenum(x)
cat('Five Number Summary : ' , f_no)

#e. Is there any NA in x?
cat("NA checking :")
l=length (x)
if(sum(!is.na( x ))==l)
  cat("There is no any NA in x")

#f. Are there any outliers in x
OutVals= x[which(x %in% boxplot.stats(x)$out)]
cat("Outliers :" ,OutVals)

#REMOVING OUTLIERs
x = x[x!= OutVals]
cat("After Removing outliers new series will be : " ,x)

