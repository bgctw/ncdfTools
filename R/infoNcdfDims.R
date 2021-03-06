infoNcdfDims  <- function(
  ### show info about all dimensions in a ncdf file
  file.con  ##<< a NetCDF object pointing to the respective ncdf file.
  , extended = TRUE ##<< logical: if TRUE, some extended dimension info that 
  ##   may take time to compute for large files is computed.
) {
  ##description<<
  ## This function displays summary information about all dimensions in an 
  ## open ncdf file
  ##seealso<<
  ##\code{\link{infoNcdfVars}}, \code{\link[RNetCDF]{dim.inq.nc}}
  if (inherits(file.con, 'character')) {
    if (!file.exists(file.con))
      stop('Specified file not existent!')
    file.con <- open.nc(file.con)
    on.exit(close.nc(file.con))
  } 
  n.dims             <- file.inq.nc(file.con)$ndims
  dim.info           <- as.data.frame(matrix(NA, n.dims, 6))
  colnames(dim.info) <- c('id', 'name', 'length', 'min', 'max', 'step')
  for (i in 1:n.dims) {
    dim.info[i, 1] <- as.integer(dim.inq.nc(file.con, i - 1)$id)
    dim.name       <- dim.inq.nc(file.con, i - 1)$name
    dim.info[i, 2] <- dim.name
    dim.info[i, 3] <- as.integer(dim.inq.nc(file.con, i - 1)$length)
    if (extended) {
      if (is.element(dim.name, infoNcdfVars(file.con)$name)) {
        if (dim.name == 'time') {
          dims.vals      <- readNcdfTime(file.con)
          if (class(dims.vals)[1] == 'POSIXct') {
            dims.info      <- c(
              as.integer(format(range(dims.vals), '%Y%m%d')), mean(diff(dims.vals)))
          } else {
            dims.info      <- c(range(dims.vals),  mean(diff(dims.vals)))              
          }
        } else {
          dims.vals      <- var.get.nc(file.con, dim.name)
          dims.info      <- c(range(dims.vals), mean(diff(dims.vals)))
        }
        dim.info[i, 4:6] <- dims.info
      }
    }
  }
  ##value<<
  ## A data.frame containing the id, name, length, range and step (columns) 
  ## of all dimensions (rows)
  return(dim.info)
}
