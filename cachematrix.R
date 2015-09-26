## These two functions essentially calculate the inverse of a
## matrix and caches it. Whenever a new calculation of the same 
## matrix is required, cached result is used to save time.

## This function creates a list of functions for setting the 
## matrix, calling the matrix, setting its inverse, and calling 
## the inverse. One can also set new values for the matrix via
## set() function. It detects whether the new matrix is the same
## as the old one

makeCacheMatrix <- function(x = matrix()) {
     inv.m <- NULL
     set <- function(y) { ##resets inv.m if matrix is different
         if(!identical(x,y)){
             inv.m <<- NULL
             x <<- y
         }
     }
     get <- function() x
     setinverse <- function(inverse) inv.m <<- inverse
     getinverse <- function() inv.m
     list(set = set, 
          get = get,
          setinverse = setinverse,
          getinverse = getinverse)
}



## This function first checks if the inverse matrix is calculated
## before. If it is, cached result is returned along with a
## message. If not, it then checks if the input matrix is
## invertible. If not, a message is returned, or else, the
## inverse is calculated and cached.

cacheSolve <- function(x, ...) {
    inv.m <- x$getinverse()
    if(!is.null(inv.m)) {
        message("getting cached data")
        return(inv.m)
    }
    matrix <- x$get()
    det <- det(matrix)
    if(det<=1e-08 & det >= -1e-08){ ##tolerance level = 1e-08
        return(message('matrix is singular'))
    }
    inv.m <- solve(matrix,...)
    x$setinverse(inv.m)
    inv.m
}

