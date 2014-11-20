## This pair of functions is used to calculate the inverse of a matrix and cache the result

## makeCacheMatrix is used to create a special maxtrix which is really a list of functions:
## 1. set the value of the matrix
## 2. get the value of the Matrix
## 3. set the value of the inverse matrix
## 4. get the value of the inverse matrix

makeCacheMatrix <- function(x = matrix()) {
   m <- NULL
    set <- function(y){
      x<<-y
      m<<-NULL
      
    }
    
    get <- function() x
    setmatrix <- function(matrix) m<<- matrix
    getmatrix <- function() m
    list(set = set, get = get, 
         setmatrix = setmatrix, getmatrix = getmatrix)    
}


## The following function calculates the inverse of the special "matrix" created with the above function. 
## However, it first checks to see if the mean has already been calculated. If so, it gets the inverse matrix
## from the cache and skips the computation. Otherwise, it calculates the inverse matrix of the data and sets 
## the value of the inverse matrix in the cache via the setmean function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
         m <- x$getmatrix()
  if(!is.null(m)) {
    message("getting cached data")
    return (m)
  }
  
  data <- x$get()
  m <- solve(data)
  x$setmatrix(m)
  m
}
