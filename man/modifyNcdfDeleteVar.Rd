\name{modifyNcdfDeleteVar}
\alias{modifyNcdfDeleteVar}
\title{modifyNcdfDeleteVar}
\description{delete variable using cdo}
\usage{modifyNcdfDeleteVar(fileName, varNames, isVerbose = FALSE, 
    intermediateFilename = paste0(fileName, 
        "_ncdfTools", sample.int(1000, 1)))}
\arguments{
  \item{fileName}{scalar string name of the file, that must not be open}
  \item{varNames}{string vector of variables to delete}
  \item{isVerbose}{set to TRUE to repeat CDO command}
  \item{intermediateFilename}{
}
}
\details{if varName is not found among variable names, does nothing

cdo writes to a temporary file, which then replaces the original.
To avoid copying large files across boundaries of mounted file systems,
the intermediate file is created in the same directory as the original file 
by default.}


\author{Jannis v. Buttlar, Thomas Wutzler}





