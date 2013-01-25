\name{ncdf.get.varname}
\alias{ncdf.get.varname}
\title{get name of variable in ncdf file}
\description{Try to automatically detect the name of the "main" variable in a ncdf file. The name returned is the
name of the only non coordinate variable. If more than one of these is returned, the name of the variable
having the most dimensions is used.}
\usage{ncdf.get.varname(file)}
\arguments{
  \item{file}{connection to the ncdf file.}
}

\value{character string: name of the variable.   }

\author{Jannis v. Buttlar, MPI BGC Jena, Germany, jbuttlar@bgc-jena.mpg.de
Jannis v. Buttlar}



\seealso{\code{\link[RNetCDF:RNetCDF]{RNetCDF:RNetCDF}}, \code{\link{ncdf.get.varinfo}}}

