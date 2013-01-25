\name{ncdf.get.diminfo}
\alias{ncdf.get.diminfo}
\title{show info about all dimensions in a ncdf file}
\description{This function displays summary information about all dimensions in an open ncdf file}
\usage{ncdf.get.diminfo(file.con, extended = TRUE)}
\arguments{
  \item{file.con}{a NetCDF object pointing to the respective ncdf file.}
  \item{extended}{
}
}

\value{A matrix containing the id, name, length, range and step (columns) of all dimensions (rows)}

\author{Jannis v. Buttlar, MPI BGC Jena, Germany, jbuttlar@bgc-jena.mpg.de
Jannis v. Buttlar}



\seealso{\code{\link{ncdf.get.varinfo}}, \code{\link{dim.inq.nc}}}

