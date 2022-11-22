# A function that will destroy itself.
self_destruct <- function(){

    # return name of the current function
    fn <- as.character(match.call()[[1]])

    # build anticipation
    for (i in 3:1) {
        cat(paste0(i, " ...\n"))
        Sys.sleep(1)
    }

    # remove function from parent environment
    rm(list = fn, envir = parent.env(environment()))

    # demonstrate aftermath
    cat("boom")

}

# self_destruct()


# A function that generates a function that will destroy itself
# a decorator function
detonate <- function(f){
    function(...){
        # Get environment the returned function will exist in
        penv <- parent.env(parent.env(environment()))

        # return assigned name of the returned function
        fn <- as.character(match.call()[[1]])

        cat(paste0("Running ", fn, "...\n"))
        res <- f(...)

        Sys.sleep(1)

        cat("\nSelf Destruct in \n")
        for (i in 3:1) {
            cat(paste0(i, " ...\n"))
            Sys.sleep(1)
        }


        rm(list = fn, envir = penv)
        cat("\n")

        # return the remains
        res

    }
}

# temp_mean_func <- detonate(mean)

# temp_mean_func(1:10)
