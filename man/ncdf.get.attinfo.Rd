\name{ncdf.get.attinfo}
\alias{ncdf.get.attinfo}
\title{return a summary of all ncdf variable attributes}
\description{This function returns a summary of all attributes of a single variable
in a ncdf file}
\usage{ncdf.get.attinfo(file.con, var.id)}
\arguments{
  \item{file.con}{a NetCDF object pointing to the respective ncdf file.}
  \item{var.id}{the name or id of the variable for which to display atributes.}
}
\details{If an id or variable name is given for 'vaar.id ', attributes from one variable are returned.
Global attributes are returned if 'NC_GLOBAL' is given.}
\value{A matrix containing the name, value and type (columns) of all attributes (rows)}

\author{Jannis v. Buttlar, MPI BGC Jena, Germany, jbuttlar@bgc-jena.mpg.de
Jannis v. Buttlar}



\seealso{\code{\link{ncdf.get.diminfo}}, \code{\link{ncdf.get.varinfo}}, \code{\link[RNetCDF:att.inq.nc]{att.inq.nc}}}

