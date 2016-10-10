## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## This function creates a "matrix" object can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
    a <- NULL
    set <- function(y) {
        x <<- y
        a <<- NULL
    }
    get <- function() x
    setsolve <- function(solve) a <<- solve
    getsolve <- function() a
    list(set = set, get = get,
         setsolve = setsolve,
         getsolve = getsolve)
}


## Write a short comment describing this function
## This function computes the inverse of the special "matrix" 
## returned by makeCacheMatrix above. If the inverse has already 
## been calculated (and the matrix has not changed), then the 
## cachesolve should retrieve the inverse from the cache.
        
cacheSolve <- function(x, ...) {
    a <- x$getsolve()
    if(!is.null(a)) {
        message("getting cached data")
        return(a)
    }
    originmatrix <- x$get()
    a <- solve(originmatrix, ...)
    x$setsolve(a)
    a
}
