\name{modifyNcdfDefAtts}
\alias{modifyNcdfDefAtts}
\title{modifyNcdfDefAtts}
\description{define several ncdf attributes at once}
\usage{modifyNcdfDefAtts(file.con, var.id, atts)}
\arguments{
  \item{file.con}{a NetCDF object pointing to the respective ncdf file.}
  \item{var.id}{the variable id (integer) or name (string) for which to
define attributes.}
  \item{atts}{list: the attributes to define (see details or an example).}
}
\details{Easily define a couple of attributes for a single ncdf variable in one step.

The atts attribute should be a list with as many elements as attributes 
should be added to the
variable in the ncdf file. The names of the attributes are taken from the 
names of the
elements of this list and the attribute values are defined by the values 
of the list elements.
The type/class of the attribute (values) is determined automatically.}


\author{Jannis v. Buttlar, Thomas Wutzler}



\seealso{\code{\link[RNetCDF]{att.put.nc}}}
\examples{
attributes.define <- list(
  LongName = 'This is the long name',
  missingValue = -99999,
  units = 'm/s')
## needs an open connection to a valid ncdf file pointed to by file.con
file.con   <- RNetCDF::create.nc(file.path(tempdir(),'test.nc'))
RNetCDF::dim.def.nc(file.con, 'testdim')
RNetCDF::var.def.nc(file.con, 'test', 'NC_CHAR', 'testdim')
modifyNcdfDefAtts(file.con, 'test', atts = attributes.define)
## show all attributes
infoNcdfAtts(file.con, 'test')
RNetCDF::close.nc(file.con)
}
