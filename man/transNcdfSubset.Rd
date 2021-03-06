\name{transNcdfSubset}
\alias{transNcdfSubset}
\title{transNcdfSubset}
\description{cut subset out of ncdf file}
\usage{transNcdfSubset(file.name, dim.values = list(latitudes = c(), 
    longitudes = c(), timesteps = c()), values.type = c("range", 
    "indices", "values")[2], filename.new = sub("[.]nc", 
    "_subs.nc", file.name))}
\arguments{
  \item{file.name}{character string: name of the file to create.}
  \item{dim.values}{
}
  \item{values.type}{character string:
type of the dim.values supplied. 'range' means that the lower an upper
border are supplied, 'indices' means that 1:n indices are supplied,
'values' means actual coordinate values. }
  \item{filename.new}{character string:
name of the results file.}
}
\details{This function reads a subset of lat/lon/time values out of a ncdf file 
and creates a target ncdf file with the results.
ToDo facilitated other scenarios than lat/lon/time
TODO merge with transNcdfCutTimes}
\value{character string: name of the file created.}

\author{Jannis v. Buttlar, Thomas Wutzler}





