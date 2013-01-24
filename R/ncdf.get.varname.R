ncdf.get.varname <- function(
  file ##<< connection to the ncdf file.
)
##title<<
## get name of variable in ncdf file

##description<<
## Try to automatically detect the name of the "main" variable in a ncdf file. The name returned is the
## name of the only non coordinate variable. If more than one of these is returned, the name of the variable
## having the most dimensions is used.

##seealso<<
## \code{\link[RNetCDF:RNetCDF]{RNetCDF:RNetCDF}}, \code{\link{ncdf.get.varinfo}}

  ##author<<
  ## Jannis v. Buttlar, MPI BGC Jena, Germany, jbuttlar@bgc-jena.mpg.de
{
  require(RNetCDF)
  if (class(file) == 'character') {
    file.con <- open.nc(file)
  } else {
    file.con <- file
  }  
  var.name         <- setdiff(ncdf.get.varinfo(file.con, order.var ='id')$name, ncdf.get.diminfo(file.con, extended = FALSE)$name)
  names.excluded   <- c('time_bnds', 'flag.orig')
  var.name         <- setdiff(var.name, names.excluded)
  if(length(var.name) > 1) {
    var.id.nocoord <- ncdf.get.varinfo(file.con, order.var ='id')[match(var.name, ncdf.get.varinfo(file.con, order.var ='id')$name), 1]
    var.nocoord.ndims <- ncdf.get.varinfo(file.con, order.var ='id')[var.id.nocoord + 1, 4]
    var.id <- var.id.nocoord[var.nocoord.ndims == max(var.nocoord.ndims)]    
    if (length(var.id) > 1 && class(file) == 'character') {
      names.nocoord <- ncdf.get.varinfo(file.con, order.var = 'id')[var.id + 1,'name']
      var.id        <- var.id[which(!is.na(pmatch(names.nocoord, file)))]
    }
    if ((length(var.id) > 1) ) {
      stop('Not possible to detect variable name!')
    } else {
      var.name <-ncdf.get.varinfo(file.con, order.var ='id')$name[var.id + 1]         
    }
  }
  if (class(file) == 'character') {
    close.nc(file.con)
  } 
  ##value<< character string: name of the variable.   
  return(var.name)
}  
