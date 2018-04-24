modifyNcdfCopyMetadata <- function(
  ### copy attributes and dimensions between ncdf files
  file.con.orig        ##<< a NetCDF object pointing to the respective 
  ## ncdf file from which to copy
  , file.con.copy      ##<< a NetCDF object pointing to the respective 
  ## ncdf file to which to copy
  , glob.atts = TRUE   ##<< logical: whether to copy all global attributes
  , dimensions = TRUE  ##<< logical: whether to copy all dimensions
) {
  ##details<<
  ## This function copies all global attributes and/or all dimensions from one
  ## ncdf file to another.
  #
  ##seealso<<
  ##\code{\link{modifyNcdfCopyVar}}, \code{\link[RNetCDF]{att.copy.nc}}
  fileInqOrig  <- file.inq.nc(file.con.orig)
  n.dims <- fileInqOrig$ndims
  n.atts <- fileInqOrig$ngatts
  if (glob.atts) {
    for (i in 1:n.atts) {
      attInq <- att.inq.nc(file.con.orig, 'NC_GLOBAL', i - 1)
      att.name  <- attInq$name
      att.type  <- attInq$type
      att.value <- att.get.nc(file.con.orig, 'NC_GLOBAL', att.name)
      att.put.nc(file.con.copy, 'NC_GLOBAL', att.name, att.type, att.value)
    }
  }
  if (dimensions) {
    for (i in 1:n.dims) {
      dimInq <- dim.inq.nc(file.con.orig, i - 1)
      dim.name   <- dimInq$name
      dim.length <- dimInq$length
      dim.def.nc(file.con.copy, dim.name, dim.length)
      if (is.element(dim.name, infoNcdfVars(file.con.orig)$name)) {
        var.def.nc(file.con.copy, dim.name, 'NC_DOUBLE', i - 1)
        var.put.nc(file.con.copy, dim.name, var.get.nc(file.con.orig, dim.name))  
        modifyNcdfCopyAtts(file.con.orig, dim.name, dim.name, file.con.copy)
      }
    }
  }
  ##value<< nothing is returned.
}
