\name{readNcdfVarName}
\alias{readNcdfVarName}
\title{readNcdfVarName}
\description{get name of variable in ncdf file
Try to automatically detect the name of the "main" variable in a ncdf file. 
The name returned is the
name of the only non coordinate variable. If more than one of these is 
returned, the name of the variable
having the most dimensions is used.
If there are still more than one variable, try to match the filename}
\usage{readNcdfVarName(file)}
\arguments{
  \item{file}{connection to the ncdf file.}
}

\value{character string: name of the variable.   }

\author{Jannis v. Buttlar, Thomas Wutzler}



\seealso{\code{\link{infoNcdfVars}}}

