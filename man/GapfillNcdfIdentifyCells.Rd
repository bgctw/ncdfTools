\name{GapfillNcdfIdentifyCells}
\alias{GapfillNcdfIdentifyCells}
\title{helper function for GapfillNcdf}

\usage{GapfillNcdfIdentifyCells(dims.cycle, dims.cycle.id, dims.process.id, 
    datacube, MSSA, dims.process, process.cells = c("gappy", 
        "all")[1], first.guess = "mean", ocean.mask = c(), print.status, 
    slices.n, dims.process.length, tresh.fill.dc, ratio.test.t, 
    g, slices.without.gaps = rep(FALSE, slices.n), h, l, slices.too.gappy = rep(FALSE, 
        slices.n), slices.constant = rep(FALSE, slices.n), slices.process = rep(TRUE, 
        slices.n), slices.ocean = rep(FALSE, slices.n), values.constant = integer(length = slices.n), 
    slices.excluded = rep(FALSE, slices.n), ratio.const, tresh.const, 
    args.call.SSA)}
\arguments{
  \item{dims.cycle}{
}
  \item{dims.cycle.id}{
}
  \item{dims.process.id}{
}
  \item{datacube}{
}
  \item{MSSA}{
}
  \item{dims.process}{
}
  \item{process.cells}{
}
  \item{first.guess}{
}
  \item{ocean.mask}{
}
  \item{print.status}{
}
  \item{slices.n}{
}
  \item{dims.process.length}{
}
  \item{tresh.fill.dc}{
}
  \item{ratio.test.t}{
}
  \item{g}{
}
  \item{slices.without.gaps}{
}
  \item{h}{
}
  \item{l}{
}
  \item{slices.too.gappy}{
}
  \item{slices.constant}{
}
  \item{slices.process}{
}
  \item{slices.ocean}{
}
  \item{values.constant}{
}
  \item{slices.excluded}{
}
  \item{ratio.const}{
}
  \item{tresh.const}{
}
  \item{args.call.SSA}{
}
}
\details{helper function for GapfillNcdf that identifies the grid cells to process. }


\author{Jannis v. Buttlar}



\seealso{\code{\link{GapfillNcdf}}       }

