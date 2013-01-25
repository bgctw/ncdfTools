\name{ncdf.fileatts.copy}
\alias{ncdf.fileatts.copy}
\title{copy attributes and dimensions between ncdf files}
\description{Copies all global attributes and/or all dimensions from one ncdf file to another}
\usage{ncdf.fileatts.copy(file.con.orig, file.con.copy, glob.atts = TRUE, 
    dimensions = TRUE)}
\arguments{
  \item{file.con.orig}{a NetCDF object pointing to the respective ncdf file from which to copy}
  \item{file.con.copy}{a NetCDF object pointing to the respective ncdf file to which to copy}
  \item{glob.atts}{logical: whether to copy all global attributes}
  \item{dimensions}{logical: whether to copy all dimensions}
}



\author{Jannis v. Buttlar, MPI BGC Jena, Germany, jbuttlar@bgc-jena.mpg.de
Jannis v. Buttlar}



\seealso{\code{\link{ncdf.fileatts.copy}}, \code{\link{ncdf.var.copy}}, \code{\link[RNetCDF:att.copy.nc]{att.copy.nc}}}

