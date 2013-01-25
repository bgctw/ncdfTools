\name{ncdf.def.all.atts}
\alias{ncdf.def.all.atts}
\title{define several ncdf attributes at once}
\description{Easily define a couple of attributes for a single ncdf variable in one step.}
\usage{ncdf.def.all.atts(file.con, var.id, atts)}
\arguments{
  \item{file.con}{a NetCDF object pointing to the respective ncdf file.}
  \item{var.id}{the variable id (integer) or name (string) for which to define attributes.}
  \item{atts}{list: the attributes to define (see details or an example).}
}
\details{The atts attribute should be a list with as many elements as attributes should be added to the
variable in the ncdf file. The names of the attributes are taken from the names of the
elements of this list and the attribute values are defined by the values of the list elements.
The type/class of the attribute (values) is determined automatically.}


\author{Jannis v. Buttlar, MPI BGC Jena, Germany, jbuttlar@bgc-jena.mpg.de
Jannis v. Buttlar}



\seealso{\code{\link[RNetCDF:att.put.nc]{att.put.nc}}}
\examples{
#needs an open connection to a valid ncdf file pointed to by file.con
attributes.define <- list(LongName = 'This is the long name',
                         missingValue = -99999,
                         units = 'm/s')
ncdf.def.all.atts(file.con, 1, atts = attributes.define)

#show all atributes
ncdf.get.attinfo(file.con, 1)
}
