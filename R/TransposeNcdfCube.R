TransposeNcdfCube  = function(data.object, file.con = c(),
  var.name = c()) {

  if (inherits(data.object,  "NetCDF")) {
    file.con <- data.object
    if (length(var.name) == 0)
      var.name = ncdf.get.varname(file.con)
    datacube <- var.get.nc(file.con, var.name)
  } else if (inherits(data.object,  "array")) {
    datacube     <- data.object
    if (!inherits(file.con,  "NetCDF"))
      stop('Please supply a valid pointer to a ncdf file via file.con!')
  } else {
    stop(paste('Function not designed for data.object of class', class(data.object), '!'))
  }
  dims.file      <- ncdf.get.diminfo(file.con)[,'name'][var.inq.nc(file.con, var.name)$dimids + 1]
  new.dimorder   <- pmatch(c('lat', 'lon', 'time'), dims.file)
  datacube.aperm <- aperm(datacube, new.dimorder)
  lat.values     <- var.get.nc(file.con, new.dimorder[1] - 1) 
  lon.values     <- var.get.nc(file.con, new.dimorder[2] - 1)
  datacube.out   <- datacube.aperm[order(lat.values, decreasing = TRUE), , ]
  datacube.out   <- datacube.aperm[, order(lon.values), ]
  return(datacube = datacube.out)
}
