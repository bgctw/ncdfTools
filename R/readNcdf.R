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
  file.name   ##<< character string: name of the ncdf file to read the data from.
  ,var.name = c()  ##<< scalar string: name of the variable to extract. 
  , dimVar = "time" ##<< scalar string: name of the single dimension
  , isConvertTime = (dimVar == 'time') ##<< if true, the dimension is read by 
  ## \code{\link{readNcdfTime}}
) {
  ##seealso<< \code{\link{updateNcdfDataframe}}
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

updateNcdfDataframe <- function(
  ### fast writing of a data.frame to a single point netCDF file 
  ds            ##<< data.frame to write to file
  , file.name   ##<< character string: name of the ncdf file file to write to.
  , dimVar = "time" ##<< scalar string: name of the single dimension
  , isConvertTime = (dimVar == 'time') ##<< if true, the dimension is converted 
  ## by \code{\link{readNcdfTime}}
) {
  ##seealso<< \code{\link{readNcdfDataframe}}
  ##details<<
  ## Convenience function to automatically write data toa ncdf file
  ## without specifying variable names and opening file connections.
  ## 
  ## Expects dim-column to be equidistant and with all
  file.con <- open.nc(file.name, write = TRUE)
  on.exit(close.nc(file.con))
  varInfo <- infoNcdfVars(file.con, order.var = "id")
  ##details<< Expects variables of all columns in \code{ds} to be defined
  ## In the ncdf file
  iDimCol = match(dimVar, names(ds))
  if (is.na(iDimCol)) stop("Missing column ",dimVar)
  time = ds[[iDimCol]]
  dsCols = ds[,-iDimCol, drop = FALSE]
  iMissing <- which( !(names(dsCols) %in% varInfo$name) )
  if (length(iMissing)) stop(
    "These variables are not yet in the netCDF file: "
    , paste(names(dsCols)[iMissing], collapse = ",")
  )
  ##details<< Expects the dim column to be a contiguous slice of the
  ## dimension of the ncdf file
  dimData <- if (isConvertTime) {
    readNcdfTime(file.con, timeVar = dimVar)
  } else {
    var.get.nc(file.con, dimVar)
  }
  iStart <- match(time[1], dimData)
  if (is.na(iStart)) stop(
    "First dimension value of the data (",time[1],") outside ncdf dimensions: "
    ,dimData[1]," to ", dimData[length(dimData)])
  if ((iStart - 1 + nrow(dsCols)) > length(dimData)) stop(
    "Dimension values do not match. More steps to insert than present in file")
  iTimeDiff <- which((dimData[iStart - 1 + (1:nrow(ds))] - time) != 0)
  if (length(iTimeDiff)) stop(
    "Dimension values do not match. First mismatch: ",time[iTimeDiff[1]])
  varName <- names(dsCols)[1]
  for (varName in names(dsCols)) {
    var.put.nc(
      file.con, varName, dsCols[[varName]]
      , start = c(1, 1, iStart)
      , count = c(1, 1, nrow(dsCols))
    )
  }  
  invisible(NULL)
}  
