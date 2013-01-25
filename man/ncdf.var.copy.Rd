\name{ncdf.var.copy}
\alias{ncdf.var.copy}
\title{copy variable values between ncdf files}
\description{Copies all values of one variable from one ncdf file to another ncdf file and
takes care of dimensions etc.}
\usage{ncdf.var.copy(file.con.orig, file.con.copy, var.id.copy)}
\arguments{
  \item{file.con.orig}{a NetCDF object pointing to the original ncdf file FROM which to copy the variable}
  \item{file.con.copy}{a NetCDF object pointing to the ncdf file TO which to copy the variable}
  \item{var.id.copy}{The name or id of the variable to copy}
}
\details{The dimensions of the variable to copy have to be also existent (i.e. dimensions with the
same name (not necessarily id)) in the ncdf file to which the variable
should be copied. In addition these dimensions have to have the same sizes.}
\value{Nothing is returned}

\author{Jannis v. Buttlar, MPI BGC Jena, Germany, jbuttlar@bgc-jena.mpg.de
Jannis v. Buttlar}



\seealso{\code{\link{ncdf.fileatts.copy}}, \code{\link{ncdf.var.copy}}, \code{\link{att.copy.nc}}}

