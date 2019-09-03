\name{modifyNcdfCopyMetadata}
\alias{modifyNcdfCopyMetadata}
\title{modifyNcdfCopyMetadata}
\description{copy attributes and dimensions between ncdf files}
\usage{modifyNcdfCopyMetadata(file.con.orig, file.con.copy, 
    glob.atts = TRUE, dimensions = TRUE)}
\arguments{
  \item{file.con.orig}{a NetCDF object pointing to the respective
ncdf file from which to copy}
  \item{file.con.copy}{a NetCDF object pointing to the respective
ncdf file to which to copy}
  \item{glob.atts}{logical: whether to copy all global attributes}
  \item{dimensions}{logical: whether to copy all dimensions}
}
\details{This function copies all global attributes and/or all dimensions from one
ncdf file to another.}
\value{nothing is returned.}

\author{Jannis v. Buttlar, Thomas Wutzler}



\seealso{\code{\link{modifyNcdfCopyVar}}, \code{\link[RNetCDF]{att.copy.nc}}}

