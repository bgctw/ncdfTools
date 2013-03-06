ind.datacube = function(
##title<< create logical index matrices for multidimensional datacubes
##description<< This function facilitates suppliying logical index array for some 
##              of the dimensions of a data array. This mimics Matlabs indexing scheme.
  datacube       ##<< array: datacube from which to extract the subparts
  , logical.ind  ##<< logical array: TRUE/FALSE index matrix for a subset of the 
                 ##   dimensions of datacube. The size of logical.ind`s dimensions 
                 ##   has to match the sizes of the corresponding dimensions in 
                 ##   datacube.
  , dims='auto'  ##<< integer vector or 'auto' : indices of the dimensions in 
                 ##   datacube corresponding to the dimensions of logical.ind. 
                 ##   If set to 'auto' this matching is tried to be accomplished 
                 ##   by comparing the sizes of the dimensions of the two objects.
)
##author<<
## Jannis v. Buttlar, MPI BGC Jena, Germany, jbuttlar@bgc-jena.mpg.de
{
    if (sum(logical.ind) == 0) {
        stop('No TRUE value in index matrix!')
    } else {
        if (dims[1] == 'auto')
        {
            if (is.null(dim(logical.ind)[1])) {
                size.ind     <- length(logical.ind)
                logical.ind  <- matrix(logical.ind, ncol=1)
            } else {
                size.ind     <- dim(logical.ind)
            }
            dims             <- match(size.ind, dim(datacube))
            if (sum(duplicated(size.ind)) > 0 || sum(duplicated(dims)) > 0 )
                stop('dimensions do not match unambigously. Supply dims manually!')
        }
        if (is.element(class(logical.ind), c('matrix', 'array'))) {
          dims.size <- dim(logical.ind)
        } else {
          dims.size <- length(logical.ind)
        } 
        logical.ind             <- array(logical.ind, dim = dims.size)
        dims.all                <- setdiff(1:length(dim(datacube)), dims)
        ind.matrix.choice       <- array(which(logical.ind, arr.ind = TRUE), 
            dim = c(sum(logical.ind), length(dims.size)))

        dims.all.expand         <- list()
        for (i in 1:length(dims.all))
           dims.all.expand[[i]] <- 1:dim(datacube)[dims.all[i]]
        dims.all.grid           <-  as.matrix(do.call(expand.grid, dims.all.expand))
        
        dims.all.grid.exp       <- apply(dims.all.grid, 2, 
            function(x){rep(x, times = dim( ind.matrix.choice)[1])}) 
        ind.matrix.choice.exp   <- apply(ind.matrix.choice, 2, 
            function(x){rep(x, each = dim( dims.all.grid)[1])}) 

       
        ind.matrix.all          <- cbind(dims.all.grid.exp, ind.matrix.choice.exp)
        ind.matrix.ord          <- ind.matrix.all[, order(c(dims.all, dims))]
    }
    colnames(ind.matrix.ord)    <- paste('dim', 1:length(dim(datacube)), sep='')
    ##value<< integer index matrix which can be used to index datacube
    ind.matrix.ord
}
