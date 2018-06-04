readNcdf <- function(
  ### fast reading of a single variable netCDF file into an array
  file.name   ##<< character string: name of the ncdf file file to read the data from.
  ,var.name = c()  ##<< scalar string: name of the variable to extract. 
  ## If not supplied,
  ## this is tried to be determined with readNcdfVarName().
) {
  ##details<<
  ## Convenience function to automatically read in data from a ncdf file
  ## without specifying variable names and opening file connections.
  file.con <- open.nc(file.name)
  on.exit(close.nc(file.con))
  if (length(var.name) == 0)
    var.name = readNcdfVarName(file.con)
  data     <- var.get.nc(file.con, var.name)
  #TODO add dimnames
  ##value<< (multidimensional) array: data from the ncdf file.
  return(data)
}  


readNcdfDataframe <- function(
  ### fast reading of a single point netCDF file into an data.frame
  file.name   ##<< character string: name of the ncdf file file to read the data from.
  ,var.name = c()  ##<< scalar string: name of the variable to extract. 
  , dimVar = "time" ##<< scalar string: name of the single dimension
  , isConvertTime = (dimVar == 'time') ##<< if true, the dimension is read by 
  ## \code{\link{readNcdfTime}}
) {
  ##details<<
  ## Convenience function to automatically read in data from a ncdf file
  ## without specifying variable names and opening file connections.
  ## 
  ## Expects all variables in the file to be one-dimensional.
  file.con <- open.nc(file.name)
  on.exit(close.nc(file.con))
  varInfo <- infoNcdfVars(file.con, order.var = "id")
  dimData <- if (isConvertTime) {
    readNcdfTime(file.con, timeVar = dimVar)
  } else {
    var.get.nc(file.con, dimVar)
  }
  if (nrow(varInfo)) {
    vars <- lapply(varInfo$name, function(var.name){
      var.get.nc(file.con, var.name)
    })
    ans <- cbind(dimData, as.data.frame(do.call(cbind, vars)))
    names(ans) <- c(dimVar, varInfo$name)
  } else ans <- structure( data.frame(x = dimVar), names = dimVar)
  ##value<< data.frame of all variables in the file. First column is the 
  ## dimension, usually time.
  return(ans)
}  
