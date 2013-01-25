\name{date.R2ncdf}
\alias{date.R2ncdf}
\title{convert time vectors in ncdf files to julian days since the start of gregorian calendar   }
\description{This function automatically converts time vectors in ncdf files to a standardized gregorian calendar}
\usage{date.R2ncdf(ncdf.obj, date.vec = "auto", origin = "1582-10-14", 
    write.to.ncdf = TRUE)}
\arguments{
  \item{ncdf.obj}{character string or ncdf connection: ncdf file for which to convert the dates}
  \item{date.vec}{POSIXct vector: date vectors for the time dimension. If set to 'auto', this
is tried to be extracted from the ncdf file}
  \item{origin}{character string: origin to be used for the time vector. This start of the
gregorian calendar should be kept to avoid possible mistakes due to erronous
conversions.}
  \item{write.to.ncdf}{
}
}
\details{This function sets a time vector in a ncdf file to a standardized format which is readable by
most software. It transfers the time vector to days since the start of the gregorian calendar.}
\value{(invisibly): the time vector. Additionally the time vector is written to the respective file.}

\author{Jannis v. Buttlar}





