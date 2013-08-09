readNcdfSpectral <- function(fileName, varName, rangeBandsGet) {
  .funSum    <- function(x) {
    xUse <- x[bandsTake]
    if (sum(!is.na(xUse)) == 0) {
      NA
    } else {
      sum(xUse, na.rm = TRUE)
    }
  }
  conT <- open.nc(fileName)
  dataIn <- var.get.nc(conT, varName)
  bordersLow <- var.get.nc(conT, 'borders.low')
  bordersUp  <- var.get.nc(conT, 'borders.up')
  close.nc(conT)
  if (inherits(rangeBandsGet, 'logical')) {
    if (length(rangeBandsGet != length(bordersUp)))
      stop('rangeBandsGet needs to be of the same length as dimension spectral bands in case of logicals!')
    bandsTake = rangeBandsGet
  } else {
    bandsTake   <- bordersUp <= rangeBandsGet[2] & bordersLow >= rangeBandsGet[1]
  }
  if (sum(bandsTake) == 0) {
    stop('no valid band selected!')
  } else if (sum(bandsTake) == 1){
    dataSummed <- dataIn[,bandsTake]
  } else if (sum(bandsTake) > 1) {
    dimsSum    <- 1:(length(dim(dataIn))-1)
    dataSummed <- apply(dataIn, dimsSum, .funSum)
  }
  return(dataSummed)
}
