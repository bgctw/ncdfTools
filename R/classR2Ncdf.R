classR2Ncdf = function(
  ### transfers R classes to ncdf classes
  object ##<< object which class should be determined
) {
  ##description<<
  ## Crudely determines the ncdf class from R classes. Only integer, character
  ## and double are implemented yet.
  if (class(object) == 'numeric' || class(object) == 'integer') {
    if ((sum(abs(object - round(object)) < .Machine$double.eps ^ 0.5) == length(object)) &
        (min(object, na.rm = TRUE) > -32.768 & max(object, na.rm = TRUE) < 32.767)) {
      ncdf.class <- 'NC_INT'
    } else {
      ncdf.class <- 'NC_DOUBLE'
    }
  } else {
    ncdf.class     <- 'NC_CHAR'
  }
  ##value<< character string: ncdf class used in the RNetCDF package.
  return(ncdf.class)
}
