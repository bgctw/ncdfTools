ncdf.get.diminfo  <- function(
##title<< show info about all dimensions in a ncdf file
##description<< This function displays summary information about all dimensions in an open ncdf file
     file.con  ##<< a NetCDF object pointing to the respective ncdf file.
)
##seealso<<
##\code{\link{ncdf.get.varinfo}}, \code{\link{dim.inq.nc}}

##author<<
## Jannis v. Buttlar, MPI BGC Jena, Germany, jbuttlar@bgc-jena.mpg.de
{
    n.dims            <- file.inq.nc(file.con)$ndims
    dim.info          <- as.data.frame(matrix(NA, n.dims, 3))
    colnames(dim.info)<- c('id', 'name', 'length')
    for (i in 1:n.dims) {
        dim.info[i, 1] <- as.integer(dim.inq.nc(file.con, i - 1)$id)
        dim.info[i, 2] <- dim.inq.nc(file.con, i - 1)$name
        dim.info[i, 3] <- as.integer(dim.inq.nc(file.con, i - 1)$length)
    }
    ##value<<
    ## A matrix containing the id, name  and length (columns) of all dimensions (rows)
    return(dim.info)
}
