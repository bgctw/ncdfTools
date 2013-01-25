\name{GapfillNcdfDatacube}
\alias{GapfillNcdfDatacube}
\title{helper function for GapfillNcdf}
\description{###############################   gapfill data cube #########################}
\usage{GapfillNcdfDatacube(tresh.fill.dc = 0.1, ocean.mask = c(), max.cores = 8, 
    args.call.SSA = list(), iters.n, print.status, datapts.n, 
    dims.info, calc.parallel = TRUE, debugging, h, l, MSSA, MSSA.blocksize, 
    first.guess = "mean", dims.cycle, datacube, dims.cycle.id, 
    dims.process.id, dims.process, process.cells = c("gappy", 
        "all")[1], ratio.test.t, g, slices.process = c(), slices.constant = c(), 
    values.constant = c(), slices.excluded = c(), slices.without.gaps = c(), 
    MSSA.blck.trsh = MSSA.blck.trsh, file.name, ratio.const = ratio.const, 
    tresh.const = tresh.const)}
\arguments{
  \item{tresh.fill.dc}{
}
  \item{ocean.mask}{
}
  \item{max.cores}{
}
  \item{args.call.SSA}{
}
  \item{iters.n}{
}
  \item{print.status}{
}
  \item{datapts.n}{
}
  \item{dims.info}{
}
  \item{calc.parallel}{
}
  \item{debugging}{
}
  \item{h}{
}
  \item{l}{
}
  \item{MSSA}{
}
  \item{MSSA.blocksize}{
}
  \item{first.guess}{
}
  \item{dims.cycle}{
}
  \item{datacube}{
}
  \item{dims.cycle.id}{
}
  \item{dims.process.id}{
}
  \item{dims.process}{
}
  \item{process.cells}{
}
  \item{ratio.test.t}{
}
  \item{g}{
}
  \item{slices.process}{
}
  \item{slices.constant}{
}
  \item{values.constant}{
}
  \item{slices.excluded}{
}
  \item{slices.without.gaps}{
}
  \item{MSSA.blck.trsh}{
}
  \item{file.name}{
}
  \item{ratio.const}{
}
  \item{tresh.const}{
}
}
\details{helper function for GapfillNcdf that handles the main datacube transformations. }


\author{Jannis v. Buttlar}



\seealso{\code{\link{GapfillNcdf}}    }

