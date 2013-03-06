extract.datacube = function(
##title<< extract slices/vectors/arrays from multidimensional datacubes
  datacube       ##<< array: datacube from which to extract the subparts
  , logical.ind  ##<< logical array: TRUE/FALSE index matrix for a subset of the dimensions
                 ##   of datacube. The size of logical.ind`s dimesnions has to match the
                 ##   sizes of the corresponding dimesnions in datacube.
  , dims='auto'  ##<< integer vector or 'auto' : indices of the dimensions in datacube corresponding
                 ##   to the dimensions of logical.ind. If set to 'auto' this matching is tried to
                 ##   be accomplished by comparing the sizes of the dimensions of the two objects.
)
##author<<
## Jannis v. Buttlar, MPI BGC Jena, Germany, jbuttlar@bgc-jena.mpg.de
{
    if (dims == 'auto')
    {
        if (is.null(dim(logical.ind)[1])) {
            size.ind     = length(logical.ind)
            logical.ind  = matrix(logical.ind,ncol=1)
        } else {
            size.ind = dim(logical.ind)
        }
        dims = match(size.ind, dim(datacube))
        if (sum(duplicated(size.ind)) > 0 || sum(duplicated(dims)) > 0 )
            stop('dimensions do not match unambigously. Supply dims manually!')
    }
    dims.nonapply <- setdiff(1:length(dim(datacube)),dims)
    ind.matrix    <- which(logical.ind, arr.ind = TRUE)

    string.index       <- character(length = length(dim(datacube)))
    string.index[dims] <- paste('x[',1:length(dims),']',sep='')
    string.index.all   <- paste(string.index,collapse=',')
    call.string        <- paste('datacube[',string.index.all,']',sep='')

    out.index          <- apply(ind.matrix, 1, function(x)eval(parse(text = call.string)))
    dim(out.index)     <- dim(datacube)[dims.nonapply]
    ##value<< logical index of the same dimensions of datacube
    out.index
}
