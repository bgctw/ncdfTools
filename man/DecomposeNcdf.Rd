\name{DecomposeNcdf}
\alias{DecomposeNcdf}
\title{spectral decomposition o ftimeseries inside a ncdf file.}
\description{Wrapper function to automatically decompose gridded time series inside a ncdf file and save the results
to another ncdf file using SSA.}
\usage{DecomposeNcdf(file.name, borders.wl, M = c(), harmonics = c(), 
    n.comp = c(), pad.series = c(0, 0), center.series = TRUE, 
    repeat.extr = rep(1, times = length(borders.wl)), var.name = "auto", 
    print.status = TRUE, calc.parallel = TRUE, tresh.const = 1e-12, 
    ratio.const = 0.05, package.parallel = "doMC", max.cores = 16, 
    check.files = TRUE, debugging = FALSE, ...)}
\arguments{
  \item{file.name}{character: name of the ncdf file to decompose. The file has to be in the current working directory!}
  \item{borders.wl}{list: borders of the different periodicity bands to extract. Units are
sampling frequency of the series. In case of monthly data border.wl<- list(c(11, 13))
would extract the annual cycle (period = 12). For details, see the documentation of FilterTSeriesSSA.}
  \item{M}{SSA calculation parameter. Window length for time series embedding (can be different
for each element in borders.wl): see the documentation of FilterTSeriesSSA.}
  \item{harmonics}{SSA calculation parameter: Number of harmonics to be associated with each band. See the
documentation of FilterTSeriesSSA!}
  \item{n.comp}{SSA calculation parameter: see the documentation of FilterTSeriesSSA!}
  \item{pad.series}{SSA calculation parameter: see the documentation of FilterTSeriesSSA!}
  \item{center.series}{SSA calculation parameter: see the documentation of FilterTSeriesSSA!}
  \item{repeat.extr}{SSA calculation parameter: see the documentation of FilterTSeriesSSA!}
  \item{var.name}{character string: name of the variable to fill. If set to 'auto' (default), the name
is taken from the file as the variable with a different name than the dimensions. An
error is produced here in cases where more than one such variables exist.}
  \item{print.status}{logical: whether to print status information during the process}
  \item{calc.parallel}{logical: whether to use parallel computing. Needs package doMC or doSMP to process.}
  \item{tresh.const}{numeric: value below which abs(values) are assumed to be constant and excluded
from the decomposition}
  \item{ratio.const}{numeric: max ratio of the time series that is allowed to be above tresh.const for the time series
still to be not cosidered constant.}
  \item{package.parallel}{character: package to use for linking foreach to
the parallel computing backend. Only doMC as the algorithm has been
extensively tested with this package.!}
  \item{max.cores}{integer: maximum number of cores to use.}
  \item{check.files}{
}
  \item{debugging}{
}
  \item{\dots}{additional arguments transferred to FilterTSeriesSSA.}
}

\value{Nothing is returned but a ncdf file with the results is written in the working directory.}

\author{Jannis v. Buttlar, MPI BGC Jena, Germany, jbuttlar@bgc-jena.mpg.de
TODO add mechanism to get constant values in datacube after calculation.
TODO Try zero line crossings for frequency determination
TODO Make method reproducible (seed etc)
TODO Add way to handle non convergence
save argument values of call
load libraries
check input
load data
Jannis v. Buttlar}



\seealso{\code{\link{ssa}}, \code{\link{FilterTSeriesSSA}}, \code{\link{GapfillNcdf}}}
\examples{
## Example for the filtering of monthly data
setwd('<path to input file>')
filename   <- '<filename>.nc'
# Extract yearly cycle, intra annual part and high frequency residual in several steps
borders.wl <- list(a = c(10, 14)
                   , b = c(12, Inf)
                   , c = c(0, 12))
M         <- c(2*12, 4*12, 12)
#extract first for harmonics for yearly cycle
harmonics <- c(4, 0, 0)
decompose.ncdf(file.name = filename, borders.wl = borders.wl, M = M, harmonics = harmonics)

# Extract yearly cycle, intra annual part and high frequency residual in one step
borders.wl <- list(c(0,10,14,Inf))
# use the same M for all bands
M          <- c(2*12)
decompose.ncdf(file.name = filename, borders.wl = borders.wl, M = M)
}
