\name{transNcdfCutFiles}
\alias{transNcdfCutFiles}
\title{transNcdfCutFiles}
\description{cut margins of ncdf files}
\usage{transNcdfCutFiles(file.names, time.range.out = c(), 
    time.range.file = c(), fun.start = c(), 
    fun.end = c(), format = "", convert = .getChronDateFromName1)}
\arguments{
  \item{file.names}{vector of character strings: file names to process.}
  \item{time.range.out}{
}
  \item{time.range.file}{POSIXct vector of length two or 'auto':
time range of the  original files. If not supplied, this is 
determined automatically from the file name 
via .convertFilename2Date and fun.start/fun.end.}
  \item{fun.start}{see time.range.file}
  \item{fun.end}{see time.range.file}
  \item{format}{
}
  \item{convert}{
}
}
\details{Convenience wrapper around cdo to cut outer (time) margins 
of Ncdf files.}
\value{character string: names of the file names after cutting.}

\author{Jannis v. Buttlar, Thomas Wutzler}



\seealso{\code{\link{transNcdfMerge}}              
TODO implement possibility to supply dates
TODO implement possibility to extract dates from file
TODO useful defaults}

