\name{transNcdfMerge}
\alias{transNcdfMerge}
\title{transNcdfMerge}
\description{merge several ncdf files}
\usage{transNcdfMerge(file.names, name.change = function(x) return(x), 
    time.diff = NULL, fun.start = NULL, fun.end = NULL, 
    time.range.out = c(), format = character(), 
    convert = .getChronDateFromName1, path.target = getwd(), 
    target.name = "")}
\arguments{
  \item{file.names}{character vector: names of the files to merge.}
  \item{name.change}{
}
  \item{time.diff}{maximum time difference to be allowed between
two subsequent input files.}
  \item{fun.start}{function: function to retrieve the start date from
the file name e.g. function(x) substr(x, nchar(x)-15, nchar(x)-10)}
  \item{fun.end}{see fun.start}
  \item{time.range.out}{POSIXct vector: (start date, end date): start
and end dates of the final file. If not supplied,  all available data
are used.}
  \item{format}{character string: see ?transNcdfCutFile}
  \item{convert}{
}
  \item{path.target}{file path: where to copy to the results files.}
  \item{target.name}{
}
}
\details{Convenience wrapper around cdo to merge several ncdf files containing
subsequent time steps into one continuous file.
TODO provide example
TODO useful defaults
TODO detect overlapping time spans}
\value{list: name of the file created and its time range.}

\author{Jannis v. Buttlar, Thomas Wutzler}





