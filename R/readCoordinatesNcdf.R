readCoordinatesNcdf = function(
  ### read coordinate or dimension values from ncdf file
  fileCon ##<< ncdf file connection or character string: Connection to the
  ##  ncdf file or its file name. In the latter case, the connection is
  ##  created and closed automatically.
) {
  ##seealso<<
  ##\code{\link{infoNcdfDims}}
  if (inherits(fileCon, 'character')) {
    if (!file.exists(fileCon))
      stop('Specified file not existent!')
    fileCon <- open.nc(fileCon)
    on.exit(close.nc(fileCon))
  }
  dimNames <- infoNcdfDims(fileCon)$name
  results <- list()
  for (dimNameT in dimNames) {
    if (is.element(dimNameT, infoNcdfVars(fileCon, dimvars = TRUE)$name)) {
      results[[dimNameT]] <- var.get.nc(fileCon, dimNameT)
    } else {
      results[[dimNameT]] <- NULL
    }
  }
  ##value<< A list with the coordinate values (if available) for all dimensions.
  return(results)
}
