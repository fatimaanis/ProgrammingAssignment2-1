## makeCachematrix creates the special matrix and returns a list of functions
## The list constists of functions (set, get, setxinv, getxinv)
## Each call resets the list and the matrix inverse value regardless of
## wether or not the matrix has been modified
## makeCachematrix is to be called only once to avoid 
## recalculation of the inverse for a given matrix.

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setxinv <- function(xinv) m <<- xinv
    getxinv <- function() m
    list(set = set, get = get,
         setxinv = setxinv,
         getxinv = getxinv)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    m <- x$getxinv()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setxinv(m)
    m
}

