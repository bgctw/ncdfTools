ncdf.get.varname <- function(
  file.con ##<< connection to the ncdf file.
)
##title<<
## get name of variable in ncdf file

##description<<
## Try to automatically detect the name of the "main" variable in a ncdf file. The name returned is the
## name of the only non coordinate variable. If more than one of these is returned, the name of the variable
## having the most dimensions is used.

##seealso<<
## \code{\link[RNetCDF]{RNetCDF}}, \code{\link{ncdf.get.varinfo}}

  ##author<<
  ## Jannis v. Buttlar, MPI BGC Jena, Germany, jbuttlar@bgc-jena.mpg.de
{  
  var.name         <- setdiff(ncdf.get.varinfo(file.con, order.var ='id')$name, ncdf.get.diminfo(file.con, extended = FALSE)$name)
  if(length(var.name) > 1) {
    var.id.nocoord <- ncdf.get.varinfo(file.con, order.var ='id')[match(var.name, ncdf.get.varinfo(file.con, order.var ='id')$name), 1] 
    var.ind <- var.id.nocoord[which.max(ncdf.get.varinfo(file.con, order.var ='id')[var.id.nocoord + 1, 4])] + 1
    if (length(var.ind) > 1) {
      stop('Not possible to detect variable name!')
    } else {
      var.name <-ncdf.get.varinfo(file.con, order.var ='id')$name[var.ind]         
    }
  }
  ##value<< character string: name of the variable.   
  return(var.name)
}  
