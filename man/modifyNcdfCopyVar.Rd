\name{modifyNcdfCopyVar}
\alias{modifyNcdfCopyVar}
\title{modifyNcdfCopyVar}
\description{copy variable values between ncdf files}
\usage{modifyNcdfCopyVar(file.con.orig, file.con.copy = file.con.orig, 
    var.id.orig, var.id.copy = var.id.orig)}
\arguments{
  \item{file.con.orig}{a NetCDF object pointing to the original ncdf file
FROM which to copy the variable.}
  \item{file.con.copy}{a NetCDF object pointing to the
ncdf file TO which to copy the variable.}
  \item{var.id.orig}{character string or ncdf variable id:
The name or id of the variable to copy from.}
  \item{var.id.copy}{character string or ncdf variable id:
The name or id of the variable to copy to.}
}
\details{Copies all values of one variable from one ncdf file to another 
ncdf file and takes care of dimensions etc.

Two cases are implemented: 
Case 1: copy of one variable and attributes from one file to another file:
The dimensions of the variable to copy have to be also existent (i.e. 
dimensions with the same name (not necessarily id)) in the ncdf file to 
which the variable should be copied. In addition these dimensions have to 
have the same sizes.

Case 2: copy of one variable to another one (of different name) in the 
same file.}
\value{Nothing is returned}

\author{Jannis v. Buttlar, Thomas Wutzler}



\seealso{\code{\link{modifyNcdfCopyMetadata}}, \code{\link[RNetCDF]{att.copy.nc}}}

