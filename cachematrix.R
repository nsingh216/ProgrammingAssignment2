## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  ## this returns the supplied matrix
  get <- function() x
  ## getReverse will be null until a setReverse operation has been completed for this matrix
  setReverse <- function(solve) m <<- solve
  ## this returns the reverse matrix, or null if it hasnt been calculated yet
  getReverse <- function() m
  ## return all the functions
  list(set = set, get = get,
       setReverse = setReverse,
       getReverse = getReverse)
 
}


## Write a short comment describing this function

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
