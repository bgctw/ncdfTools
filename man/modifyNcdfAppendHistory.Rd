\name{modifyNcdfAppendHistory}
\alias{modifyNcdfAppendHistory}
\title{modifyNcdfAppendHistory}
\description{automatically append string to ncdf history}
\usage{modifyNcdfAppendHistory(file, string, user = Sys.info()["user"])}
\arguments{
  \item{file}{character sting or RNetCDF file connection: file to write to.}
  \item{string}{character string: string to append to the history}
  \item{user}{character string of the user}
}
\details{Convenience function to append a string together with the current date 
and the user to the history attribute of an Ncdf file. }
\value{nothing is returned}

\author{Jannis v. Buttlar, Thomas Wutzler}





