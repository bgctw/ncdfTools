\name{transNcdfRotate}
\alias{transNcdfRotate}
\title{transNcdfRotate}
\description{transpose Ncdf datacube}
\usage{transNcdfRotate(data.object, file.name.out = "none", 
    file.con = c(), var.name = c())}
\arguments{
  \item{data.object}{RNetCDF file connection or R array: data object to be transposed.}
  \item{file.name.out}{character string: name of the
ncdf file created for the results. Default 'none' means that no
results file is created.}
  \item{file.con}{RNetCDF file connection: link to the data object to be
transposed. 
Supplying both data.object and file.con only makes sense if data.object
is an array which saves time as the data does not have to be loaded again.              }
  \item{var.name}{character string: name of the variable to transpose. If
not gives, this name is tried to be inferred by using readNcdfVarName.}
}
\details{convenience function to transpose an arbitrary datacube in a ncdf 
file into a datacube with dimensions [latitude (decreasing)
, longitude (increasing), time (increasing)].}
\value{array: transposed datacube}

\author{Jannis v. Buttlar, Thomas Wutzler}





