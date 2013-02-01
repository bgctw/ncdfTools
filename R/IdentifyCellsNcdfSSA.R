IdentifyCellsNcdfSSA = function(
##title<< helper function for Ncdf SSA algorithms 
    dims.cycle.id, dims.process.id, datacube, ratio.const, tresh.const , print.status, slices.n, algorithm, 
    g = c() ,process.cells = c('gappy','all')[1], dims.cycle = c(), 
    args.call.SSA = list(), tresh.fill.dc = 0, ratio.test.t =1, first.guess = 'mean', 
    ocean.mask = c(), dims.process = c(), dims.process.length = 0, 
    slices.without.gaps = rep(FALSE, slices.n), slices.too.gappy = rep(FALSE, slices.n),
    slices.constant = rep(FALSE, slices.n), slices.process = rep(TRUE, slices.n),
    slices.ocean = rep(FALSE, slices.n), values.constant = integer(length = slices.n),
    slices.excluded = rep(FALSE, slices.n), MSSA = FALSE)   
##details<< helper function for GapfillNcdf and DecomposeNcdf that identifies the grid cells to process. 
##seealso<<
##\code{\link{GapfillNcdf}}, \code{\link{GapfillNcdf}}    
{
  ##FIXME
  # possibility to identify gap less MSSA blocks
  
  if (print.status)
    cat(paste(Sys.time(), ' : Identifying valid cells ...\n', sep=''))
  
  ## get amount of missing values
  if (algorithm == 'Decompose') {
    add.id = 1  
  } else {
    add.id = 0
  }  
  getMissingRatio = function(x) {
    sum(is.na(x)) / prod(dim(datacube)[dims.process.id + add.id])
  } 
  amnt.na  <- apply(datacube, MAR = dims.cycle.id + add.id , getMissingRatio)
  

  ## slices checks specific to decomposition
  if (algorithm == 'Decompose') {
    slices.empty                <- as.vector(amnt.na == 1)
    slices.process              <- as.vector(amnt.na == 0)
    slices.gappy                <- !slices.empty & !process
    if (sum(slices.gappy) > 0)
      cat(paste(Sys.time(), ' : ', sum(slices.gappy),' series with gaps were found. ',
                            'Spectral decomp. for these is not possible!\n',sep=''))
 
    ## slices checks specific to gap filling 
  } else if (algorithm == 'Gapfill') {
    if (!MSSA) {
      if (g == 1) {
        
        ## modifications in case of given ocean mask
        if ((length(ocean.mask) > 0 ) & (sum(!is.na(match(c('longitude','latitude'), 
                          dims.process))) == 2)) {
          amnt.na <- 1- apply(datacube, MAR = dims.cycle.id + 1 ,
              function(x) sum(!is.na(x[as.vector(!ocean.mask)])) / sum(!ocean.mask)   )
        }
        if (length(ocean.mask) > 0 & sum(!is.na(match(c('longitude','latitude'), 
                    dims.cycle))) == 2) 
          slices.ocean           <- as.vector(ocean.mask)
        
        ## exclude non gappy slices
        if (process.cells == 'gappy') 
          slices.without.gaps       <- as.vector((amnt.na == 0))
      
        
        ## exclude too gappy slices
        gaps     <- args.call.SSA$amnt.artgaps
        size.bg  <- args.call.SSA$size.biggap^(length(dims.process.length))
        dtpts    <- prod(dims.process.length)
        if (sum(gaps != 0) > 0) {
          n_biggaps   <- max(c(floor(dtpts * gaps[1] /size.bg), 1))  
          if (gaps[1] > 0) {
            n_smallgaps <- n_biggaps * size.bg * gaps[1] / gaps[2]
          } else {
            n_smallgaps <- dtpts * gaps[2]
          }
          treshhld.gappy <- 1 - ((n_smallgaps + n_biggaps * size.bg) / dtpts ) - tresh.fill.dc
        } else {
          treshhld.gappy <- 1 - (tresh.fill.dc)
        }
        slices.too.gappy <- as.vector(amnt.na >= treshhld.gappy)
        
        ## modify this in case first guess is supplied
        if ((length(first.guess) > 1) & tresh.fill.dc == 0) {
          amnt.na.first.guess    <- apply(first.guess, MAR = dims.cycle.id + 1,
              function(x)sum(is.na(x)) / dtpts  )
          if ((length(ocean.mask) > 0 ) & (sum(!is.na(match(c('longitude','latitude'), dims.process))) == 2))
            amnt.na.first.guess  <- 1- apply(first.guess, MAR = dims.cycle.id + 1 ,
                function(x) sum(!is.na(x[as.vector(!ocean.mask)])) / sum(!ocean.mask)   )
          slices.too.gappy[amnt.na.first.guess < 0.9 & amnt.na < 0.75] <- FALSE
        }      
        slices.too.gappy[slices.ocean] <- FALSE             
      } else if (g != 1) {
        slices.process <- slices.excluded
        iters.n <- sum(slices.process)
        return(list(iters.n = iters.n, slices.process = slices.process, 
                values.constant = values.constant, slices.constant = slices.constant, 
                slices.without.gaps = slices.without.gaps, 
                slices.excluded = slices.excluded,
                slices.too.gappy = slices.too.gappy)) 
      }
    } else if (MSSA) {
      if (length(ocean.mask) > 0) {
        slices.ocean                 <- as.vector(ocean.mask)
        slices.process[slices.ocean] <- FALSE
        iters.n <- sum(slices.process)
        return(list(iters.n = iters.n, slices.process = slices.process, 
                    values.constant = values.constant, slices.constant = slices.constant, 
                    slices.without.gaps = slices.without.gaps, 
                    slices.excluded = slices.excluded,
                    slices.too.gappy = slices.too.gappy)) 
      }
    }   
  }
  
  # identify constant slices
  isSeriesConstant <- function(x) {
    if (sum(is.na(x)) == length(x)) {
      return(FALSE)
    } else {
      min.amount <-  (1 - ratio.const)*length(x[!is.na(x)])
      tresh.max  <-  abs(median(x, na.rm = TRUE)) + tresh.const
      return(sum(abs(x) <  tresh.max, na.rm = TRUE) >= min.amount)
    }
  }
  slices.constant    <- apply(data.all, MAR = dims.cycle.id, isSeriesConstant)
  slices.constant[slices.gappy | slices.empty] <- FALSE
  values.constant    <-  as.vector(apply(datacube, MAR = dims.cycle.id + 1,
                                         median, na.rm = TRUE))
  slices.constant[slices.without.gaps & slices.ocean & slices.too.gappy] <- FALSE      
  if (sum(slices.constant) > 0)
    cat(paste(Sys.time(), ' : ', sum(slices.constant),' constant slices were found.',
            ' SSA on these for these is ommited!\n', sep=''))
                                         
  ## get slices to process                                       
  slices.process             <- !slices.constant & !slices.ocean & 
                                !slices.too.gappy & !slices.without.gaps
  
  if (algorithm == 'Gapfill'){
    ##extract only a ratio of the slices to calculate for variance testing
    if (ratio.test.t != 1) {
      slices.excluded            <- logical(slices.n) 
      slices.test.n      <- ceiling(sum(slices.process) * ratio.test.t)
      ind.slices.process <- sample(which(slices.process), slices.test.n)
      slices.excluded[setdiff(which(slices.process), ind.slices.process)] <- TRUE
      slices.process[-ind.slices.process] <- FALSE
    }
    
    ##add slices usually not filled in case no validation data is available later
    if (sum(slices.process) > 0 && mean(amnt.na[slices.process]) > 0.8) {
      ind.added   <- order(amnt.na, rnorm(length(amnt.na)))[sum(slices.process)]
      slices.process[ind.added]      <- TRUE
      slices.without.gaps[ind.added] <- FALSE
    }
  }
  
  #return stuff
  if (sum(slices.process) == 0)
    stop(paste('No series/slices available for filling. Most probably only',
            ' totally gappy and totally gap-free slices/series exist.', sep=''))
  iters.n <- sum(slices.process)
  return(list(iters.n = iters.n, slices.process = slices.process, 
              values.constant = values.constant, slices.constant = slices.constant, 
              slices.without.gaps = slices.without.gaps, 
              slices.excluded = slices.excluded,
              slices.too.gappy = slices.too.gappy))
}




