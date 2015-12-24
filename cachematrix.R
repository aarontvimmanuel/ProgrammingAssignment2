# Programming Assignment 2 is about caching the inverse of a matrix by
# understanding the Scoping Rules in R-Programming language.
# makeCacheMatrix function creates a matrix that can cache its inverse. This
# function stores a list of 4 functions 'set', 'get', 'setinverse', 'getinverse'
# Using the matrix returned by makeCacheMatrix function, we calculate
# its inverse using cacheSolve function.

# makeCacheMatrix function creates a matrix that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
 inverse <- NULL

 # 'set' function to set/change the matrix stored in makeCacheMatrix function.
 # This <<- operator assigns value to objects 'x' and 'inverse' visible to main
 # function (makeCacheMatrix) environment.
 set <- function(y) {
 x <<- y
 inverse <<- NULL
 }

 # 'get' function returns the matrix stored in makeCacheMatrix function.
 get <- function() {
 x
 }
 
 # 'setinverse' function to set/change the matrix inverse.
 setinverse <- function(solve) {
 inverse <<- solve
 }
 
 # 'getinverse' function returns the matrix inverse.
 getinverse <- function() {
 inverse
 }
 
 # stores a list of 4 functions: 'set', 'get', 'setinverse', 'getinverse'.
 list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}

# cacheSolve function computes the inverse of matrix
# returned by makeCacheMatrix function [using solve function in R].
cacheSolve <- function(x, ...) {

 # Store the matrix inverse in 'inverse' object.
 inverse <- x$getinverse()

 # Check if 'inverse' was already calculated and matrix was not changed.
 if(!is.null(inverse)) {
 message("Getting Cached Data!")
 return(inverse)
 }

 # If inverse is not calculated, store the input matrix 'x' in 'data' object.
 data <- x$get()
 
 # Calculate the inverse of 'data' using solve function in R
 # and store the result in 'inverse'.
 # we assume that the input square matrix supplied is always invertible.
 inverse <- solve(data, ...)
 
 # set the value of matrix inverse
 x$setinverse(inverse)
 
 # print the output matrix that is the inverse of input matrix 'x'
 inverse
}
