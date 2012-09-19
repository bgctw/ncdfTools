ncdf.read.data <- function(file.name) {
  require(RNetCDF)
  file.con <- open.nc(file.name)
  data     <- var.get.nc(file.con, ncdf.get.varname(file.con))
  close.nc(file.con)
  return(data)
}  
