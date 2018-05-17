\name{ncdfTools-package}
\alias{ncdfTools-package}
\alias{ncdfTools}
\title{Post Processing of (Half-)Hourly Eddy-Covariance Measurements}
\description{
Set of tools to simplify the handling of NetCDF files with the RNetCDF package. 
Most functions are wrappers of basic functions from the RNetCDF package to 
easily run combinations of these functions for frequently encountered tasks.
}

\details{

Getting information on stored data:
\itemize{
\item on variables: \code{\link{infoNcdfVars}} 
\item on dimensions: \code{\link{infoNcdfDims}}
\item on attributes (global and for variables): \code{\link{infoNcdfAtts}}
\item read coordinate or dimension values from ncdf file: 
\code{\link{readCoordinatesNcdf}}
\item guess (single) variable name: \code{\link{readNcdfVarName}}
\item fast reading of ncdf data: \code{\link{readNcdf}} and 
\code{\link{readNcdfDataframe}}
}%itemize

Modifying NetCDF files
\itemize{
\item copy variable values between ncdf files: \code{\link{modifyNcdfCopyVar}} 
\item delete variable using cdo: \code{\link{modifyNcdfDeleteVar}} 
\item appending history attribute: \code{\link{modifyNcdfAppendHistory}} 
\item copy all attributes between different variables: 
  \code{\link{modifyNcdfCopyAtts}} 
\item copy attributes and dimensions between ncdf files: 
  \code{\link{modifyNcdfCopyMetadata}} 
\item define several ncdf attributes at once: \code{\link{modifyNcdfDefAtts}} 
\item set or read the values of the time dimension in a netCDF file: 
  \code{\link{modifyNcdfWriteTime}} and \code{\link{readNcdfTime}}
\item creating a standard netCDF file: \code{\link{createStdNcdfFile}}   
\item creating a factor dimension: \code{\link{createFactorDim}}   
\item adding missing variables: \code{\link{modifyNcdfAddVars}}   
}%itemize

Conversion between R and NetCDF
\itemize{
\item convert ncdf time to POSIXct and back: 
  \code{\link{POSIX2ncdf}} and \code{\link{ncdf2POSIX}}
}%itemize

Constructing and executing cdo commands producing new ncdf-Files:
\itemize{
\item aggregate data across time: \code{\link{aggregateNcdf}} 
\item merge several ncdf files: \code{\link{transNcdfMerge}} 
\item cut outer (time) margins of Ncdf files: \code{\link{transNcdfCutFiles}} 
\item transpose Ncdf datacube: \code{\link{transNcdfRotate}} 
\item cut subset out of ncdf file: \code{\link{transNcdfSubset}} 
}%itemize

Futher functionality:
\itemize{
\item checking file structure compliance to CF/COARDS/MDI ncdf conventions: 
\code{\link{checkNcdfFile}} 
\item determines ncdf class from R class: \code{\link{classR2Ncdf}} 
\item close all open ncdf connections: \code{\link{closeAllNcfiles}} 
\item checking file structure compliance to CF/COARDS/MDI ncdf conventions: 
\code{\link{checkNcdfFile}} 
\item read data from FLUXNET Ncdf file: \code{\link{readFLUXNETNcdf}} 
}%itemize

Some functionality is tailored for use at BGI department at bgc-jena.mpg.de
\itemize{
\item read data from FLUXNET Ncdf file: \code{\link{readFLUXNETNcdf}} 
}%itemize


No longer supported:
\itemize{
\item transform binary file to ncdf file: convertBinary2Ncdf
\item convert file name to R date: .convertFilename2Date
\item indexDatacube
\item modifyNcdfAddDim
\item registerParallel
\item visualize/plot an overview of a ncdf file of 3d/4d data: 
plotDatacube
}%itemize



}%details


\author{ Department for Biogeochemical Integration at MPI-BGC, Jena, Germany, Jannis v. Buttlar, Thomas Wutzler }


\keyword{package}
