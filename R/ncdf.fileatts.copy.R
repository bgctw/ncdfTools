ncdf.fileatts.copy <- function(
##title<< copy attributes and dimensions between ncdf files
##description<< Copies all global attributes and/or all dimensions from one ncdf file to another
    file.con.orig        ##<< a NetCDF object pointing to the respective ncdf file from which to copy
    , file.con.copy      ##<< a NetCDF object pointing to the respective ncdf file to which to copy
    , glob.atts = TRUE   ##<< logical: whether to copy all global attributes
    , dimensions = TRUE  ##<< logical: whether to copy all dimensions
    )
##seealso<<
##\code{\link{ncdf.fileatts.copy}}, \code{\link{ncdf.var.copy}}, \code{\link[RNetCDF:att.copy.nc]{att.copy.nc}}

##author<<
## Jannis v. Buttlar, MPI BGC Jena, Germany, jbuttlar@bgc-jena.mpg.de
{
    n.dims <- file.inq.nc(file.con.orig)$ndims
    n.atts <- file.inq.nc(file.con.orig)$ngatts

    if (glob.atts)
        for (i in 1:n.atts)
        {
            att.name  <- att.inq.nc(file.con.orig, 'NC_GLOBAL', i - 1)$name
            att.type  <- att.inq.nc(file.con.orig, 'NC_GLOBAL', i - 1)$type
            att.value <- att.get.nc(file.con.orig, 'NC_GLOBAL', att.name)
            att.put.nc(file.con.copy, 'NC_GLOBAL', att.name, att.type, att.value)
        }
    if (dimensions)
        for (i in 1:n.dims)
        {
            dim.name   <- dim.inq.nc(file.con.orig, i - 1)$name
            dim.length <- dim.inq.nc(file.con.orig, i - 1)$length
            dim.def.nc(file.con.copy, dim.name, dim.length)
            if (is.element(dim.name, ncdf.get.varinfo(file.con.orig)$name)) {
               var.def.nc(file.con.copy, dim.name, 'NC_DOUBLE', i - 1)
               var.put.nc(file.con.copy, dim.name, var.get.nc(file.con.orig, dim.name))  
               ncdf.att.copy(file.con.orig, dim.name, dim.name, file.con.copy)
             }
          }
  }
