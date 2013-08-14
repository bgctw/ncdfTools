infoNcdfAtts <- function(
  ##title<< return a summary of all ncdf variable attributes
   file.con   ##<< a NetCDF object pointing to the respective ncdf file.
   , var.id ='NC_GLOBAL'  ##<< the name or id of the variable for which to display atributes.
)
  ##description<< This function returns a summary of all attributes of a single variable
  ## in a ncdf file
  ##details<<
  ## If an id or variable name is given for 'vaar.id ', attributes from one variable are returned.
  ## Global attributes are returned if 'NC_GLOBAL' is given.
  
  ##seealso<<
  ##\code{\link{infoNcdfDims}}, \code{\link{infoNcdfVars}}, \code{\link[RNetCDF]{att.inq.nc}}
  
  ##author<<
  ## Jannis v. Buttlar, MPI BGC Jena, Germany, jbuttlar@bgc-jena.mpg.de
{
    if  (var.id == 'NC_GLOBAL') {
         n.atts              <- file.inq.nc(file.con)$ngatts
    } else {
        n.atts               <- var.inq.nc(file.con,var.id)$natts
    }
##value<<
## A matrix containing the name, value and type (columns) of all attributes (rows)
    att.info <- matrix(NA, n.atts, 3)
    if (n.atts > 0) {
        colnames(att.info)   <- c('name', 'value', 'type')
        for (i in 1:n.atts) {
            att.info[i,1]    <- att.inq.nc(file.con, var.id, i - 1)$name
            att.values.t     <- att.get.nc(file.con, var.id,i - 1)
            if (length(att.values.t) > 1)
                att.values.t <- paste(att.values.t,collapse='; ')
            att.info[i,2]    <- att.values.t
            att.info[i,3]    <- att.inq.nc(file.con,var.id,i-1)$type
        }
    }
    return(att.info)
}