

#The first function, `makeCacheMatrix` creates a special "matrix", which is
#really a list containing a function to

#1.  set the matrix
#2.  get the matrix
#3.  set inverted matrix
#4.  get inverted matrix

makeCacheMatrix <- function(x = matrix()) {
        invert <- NULL
        set <- function(y) {
                x <<- y
                invert <<- NULL
        }
        get <- function() x
        setinvert <- function(inv) invetr <<- inv
        getinvert <- function() invert
        list(set = set, get = get,
             setinvert = setinvert,
             getinvert = getinvert)
}



#The following function calculates the invert matrix of the special "matrix"
#created with the above function. However, it first checks to see if the
#inverted matrix has already been created. If so, it `get`s the invert matrix from the
#cache and skips the computation. Otherwise, it calculates the invert matrix of
#the data and sets the result of the invetr matrix in the cache via the `setmean`
#function.


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        invert <- x$getinvert()
        if(!is.null(invert)) {
                message("getting cached data")
                return(invert)
        }
        data <- x$get()
        invert <- solve(data, ...)
        x$setinvert(invert)
        invert
}
