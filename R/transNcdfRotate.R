transNcdfRotate  = function(
  ### transpose Ncdf datacube
  data.object ##<< RNetCDF file connection or R array: data object to be transposed.
  , file.name.out = 'none' ##<< character string: name of the
  ## ncdf file created for the results. Default 'none' means that no
  ## results file is created.
  , file.con = c()    ##<< RNetCDF file connection: link to the data object to be 
  ## transposed. 
  ## Supplying both data.object and file.con only makes sense if data.object
  ## is an array which saves time as the data does not have to be loaded again.              
  , var.name = c() ##<< character string: name of the variable to transpose. If
  ## not gives, this name is tried to be inferred by using readNcdfVarName.
) {
  ##details<< 
  ## convenience function to transpose an arbitrary datacube in a ncdf 
  ## file into a datacube with dimensions [latitude (decreasing)
  ## , longitude (increasing), time (increasing)].
  if (inherits(data.object,  "NetCDF")) {
    file.con <- data.object
    if (length(var.name) == 0)
      var.name = readNcdfVarName(file.con)
    datacube <- var.get.nc(file.con, var.name)
  } else if (inherits(data.object,  "array")) {
    datacube     <- data.object
    if (!inherits(file.con,  "NetCDF"))
      stop('Please supply a valid pointer to a ncdf file via file.con!')
  } else {
    stop('Function not designed for data.object of class', class(data.object))
  }
  infoDims <- infoNcdfDims(file.con)
  dims.file    <- infoDims$name[var.inq.nc(file.con, var.name)$dimids + 1]
  new.dimorder <- na.omit(pmatch(c('lat', 'lon', 'time'), dims.file))
  # order dimensions in datacube
  if (sum(unique(diff(new.dimorder)) != 1) > 0)
    datacube   <- aperm(datacube, new.dimorder)
  # sort values according to coordinate values order
  lat.name       <- infoDims$name[pmatch('lat', infoDims$name)]
  lat.values     <- var.get.nc(file.con, lat.name)
  if (sum(unique(diff(order(lat.values, decreasing = TRUE))) != 1) > 0)
    datacube   <- datacube[order(lat.values, decreasing = TRUE), , ]
  lon.name       <- infoDims$name[pmatch('lon', infoDims$name)]
  lon.values     <- var.get.nc(file.con, lon.name)
  if (sum(unique(diff(order(lon.values))) != 1) > 0)
    datacube   <- datacube[, order(lon.values), ]
  if (is.element('time', dims.file)) {
    time.values    <- var.get.nc(file.con, 'time')
    if (sum(unique(diff(order(time.values))) != 1) > 0)
      datacube   <- datacube[, , order(time.values)]
  } else {
    time.values = c()
  }
  # create new file
  if (file.name.out != 'none') {
    createLatLongTime(
      file.name = file.name.out, var.names = var.name,
      lat.values = lat.values, long.values = lon.values,
      time.values = time.values)
    con.fill <- open.nc(file.name.out, write = TRUE)
    on.exit(close.nc(con.fill))
    var.put.nc(con.fill, variable = var.name, data = datacube)
  }
  ##value<<array: transposed datacube
  invisible(datacube)
}
