#define a matrix
source("cachematrix.R")
x<-matrix(rnorm(36),4,4)
#make list of functions by calling makeCacheMatrix
my_list <- makeCacheMatrix(x)
#Calculate Inverse of the matrix
invxCal<-cacheSolve(my_list)
#extract from cache
invx<-cacheSolve(my_list)
