\name{updateNcdfDataframe}
\alias{updateNcdfDataframe}
\title{updateNcdfDataframe}
\description{fast writing of a data.frame to a single point netCDF file }
\usage{updateNcdfDataframe(ds, file.name, dimVar = "time", 
    isConvertTime = (dimVar == "time"))}
\arguments{
  \item{ds}{data.frame to write to file}
  \item{file.name}{character string: name of the ncdf file file to write to.}
  \item{dimVar}{scalar string: name of the single dimension}
  \item{isConvertTime}{if true, the dimension is converted
by \code{\link{readNcdfTime}}}
}
\details{Convenience function to automatically write data toa ncdf file
without specifying variable names and opening file connections.

Expects dim-column to be equidistant and with all

Expects variables of all columns in \code{ds} to be defined
In the ncdf file

Expects the dim column to be a contiguous slice of the
dimension of the ncdf file}


\author{Jannis v. Buttlar, Thomas Wutzler}



\seealso{\code{\link{readNcdfDataframe}}}

