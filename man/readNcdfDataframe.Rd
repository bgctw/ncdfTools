\name{readNcdfDataframe}
\alias{readNcdfDataframe}
\title{readNcdfDataframe}
\description{fast reading of a single point netCDF file into an data.frame}
\usage{readNcdfDataframe(file.name, varPattern = character(), 
    dimVar = "time", isConvertTime = (dimVar == 
        "time"), tzone = "UTC", dimRange = NULL, 
    isAttachingUnit = TRUE)}
\arguments{
  \item{file.name}{character string: name of the ncdf file to read the data from.}
  \item{varPattern}{string vector of regular expression patterns of
variable names to extract, that are concatenated by OR.
Default empty corresponds to all variables.}
  \item{dimVar}{scalar string: name of the single dimension}
  \item{isConvertTime}{if true, the dimension is read by
\code{\link{readNcdfTime}}}
  \item{tzone}{timezone formatting applied to the time dimension.}
  \item{dimRange}{possibility to specify start and end of
the single dimension to read only a subset.
Values must exactly match entries in dimVar}
  \item{isAttachingUnit}{set to FALSE to not try reading unit}
}
\details{Convenience function to automatically read in data from a ncdf file
without specifying variable names and opening file connections.

Expects all variables in the file to be one-dimensional.}
\value{data.frame of all variables in the file. First column is the 
dimension, usually time.}

\author{Jannis v. Buttlar, Thomas Wutzler}



\seealso{\code{\link{updateNcdfDataframe}}}

