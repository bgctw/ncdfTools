\name{readNcdf}
\alias{readNcdf}
\title{readNcdf}
\description{fast reading of a single variable netCDF file into an array}
\usage{readNcdf(file.name, var.name = c(), isAttachingUnit = TRUE)}
\arguments{
  \item{file.name}{character string: name of the ncdf file file to read the data from.}
  \item{var.name}{scalar string: name of the variable to extract.
If not supplied,
this is tried to be determined with readNcdfVarName().}
  \item{isAttachingUnit}{set to FALSE to not try reading unit}
}
\details{Convenience function to automatically read in data from a ncdf file
without specifying variable names and opening file connections.}
\value{(multidimensional) array: data from the ncdf file.
With unit in attribute units and if package units is there as unidata unit}

\author{Jannis v. Buttlar, Thomas Wutzler}





