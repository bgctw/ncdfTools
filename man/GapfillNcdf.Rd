\name{GapfillNcdf}
\alias{GapfillNcdf}
\title{fill gaps in time series or spatial fields inside a ncdf file using SSA.}
\description{Wrapper function to automatically fill gaps in series or spatial fields inside a ncdf file and save the results
to another ncdf file.}
\usage{GapfillNcdf(file.name, process.type = c("stepwise", "variances")[1], 
    M, dimensions = list(list("time")), MSSA = rep(list(rep(list(FALSE), 
        times = length(dimensions[[1]]))), times = length(dimensions)), 
    MSSA.blocksize = 1, gaps.cv = 0, MSSA.blck.trsh = tresh.fill[[1]][[1]], 
    amnt.artgaps = rep(list(rep(list(c(0.05, 0.05)), times = length(dimensions[[1]]))), 
        times = length(dimensions)), size.biggap = rep(list(rep(list(20), 
        times = length(dimensions[[1]]))), times = length(dimensions)), 
    amnt.iters = rep(list(rep(list(c(10, 10)), times = length(dimensions[[1]]))), 
        times = length(dimensions)), amnt.iters.start = rep(list(rep(list(c(1, 
        1)), times = length(dimensions[[1]]))), times = length(dimensions)), 
    n.comp = lapply(amnt.iters, FUN = function(x) x[[1]][[1]][1] * 
        2), pad.series = rep(list(rep(list(c(0, 0)), times = length(dimensions[[1]]))), 
        times = length(dimensions)), tresh.fill = c(list(list(0.1)), 
        rep(list(list(0, 0)), length(dimensions) - 1)), tresh.fill.first = list(tresh.fill[[1]]), 
    max.steps = 10, ratio.test = 1, force.all.dims = FALSE, var.name = "auto", 
    ocean.mask = c(), process.cells = c("gappy", "all")[1], first.guess = "mean", 
    tresh.const = 1e-12, ratio.const = 0.05, keep.steps = TRUE, 
    print.status = TRUE, calc.parallel = TRUE, package.parallel = "doMC", 
    max.cores = 8, debugging = FALSE, reproducible = FALSE, ...)}
\arguments{
  \item{file.name}{character: name of the ncdf file to decompose.  The file has to be in the current working directory!}
  \item{process.type}{
}
  \item{M}{list of single integers: window length  or embedding dimension in time steps. If not
given,  a default value of 0.5*length(time series) is computed.                             }
  \item{dimensions}{
}
  \item{MSSA}{
}
  \item{MSSA.blocksize}{integer: size of the quadratical block used for MSSA.}
  \item{gaps.cv}{
}
  \item{MSSA.blck.trsh}{
}
  \item{amnt.artgaps}{
}
  \item{size.biggap}{
}
  \item{amnt.iters}{
}
  \item{amnt.iters.start}{
}
  \item{n.comp}{
}
  \item{pad.series}{
}
  \item{tresh.fill}{
}
  \item{tresh.fill.first}{single numeric value between 0 and 1 indicating a different treshold for the
run when no first guess values from previous runs are available. As this can be specified anyway
in the 'stepwise' sheme, supplying this value is only reasonable in the 'variances' sheme.}
  \item{max.steps}{
}
  \item{ratio.test}{
}
  \item{force.all.dims}{
}
  \item{var.name}{character string: name of the variable to fill. If set to 'auto' (default), the name
is taken from the file as the variable with a different name than the dimensions. An
error is produced here in cases where more than one such variable exists.}
  \item{ocean.mask}{logical matrix: contains TRUE for every ocean grid cell and FALSE for land cells. Ocean grid
cells will be set to missing after spatial SSA and will be excluded from temporal SSA.
The matrix needs to have dimensions identical in order and size to the spatial dimensions
in the ncdf file. As an alternative to a R matrix, the name of a ncdf file can be supplied.
It should only contain one non coordinate variable with 1 at ocean cells and 0 at land cells.}
  \item{process.cells}{
}
  \item{first.guess}{character string: if 'mean', standard SSA procedure is followed (using zero as
the first guess. Otherwise this is the file name of a ncdf file with the same dimensions
(with identical size!) as the file to fill which contains values used as a
first guess (for the first step of the process!). This name need to be exactly
"<filename>_first_guess_step_1.nc".}
  \item{tresh.const}{numeric: value below which abs(values) are assumed to be constant and excluded
from the decomposition}
  \item{ratio.const}{numeric: max ratio of the time series that is allowed to be above tresh.const for the time series
still to be not cosidered constant.}
  \item{keep.steps}{logical: whether to keep the files with the results from the single steps}
  \item{print.status}{logical: whether to print status information during the process}
  \item{calc.parallel}{logical: whether to use parallel computing. Needs packages doMC, foreach or doSMP (and
their dependencies) to be installed.}
  \item{package.parallel}{
}
  \item{max.cores}{integer: maximum number of cores to use.}
  \item{debugging}{
}
  \item{reproducible}{logical: Whether a seed based on the characters of the file name should be set
which forces all random steps, including the nutrlan SSA algorithm to be
exactly reproducible.}
  \item{\dots}{further settings to be passed to GapfillSSA}
}
\details{This is a wrapper function to automatically load, gapfill and save a ncdf file using SSA. It facilitates
parallel computing and uses the GapfillSSA() function from the package spectral.methods. Refer to
the documentation of GapfillSSA() for details of the calculations and the necessary parameters.


dimensions

It is generally possible to perform one or two dimensional SSA for gap filling. The GapfillSSA
algorithm automatically determines the right mode depending on whether a vector or a matrix is supplied.
In this function 'dimensions' is used to determine this. If only one dimension name is supplied, only
vectors in the direction of this dimension are extracted and filled. If two dimension names are supplied,
spatial grid/matrices along these dimension are extracted and SSA is computed two dimensionally.
The vectors/matrices are automatically distributed evenly amongst all cores (if calc.parallel==TRUE) amongst
the remaining dimensions in the ncdf file. The input ncdf file has to contain a maximum of 3 dimensions.


stepwise calculation

The algorithm can be run step wise with different settings for each step where the results from each
step can be used as 'first guesses' for the subsequent step. To do this, amnt.artgaps, size.biggap, amnt.iters,
n.comp, M, tresh.fill and dimensions have to be lists with their respective values for each step as their elements.
One example for such an application would be spatio-temporal gap filling, where spatial SSA is used first
and the results are then used as first guesses in the gap places for a subsequent temporal gap filling. For such
a procedure dimensions has to be: list(a=c('longitude','latitude'),'time')).


NCDF file specifications

Due to limitations in the file size the ncdf file can only contain one variable (and the dimensional
coordinate variables) (for the time beeing). This function will
create a second ncdf file identical to the input file but with an additional variable called 'flag.orig',
which contains zero for . In general the file is internally split into
individual time series or grids along ALL dimensions other than those specified in 'dimensions'.
These are individually filled and finally combined, transposed and saved in the new file.

The NCDF file may contain NaN values at grid locations where no data is available (e.g. ocean tiles).
These grid cells are excluded from the calculation prior to gap filling. To distinguish "valid" grid
cells from empty cells, values from all grid cells for the first time step are extracted and slices
with missing values are excluded from the analysis.

The function has only been tested with ncdf files with two spatial dimensions (e.g. lat and long) and
one time dimension. Even though it was programmed to be more flexible, its functionality can not
be guaranteed under circumstances with more dimensions.

Parallel computing

If calc.parallel==TRUE, single time series are filled with parallel computing. This requires
the package doSMP or doMP, respectively,  (and their dependencies) to be installed on the computer.
Parallelization with other packages is theoretically possible but not yet implemented. If
multiple cores are not available, setting calc.parallel to FALSE will cause the process to be
calculated sequential without these dependencies. The package foreach is needed in all cases.}
\value{Nothing is returned but a ncdf file with the results is written.
TODO extract iloop convergence information for all loops
TODO test inner loop convergence scheme for scenarios 
TODO indicate fraction of gaps for each time series
TODO break down world into blocks
TODO integrate onlytime into one dimensional variances scheme
TODO facilitate one step filling process with global RMSE calculation
TODO save convergence information in ncdf files
TODO check for too gappy series at single dimension setting
TODO create possibilty for non convergence and indicate this in results
TODO facilitate run without cross validation repetition
TODO test stuff with different dimension orders in the file and in settings
TODO substitute all length(processes)==2 tests with something more intuitive
TODO put understandable documentation to if clauses
TODO remove first guess stuff
TODO incorporate non convergence information in final datacube
TODO facilitate easy run of different settings (e.g. with different default settings)
TODO switch off "force.all.dims" in case of non neccessity
determine different iteration control parameters
ToDo remove
prepare parallel iteration parameters
determine call settings for SSA
get first guess
run calculation
TODO try to stop foreach loop at first error message!
test which dimension to be used for the next step
TODO whole step can be excluded for "one step" processes
determine first guess for next step
TODO: add break criterium to get out of h loop
check what happens if GapfillSSA stops further iterations due to limiting groups of eigentriples}

\author{Jannis v. Buttlar}



\seealso{\code{\link{ssa}}, \code{\link{GapfillSSA}}, \code{\link{DecomposeNcdf}}}
\examples{
#prerequesites: go to dir with ncdf file and specify file.name
setwd('')
file.name        = 'scen_3_0.5_small.nc'
max.cores        = 8
calc.parallel    = TRUE

#example settings for traditional one dimensional "onlytime" setting and
# one step
amnt.artgaps     <- list(list(c(0.05, 0.05)));
amnt.iters       <- list(list(c(3, 10)));
dimensions       <- list(list("time")); 
M                <- list(list(12)); 
n.comp           <- list(list(6)); 
size.biggap      <- list(list(5)); 
var.name         <- "auto"
process.type     <- "stepwise"
GapfillNcdf(file.name = file.name, dimensions = dimensions, amnt.iters = amnt.iters, 
            amnt.iters.start = amnt.iters.start, amnt.artgaps = amnt.artgaps, 
            size.biggap = size.biggap, n.comp = n.comp, tresh.fill = tresh.fill,
            M = M, process.type = process.type)



#example settings for 3 steps, stepwise and mono dimensional
dimensions       = list(list('time'), list('time'), list('time'))
amnt.iters       = list(list(c(1,5)), list(c(2,5)), list(c(3,5)))
amnt.iters.start = list(list(c(1,1)), list(c(2,1)), list(c(3,1)))
amnt.artgaps     = list(list(c(0,0)), list(c(0,0)), list(c(0,0)))
size.biggap      = list(list(0),      list(0),      list(0))
n.comp           = list(list(6),      list(6),      list(6))
tresh.fill       = list(list(.2),     list(.2),     list(.2))
M                = list(list(12),     list(12),     list(12))
process.type     = 'stepwise'
GapfillNcdf(file.name = file.name, dimensions = dimensions, amnt.iters = amnt.iters, 
            amnt.iters.start = amnt.iters.start, amnt.artgaps = amnt.artgaps, 
            size.biggap = size.biggap, n.comp = n.comp, tresh.fill = tresh.fill,
            M = M, process.type = process.type)

#example settings for 4 steps, stepwise and alternating between temporal and spatial
dimensions       = list(list('time'), list(c('longitude','latitude')), list('time'), list(c('longitude','latitude')))
amnt.iters       = list(list(c(1,5)), list(c(1,5)),                    list(c(2,5)), list(c(2,5)))
amnt.iters.start = list(list(c(1,1)), list(c(1,1)),                    list(c(2,1)), list(c(4,1)))
amnt.artgaps     = list(list(c(0,0)), list(c(0,0)),                    list(c(0,0)), list(c(0,0)))
size.biggap      = list(list(0),      list(0),                         list(0),      list(0))
n.comp           = list(list(15),     list(15),                        list(15),     list(15))
tresh.fill       = list(list(.2),     list(0),                         list(0),     list(0))
M                = list(list(23),     list(c(20,20)),                  list(23),     list(c(20,20)))
process.type     = 'stepwise'
GapfillNcdf(file.name = file.name, dimensions = dimensions, 
    amnt.iters = amnt.iters, amnt.iters.start = amnt.iters.start, 
    amnt.artgaps = amnt.artgaps, size.biggap = size.biggap, n.comp = n.comp, 
    tresh.fill = tresh.fill, M = M, process.type = process.type, max.cores = max.cores)

#example setting for process with alternating dimensions but variance criterium
dimensions       = list(list('time', c('longitude','latitude')))
n.comp           = list(list(5,      5))
M                = list(list(10,     c(10,10)))
amnt.artgaps     = list(list(c(0,0), c(0,0)))
size.biggap      = list(list(0,      0))
process.type     = 'variances'
tresh.fill       = list(list(0.1,    0.1))
max.steps        = 2
GapfillNcdf(file.name = file.name, dimensions = dimensions, n.comp = n.comp, 
            tresh.fill = tresh.fill, max.steps = max.steps, M = M, 
            process.type = process.type, amnt.artgaps = amnt.artgaps, 
            size.biggap = size.biggap, max.cores = max.cores)
}
