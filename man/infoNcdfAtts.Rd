\name{infoNcdfAtts}
\alias{infoNcdfAtts}
\title{infoNcdfAtts}
\description{get summary of all ncdf variable attributes
Returns a summary of all attributes of a single variable
in a ncdf file}
\usage{infoNcdfAtts(file.con, var.id = "NC_GLOBAL")}
\arguments{
  \item{file.con}{a NetCDF object pointing to the respective ncdf file.}
  \item{var.id}{the name or id of the variable for which to
display attributes.}
}
\details{If an id or variable name is given for 'var.id ', attributes from one 
variable are returned.
Global attributes are returned if 'NC_GLOBAL' is given. }
\value{A matrix containing the name, value and type (columns) of 
all attributes (rows)}

\author{Jannis v. Buttlar, Thomas Wutzler}



\seealso{\code{\link{infoNcdfDims}}, \code{\link{infoNcdfVars}}
, \code{\link[RNetCDF]{att.inq.nc}}}

