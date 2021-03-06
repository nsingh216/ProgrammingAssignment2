## The two functions below will enable users to cache the inverse of the matrix
# Since this (matrix inversion) can be a time consuming, caching the result 
# can be beneficial, especially if it is not changing often.


## This first function will return a list of functions that can be used to
# set, retrieve, or manipulate a matrix and its inverse

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  ## this returns the supplied matrix
  get <- function() x
  ## getReverse will be null until a setReverse operation has been completed 
  ## for this matrix
  setReverse <- function(solve) m <<- solve
  ## this returns the reverse matrix, or null if it hasnt been calculated yet
  getReverse <- function() m
  ## return all the functions
  list(set = set, get = get,
       setReverse = setReverse,
       getReverse = getReverse)
 
}


## This 2nd function with take the list returned from the previous function as
# input. If the reverse of this matrix has already been calculated (& cached),
# it will simply return the cached inverse matrix; otherwise, it will 
# invert, cache, and return the matrix.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getReverse() 
  if(!is.null(m)) {
    message("getting cached matrix")
    return(m)
  }
  my_matrix <- x$get()
  m <- solve(my_matrix, ...)
  x$setReverse(m)
  m
}
