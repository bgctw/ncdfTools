ncdf.var.copy <- function(
##title<< copy variable values between ncdf files
##description<< Copies all values of one variable from one ncdf file to another ncdf file and
## takes care of dimensions etc.
    file.con.orig        ##<< a NetCDF object pointing to the original ncdf file FROM which to copy the variable
    , file.con.copy      ##<< a NetCDF object pointing to the ncdf file TO which to copy the variable
    , var.id.copy        ##<< The name or id of the variable to copy
    )
##details<<
##The dimensions of the variable to copy have to be also existent (i.e. dimensions with the
##same name (not necessarily id)) in the ncdf file to which the variable
##should be copied. In addition these dimensions have to have the same sizes.

##seealso<<
##\code{\link{ncdf.fileatts.copy}}, \code{\link{ncdf.var.copy}}, \code{\link{att.copy.nc}}

##author<<
## Jannis v. Buttlar, MPI BGC Jena, Germany, jbuttlar@bgc-jena.mpg.de

##value<<
##Nothing is returned
{
    var.name           <- var.inq.nc(file.con.orig, var.id.copy)$name
    var.type           <- var.inq.nc(file.con.orig, var.id.copy)$type
    dim.names.file.orig<- ncdf.get.diminfo(file.con.orig)$name
    dim.names.file.copy<- ncdf.get.diminfo(file.con.copy)$name
    dim.ids.var.orig   <- var.inq.nc(file.con.orig, var.id.copy)$dimids
    dim.ids.var.copy   <- var.inq.nc(file.con.orig, var.id.copy)$dimids
    dim.names.var      <- dim.names.file.orig[ dim.ids.var.orig + 1]
    dim.lengths.copy   <- ncdf.get.diminfo(file.con.copy)$length[dim.ids.var.copy + 1]
    dim.lengths.orig   <- ncdf.get.diminfo(file.con.orig)$length[dim.ids.var.orig + 1]
    if (sum(!dim.lengths.copy == dim.lengths.orig) > 0)
        stop('Dimensions in both files do not have the same size!')
    dim.ids.var.copy   <- match(dim.names.var, dim.names.file.copy)-1
    var.def.nc(file.con.copy, var.name, var.type, dim.ids.var.copy)
    ncdf.att.copy(file.con.orig, var.name, var.name, file.con.copy)
}
