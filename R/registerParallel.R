registerParallel <- function(
##title<< set up parallel computing frontend
##description<< This function automatically sets up the system so that
## parallel computing is possible for doMC (yet).
 pckg.parallel = 'doMC'  ##<< character string: package to use for parallel
                         ##   computing. Has to be one of doMC.
 , max.cores = 0         ##<< integer: amount of cores to use
 , ...
)
##seealso<<
##\code{\link[foreach]{foreach}}, \code{\link[doMC]{registerDoMC}}

##author<<
## Jannis v. Buttlar, MPI BGC Jena, Germany, jbuttlar@bgc-jena.mpg.de
{
  require(foreach, warn.conflicts = FALSE, quietly = TRUE)
  if (max.cores == 0) 
    max.cores   <- getCoreLimit()
  if (max.cores == 1 || getDoParWorkers() < max.cores) {
    require(pckg.parallel, character.only = TRUE, warn.conflicts = FALSE, quietly = TRUE)
    cat(paste('Registering ', max.cores, ' cores.\n', sep = ''))
    if (pckg.parallel == 'doMC'){
      require(doMC, warn.conflicts = FALSE, quietly = TRUE)
      w <<- max.cores
      require(multicore, warn.conflicts = FALSE, quietly = TRUE)
    } else if (pckg.parallel == 'doParallel' || pckg.parallel == 'doSNOW'){
      require(doSNOW, warn.conflicts = FALSE, quietly = TRUE)      
      w <<- makeCluster(max.cores)
    } else if (pckg.parallel == 'snow') {
      stop('Do not use this function to create snow clusters. Use sfInit from package snowfall instead!')
    } else {
      stop(paste('Package ', pckg.parallel, ' is not (yet) supported!', sep=''))
    }
    do.call(paste('registerDo', substr(pckg.parallel, 3, nchar(pckg.parallel)), sep=''),
            list(w))
  }
}
