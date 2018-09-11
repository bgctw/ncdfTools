readNcdfVarName <- function(
  ### get name of variable in ncdf file
  file ##<< connection to the ncdf file.
) {
  ##description<<
  ## Try to automatically detect the name of the "main" variable in a ncdf file. 
  ## The name returned is the
  ## name of the only non coordinate variable. If more than one of these is 
  ## returned, the name of the variable
  ## having the most dimensions is used.
  ## If there are still more than one variable, try to match the filename
  ##seealso<<
  ## \code{\link{infoNcdfVars}}
  if (class(file) == 'character') {
    file.con <- open.nc(file)
    on.exit(close.nc(file.con)) # when opened file, close on exit
  } else {
    file.con <- file
  }  
  infoVars <- infoNcdfVars(file.con, order.var = 'id', dimvars = FALSE)
  infoDims <- infoNcdfDims(file.con, extended = FALSE)
  var.name         <- infoVars$name
  names.excluded   <- c('time_bnds')
  var.name         <- setdiff(var.name, names.excluded)
  var.name         <- var.name[!grepl('flag.orig$', var.name)]
  if (length(var.name) > 1) {
    posVars <- match(var.name, infoVars$name)
    #var.id.nocoord <- infoVars[posVars, 1]
    #var.nocoord.ndims <- infoVars[infoVars$id == var.id.nocoord, 4]
    var.nocoord.ndims <- infoVars$n.dims[posVars]
    posVarsMax <- posVars[ var.nocoord.ndims  == max(var.nocoord.ndims)]
    if (length(posVarsMax) > 1 && class(file) == 'character') {
      # take the one that matches the filename
      names.nocoord <- infoVars$name[posVarsMax]
      var.name <- names.nocoord[which(!is.na(pmatch(names.nocoord, basename(file))))]
    }
  } 
  if ((length(var.name) != 1) ) stop('Not possible to detect variable name!')
  ##value<< character string: name of the variable.   
  return(var.name)
}  
