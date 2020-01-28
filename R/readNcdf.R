readNcdf <- function(
  ### fast reading of a single variable netCDF file into an array
  file.name   ##<< character string: name of the ncdf file file to read the data from.
  ,var.name = c()  ##<< scalar string: name of the variable to extract. 
  ## If not supplied,
  ## this is tried to be determined with readNcdfVarName().
  , isAttachingUnit = TRUE  ##<< set to FALSE to not try reading unit 
) {
  ##details<<
  ## Convenience function to automatically read in data from a ncdf file
  ## without specifying variable names and opening file connections.
  file.con <- open.nc(file.name)
  on.exit(close.nc(file.con))
  if (length(var.name) == 0)
    var.name = readNcdfVarName(file.con)
  data     <- var.get.nc(file.con, var.name)
  if (isTRUE(isAttachingUnit)) {
    unit <- try(infoNcdfAttr(file.con, "units", var.name))
    if (!inherits(unit,"try-error")) {
      attr(data,"units") <- unit
      if (requireNamespace("units"))
        data <- units::set_units(data, unit, mode = "standard")
    } 
  }
  #TODO add dimnames
  ##value<< (multidimensional) array: data from the ncdf file.
  ## With unit in attribute units and if package units is there as unidata unit
  return(data)
}  


readNcdfDataframe <- function(
  ### fast reading of a single point netCDF file into an data.frame
  file.name   ##<< character string: name of the ncdf file to read the data from.
  ,varPattern = vars ##<< string vector of regular expression patterns of 
  ##  variable names to extract, that are concatenated by OR.
  ##  Default empty corresponds to all variables.
  , dimVar = "time" ##<< scalar string: name of the single dimension
  , isConvertTime = (dimVar == 'time') ##<< if true, the dimension is read by 
  ## \code{\link{readNcdfTime}}
  , tzone = "UTC"  ##<< timezone formatting applied to the time dimension.
  , dimRange = NULL  ##<< possibility to specify start and end of 
  ## the single dimension to read only a subset.
  ## Values must exactly match entries in dimVar
  , isAttachingUnit = TRUE  ##<< set to FALSE to not try reading unit 
  , vars = character() ##<< alternative shorthand for varPattern
) {
  ##seealso<< \code{\link{updateNcdfDataframe}}
  ##details<<
  ## Convenience function to automatically read in data from a ncdf file
  ## without specifying variable names and opening file connections.
  ## 
  ## Expects all variables in the file to be one-dimensional.
  file.con <- open.nc(file.name)
  on.exit(close.nc(file.con))
  unitsAttr <- list()
  attachUnit <- function(data, var.name){
    if (isTRUE(isAttachingUnit)) {
      unit <- try(infoNcdfAttr(file.con, "units", var.name))
      if (!inherits(unit,"try-error")) {
        unitsAttr[var.name] <<- unit
      } 
    }
    data
  }
  varInfo <- infoNcdfVars(file.con, order.var = "id")
  dimData0 <- if (isConvertTime) {
    readNcdfTime(file.con, timeVar = dimVar, tzone = tzone)
  } else {
    data <- as.vector(var.get.nc(file.con, dimVar))
    attachUnit(data, dimVar)
  }
  ansEmpty <- structure( data.frame(x = dimVar), names = dimVar)[FALSE,,drop = FALSE]
  if (!nrow(varInfo)) return(ansEmpty)
  varNames <- if (length(varPattern)) {
    pattern <- paste( paste0("(",varPattern,")"), collapse = "|")
    iNames <- grep(pattern, varInfo$name)
    varInfo$name[iNames]
  } else varInfo$name
  if (!length(varNames)) return(ansEmpty)
  if (length(dimRange)) {
    dimRangeIndices <- .getDimRangeIndices(dimRange, dimData0)
    dimData <- dimData0[dimRangeIndices[1]:dimRangeIndices[2]]
    vars <- lapply(varNames, function(var.name){
      data <- as.vector(var.get.nc(
        file.con, var.name
        , start = c(1,1,dimRangeIndices[1])
        , count = c(1,1,1 + diff(dimRangeIndices))))
    })
  } else {
    dimData <- dimData0
    vars <- lapply(varNames, function(var.name){
      data <- as.vector(var.get.nc(file.con, var.name))
    })
  }
  varsT <- setNames( c(list(dimData), vars), c(dimVar, varNames))
  ans <- do.call(cbind.data.frame, varsT)
  for (varName in varNames) 
    ans[[varName]] <- attachUnit(ans[[varName]], varName)
  if (isTRUE(isAttachingUnit)) attr(ans,"units") <- unitsAttr
  ##value<< data.frame of all variables in the file. First column is the 
  ## dimension, usually time.
  return(ans)
}  

asUnitsDataFrame <- function(
  ### convert data.frame columns to units objects
  data   ##<< data.frame
  , units = attributes(data)$units  ##<< list with unit string entries
  ## named as a column in \code{data}
) {
  if (requireNamespace("units")) {
    for (var.name in names(units)) {
      unit <- units[[var.name]]
      dataOrErr <- try(units::set_units(
          data[[var.name]], unit, mode = "standard"), silent = TRUE)
      if (inherits(dataOrErr, "try-error")) { warning(
        "unit of ", var.name, ": ", dataOrErr) 
      } else
        data[[var.name]] <- dataOrErr
    }
  }
  ##value<< data.frame with columns converted to unit objects
  data
}


.getDimRangeIndices <- function(
  ### get the indices of dimRange within dimData0
  dimRange   ##<< vector (start, end) of values in \code{dimData0}
  , dimData0 ##<< dimension values in ascending order
) {
  if (length(dimRange) != 2) stop(
    "dimRange must be of length two c(start,end) but was of length "
    ,length(dimRange))
  iStart <- if (dimRange[1] < dimData0[1]) {
    warning(
      "Supplied a dimension start lower than the data. Using data start")
    iStart <- 1
  } else match(dimRange[1], dimData0)
  if (is.na(iStart)) stop(
    "range start ", dimRange[1], "is not among dimension values")
  iEnd <- if (dimRange[2] > dimData0[length(dimData0)]) {
    warning(
      "Supplied a dimension end higher than the data. Using data end")
    iEnd <- length(dimData0)
  } else match(dimRange[2], dimData0)
  if (is.na(iEnd)) stop(
    "range end ", dimRange[2], "is not among dimension values")
  ##value<< vector of length 2 (start, end) of indices in dimData0
  c(iStart, iEnd)
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
