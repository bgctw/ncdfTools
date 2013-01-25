\name{ncdf.att.copy}
\alias{ncdf.att.copy}
\title{copy all attributes between different variables}
\description{copies all attributes from one variable in a ncdf file to another variable}
\usage{ncdf.att.copy(file.con.orig, var.orig, var.copy, file.con.copy = file.con.orig)}
\arguments{
  \item{file.con.orig}{a NetCDF object pointing to the original ncdf file from which to copy the attributes}
  \item{var.orig}{the name or id of the variable FROM which to copy all atributes}
  \item{var.copy}{the name or id of the variable TO which to copy all atributes}
  \item{file.con.copy}{a NetCDF object pointing to the ncdf file to which to copy the
attributes (same as file.con.orig by default)}
}



\author{Jannis v. Buttlar, MPI BGC Jena, Germany, jbuttlar@bgc-jena.mpg.de
Jannis v. Buttlar}



\seealso{\code{\link{ncdf.fileatts.copy}}, \code{\link{ncdf.var.copy}}, \code{\link{att.copy.nc}}}

