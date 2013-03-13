gapfill.ind.core = function(iter.nr) 
##author<<
## Jannis v. Buttlar, MPI BGC Jena, Germany, jbuttlar@bgc-jena.mpg.de
{
  library('jannis.misc')
  load.functions.package('ncdf.tools', path = '/Net/Groups/BGI/people/jbuttlar/Software/Own_packages')
  iter.ind                               <- iter.gridind[iter.nr, ]
  datapts.n                              <- prod(dim(data)[dims.process.id + 1])
  data.results.iter                      <- array(NA, dim = c(diff(iter.ind) + 1, datapts.n))
  for (j in 1:(diff(iter.ind) + 1)) {
    ind.total = (iter.ind[1] : iter.ind[2])[j]
    data.results.iter.t = try({
          if (iter.nr == 1 &&( diff(iter.ind) < 20  || (j %% (ceiling((diff(iter.ind)) / 20)) == 0)))
            if (print.status)
              cat(paste(Sys.time(), ' : Finished ~',
                      round(j / (diff(iter.ind) + 1) * 100), '%. \n', sep=''))
          iter.index.start        <- iter.grid[ind.total, -1]
          args.call.t             <- args.call.SSA
          args.call.t[['seed']]   <- iter.nr * j
          args.call.t[['series']] <- do.call('[',alist(data,iter.index.start[[1]],
                  iter.index.start[[2]], iter.index.start[[3]]))
          if (!(class(first.guess) == 'character' && first.guess == 'mean')) {
            args.call.t[['first.guess']] <- do.call('[',alist(first.guess,iter.index.start[[1]],
                    iter.index.start[[2]], iter.index.start[[3]]))
          }
          series.filled           <-  do.call(gapfilling.SSA, args.call.t)
          series.filled$reconstr
        })
    if (class(data.results.iter.t) == 'try-error') {
      print(paste('Error occoured at iteration ', iter.nr, ' and loop ', j, '!', sep = ''))
      print(data.results.iter.t)
      trace.save                      <- traceback()
      error.from.calc                 <- data.results.iter.t
      data.results.iter.t             <- matrix(Inf, ncol = datapts.n, nrow = 1)
      system.info                     <- sessionInfo()
      path.debug                      <- file.path('/Net', 'Groups', 'BGI', 'tmp', 
                                                   'jbuttlar', 'Cluster_jobs_debugging',
                                                   sub('/Net/Groups/BGI/', '', getwd()))
      if (!file.exists(path.debug))    
         system(paste('mkdir -p ', path.debug, sep = ''))                                                    
      file.name.t                     <- paste(path.debug, '/workspace_error_', file.name, '_',iter.nr, '_', j, sep = '')
      print(paste('Saving workspace to file ', file.name.t, '.rda', sep = ''))
      dump.frames(to.file = TRUE, dumpto = file.name.t)
    }
    data.results.iter[j, ]               <- as.vector(data.results.iter.t)
  }
  data.results.iter
}
