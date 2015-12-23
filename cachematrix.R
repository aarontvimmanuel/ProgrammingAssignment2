# makeCacheMatrix function creates a matrix that can cache its inverse and
# produces a list containing 4 functions:
# set, get, setinverse, getinverse
# Using the matrix returned by makeCacheMatrix function, we calculate
# its inverse using cacheSolve function

# makeCacheMatrix function creates a matrix that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
 inverse <- NULL

 # set function to set the value of matrix
 set <- function(y) {
 x <<- y
 inverse <<- NULL
 }

 # get function to get the value of matrix
 get <- function() {
 x
 }
 
 # setinverse function to set the value of matrix inverse
 setinverse <- function(solve) {
 inverse <<- solve
 }
 
 # getinverse function to get the value of matrix inverse
 getinverse <- function() {
 inverse
 }
 
 # output list containing 4 functions: set, get, setinverse, getinverse
 list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}

# cacheSolve function computes the inverse of matrix
# returned by makeCacheMatrix function

cacheSolve <- function(x, ...) {

 # get the value of matrix inverse and assign it to 'inverse' object
 inverse <- x$getinverse()

 # check if inverse was already calculated and matrix has not changed
 if(!is.null(inverse)) {
 message("Getting Cached Data!")
 return(inverse)
 }

 # if inverse is not calculated, store the input matrix 'x' in 'data' object
 data <- x$get()
 
 # calculate the inverse of 'data' using solve function in R
 # and store the result in 'inverse'
 inverse <- solve(data, ...)
 
 # set the value of matrix inverse
 x$setinverse(inverse)
 
 # print the output matrix that is the inverse of input matrix 'x'
 inverse
}
