\name{modifyNcdfAddVars}
\alias{modifyNcdfAddVars}
\title{modifyNcdfAddVars}
\description{add a variable definition }
\usage{modifyNcdfAddVars(ncFile, varNames, units = "1", 
    dimNames = c("latitude", "longitude", 
        "time"), isStopOnOverriding = TRUE, 
    scale_factor = 1, add_offset = 0, type.var = "NC_DOUBLE", 
    missing_value = -9999, dimVars = "time", 
    user = Sys.info()["user"])}
\arguments{
  \item{ncFile}{character string: name of the target file.}
  \item{varNames}{character vector: names of the}
  \item{units}{string vector: units of the variables in target file.}
  \item{dimNames}{
}
  \item{isStopOnOverriding}{set to FALSE to disregard variables alread defined}
  \item{scale_factor}{numeric: scale factor}
  \item{add_offset}{numeric: offset}
  \item{type.var}{character string: type of the data}
  \item{missing_value}{numeric: missing data value}
  \item{dimVars}{the name of the time variable}
  \item{user}{user name put to history entry}
}



\author{Jannis v. Buttlar, Thomas Wutzler}





