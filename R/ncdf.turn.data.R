ncdf.turn.data <- function(
  con
  , data = c()                         
  , varname = c())
{
  ##TODO: add mechanism for less than three dimensions
  ##TODO: handle non standard dim names
  if (length(varname) == 0)
    varname <- ncdf.get.varname(con)

  dims.data    <- ncdf.get.diminfo(con)$name[var.inq.nc(con, varname)$dimids + 1]
  dims.target  <- c('latitude', 'longitude', 'time')
  dims.order   <- match(dims.target, dims.data)

  if (length(data) == 0)
    data         <- var.get.nc(con, varname)
  data         <- aperm(data, dims.order)
  data         <- data[order(var.get.nc(con, 'latitude'), decreasing = 'TRUE'), , ]
  data         <- data[, order(var.get.nc(con, 'longitude')), ]
  
  return(data)
}
