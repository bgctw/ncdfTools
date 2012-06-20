RegisterParallel <- function(
##title<< set up parallel computing frontend
##description<< This function automatically sets up the system so that
## parallel computing is possible for the two packages doSMP and doMC.
 pckg.parallel = 'doMC'  ##<< character string: package to use for parallel
                         ##   computing. Has to be one of doMC or doSMP
 , max.cores = 8         ##<< integer: amount of cores to use
)
##seealso<<
##\code{\link{foreach}}, \code{\link{registerDoMC}}, \code{\link{registerDoSMP}}

##author<<
## Jannis v. Buttlar, MPI BGC Jena, Germany, jbuttlar@bgc-jena.mpg.de
{
    require(pckg.parallel, character.only = TRUE, warn.conflicts = FALSE, quietly = TRUE) 
    if (pckg.parallel == 'doSMP') {
        require(iterators, warn.conflicts = FALSE, quietly = TRUE)
        require(codetools, warn.conflicts = FALSE, quietly = TRUE)
        w <<- startWorkers(workerCount = max.cores)
    } else if (pckg.parallel == 'doMC'){
        w <<- max.cores
        require(multicore, warn.conflicts = FALSE, quietly = TRUE)
    } else {
        stop(paste('Package ', pckg.parallel, ' is not supported!', sep=''))
    }
    do.call(paste('registerDo', substr(pckg.parallel, 3, nchar(pckg.parallel)), sep=''),
            list(w))
}
