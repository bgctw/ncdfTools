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
    dim.info          <- as.data.frame(matrix(NA, n.dims, 6))
    colnames(dim.info)<- c('id', 'name', 'length', 'min', 'max', 'step')
    for (i in 1:n.dims) {
        dim.info[i, 1] <- as.integer(dim.inq.nc(file.con, i - 1)$id)
        dim.name       <- dim.inq.nc(file.con, i - 1)$name
        dim.info[i, 2] <- dim.name
        dim.info[i, 3] <- as.integer(dim.inq.nc(file.con, i - 1)$length)
        if (is.element(dim.name, ncdf.get.varinfo(file.con)$name)) {
          if (dim.name == 'time') {
            dims.vals      <- date.ncdf2R(file.con)
            dims.info      <- c(as.integer(format(range(dims.vals), '%Y%m%d')), mean(diff(dims.vals)))
          } else {
            dims.vals      <- var.get.nc(file.con, dim.name)
            dims.info      <- c(range(dims.vals), mean(diff(dims.vals)))
          }
          dim.info[i, 4:6] <- dims.info
        }
    }
    ##value<<
    ## A matrix containing the id, name, length, range and step (columns) of all dimensions (rows)
    return(dim.info)
}
