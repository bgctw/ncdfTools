VisualizeGapfill <- function(
  ##title<< visualize/plot an overview of a ncdf file
  file.orig                ##<< object to plot: file name or file.con object linking to a ncdf file
  , file.filled
  , data.orig = c()
  , data.filled =c()                          
  , n.series = 16
  , lwd = 2
  , max.cores = 36                           
  , ...
)
##details<<
##\if{html}{\out{<img src="../doc/visualize_ncdf_demo.png" alt="image ..visualize_ncdf_demo should be here"/>}}\ifelse{latex}{}{}
{
  ##TODO facilitade datacube input
  ##TODO include plot.nlines capabilites
  require(ncdf.tools, warn.conflicts = FALSE, quietly = TRUE)
  require(RNetCDF, warn.conflicts = FALSE, quietly = TRUE)
  require(plotrix, warn.conflicts = FALSE, quietly = TRUE)
  require(jannis.misc, warn.conflicts = FALSE, quietly = TRUE)
  library(RColorBrewer, warn.conflicts = FALSE, quietly = TRUE)
  require(DistributionUtils, warn.conflicts = FALSE, quietly = TRUE)
  require(snow, warn.conflicts = FALSE, quietly = TRUE)

  ## preparation
  RegisterParallel('snow', min(c(GetCoreLimit(), max.cores)))    
  con.orig   <- open.nc(file.orig)
  con.filled <- open.nc(file.filled)
  var.filled <- ncdf.get.varname(file.filled)
  var.orig   <- ncdf.get.varname(file.orig)

  ## load data
  if (length(data.orig) == 0) {
    status.report('Loading original data ...')
    data.orig <- var.get.nc(con.orig, var.orig)
  }
  if (length(data.filled) == 0) {
    status.report('Loading gapfilled data ...')    
    data.filled <- var.get.nc(con.filled, var.filled)  
  }
  dim.lat <- pmatch('lat', ncdf.get.diminfo(con.orig)[var.inq.nc(con.orig, var.orig)$dimids + 1, 'name'])
  dim.long <- pmatch('lon', ncdf.get.diminfo(con.orig)[var.inq.nc(con.orig, var.orig)$dimids + 1, 'name'])
  
  ## calculate datacube info
  status.report('Doing calculations ...')
  cube.info.orig     <- parApply(cl, data.orig, c(dim.lat, dim.long), GetVecInfo)       
  cube.info.filled   <- parApply(cl, data.filled, c(dim.lat, dim.long), GetVecInfo)
  stopCluster(cl)
  dimnames(cube.info.orig)[[1]] <- c('min', 'max', 'mean', 'sdev', 'ratio na', 'ratio inf')
  dimnames(cube.info.filled)[[1]] <- c('min', 'max', 'mean', 'sdev', 'ratio na', 'ratio inf')
  cube.info.agg       <- array(NA, dim=c(2, 7))
  dimnames(cube.info.agg) <- list(c('orig', 'filled'), c('min', 'max', 'mean', 'sd', 'ratio_full', 'ratio_empty', 'ratio_partial'))
  for (dataset in c('orig', 'filled')) {
    for (measure in c('min', 'max')) 
      cube.info.agg[dataset, measure] <- do.call(measure, list(get(paste('cube.info.', dataset, sep = ''))[measure, ,], na.rm = TRUE))
    for (measure in c('mean', 'sd')) 
      cube.info.agg[dataset, measure] <- do.call(measure, list(get(paste('data.', dataset, sep = '')), na.rm = TRUE))
    cube.info.agg[dataset, 'ratio_empty'] <- sum(get(paste('cube.info.', dataset, sep = ''))['ratio na', , ]==1) / prod(dim(get(paste('cube.info.', dataset, sep = ''))['ratio na', , ]))
    cube.info.agg[dataset, 'ratio_full']  <- sum(get(paste('cube.info.', dataset, sep = ''))['ratio na', , ]==0) / prod(dim(get(paste('cube.info.', dataset, sep = ''))['ratio na', , ]))
    cube.info.agg[dataset, 'ratio_partial']  <- sum(get(paste('cube.info.', dataset, sep = ''))['ratio na', , ]>0 & get(paste('cube.info.', dataset, sep = ''))['ratio na', , ]<1)/prod(dim(get(paste('cube.info.', dataset, sep = ''))['ratio na', , ]))    
  }

  ## do plots
  status.report('Doing plots ...')
  grids.valid <- which(cube.info.orig['ratio na', , ] < 1, arr.ind = TRUE)
  ind.rand      <- round(runif(16, 1, dim(grids.valid)[1]), digits = 0)
  ind.lat.orig  <- grids.valid[ind.rand, 1]
  ind.long.orig <- grids.valid[ind.rand, 2]
  ind.orig      <- matrix(NA, ncol = 3, nrow = length(ind.rand))
  colnames(ind.orig) <- c('lat', 'long', 'time')
  
  ind.orig[,'lat']  <- ind.lat.orig
  ind.orig[,'long'] <- ind.long.orig
  ind.orig[,'time']      <- '..'
  
  
  ## define color specs
  col.palette <- colorRampPalette(c('blue', 'yellow', 'red'))
  cols  <- rep(brewer.pal(ceiling(n.series/2), 'Set1'), times = 2)
  lty  <- rep(c(1), each = ceiling(n.series/2)*2)
  if (n.series > 8) {
    cols <- rep(cols, each = 2)
    lty  <- rep(c(1, 2), each = ceiling(n.series/2))
  }
  
  ## plot maps
  layout(matrix(c(1:9),byrow=TRUE,ncol=3),
         height=c(1,1,1,1))
  par(tcl = 0.2, mgp = c(1, 0, 0), mar = c(2, 0, 0, 2), oma = c(0, 2, 4, 0))
  pars.plot =  c('ratio na', 'min', 'max')
  for (i in 1:length(pars.plot)) {
    par.t = pars.plot[i]
    for (j in 1:3){
      if (j == 1) {
        data.t = cube.info.orig[par.t, , ]
      } else if (j == 2) {
        data.t = cube.info.filled[par.t, , ]
      } else if (j == 3) {
        data.t = cube.info.orig[par.t, , ] - cube.info.filled[par.t, , ]
      }
      if (j == 1)
        zlim <- range(c(cube.info.orig[par.t, , ], cube.info.filled[par.t, , ]), na.rm = TRUE)
      if (j == 3)
        zlim <- RangeZeroEqui(range(data.t, na.rm = TRUE))
      if (sum(!is.na(data.t)) > 0 ) {
        image.rotated(data.t,  xlab = '', xaxt = 'n', yaxt = 'n', col = col.palette(60),
                      zlim = range(pretty(zlim), scale = FALSE), useRaster = TRUE)
      } else {
        plot.new()
      }   
    }
  }
  LabelMargins(c(rev(pars.plot)), las = 3, side = 2, outer = TRUE, cex= 2, line = .2)
  LabelMargins(c('orig', 'filled', 'orig - filled'), side = 3, outer = TRUE, cex = 2, line =0.5)

  layout(matrix(c(1:2),byrow=TRUE,ncol=1),
         height=c(1,1))
  par(tcl = 0.2, mgp = c(1, 0, 0), mar = c(2, 0, 0, 2), oma = c(0, 2, 4, 0))
  breaks = seq(min(cube.info.filled['min', , ], na.rm = TRUE),
    max(cube.info.filled['max', , ], na.rm = TRUE), length.out = 500)
  hst.orig    <- hist(data.orig, breaks = breaks, plot = FALSE)
  hst.filled  <- hist(data.filled, breaks = breaks, plot = FALSE)
  plot.bg(rgb(.5,.5,.5))
  plot(hst.filled, xlim = range(c(hst.orig$mids, hst.filled$mids)),
       ylim = c(0, max( range(c(hst.orig$counts, hst.filled$counts)))),
       col = 'red', xlab = '', main = 'data')
  par(new=TRUE)  
  plot(hst.orig, xlim = range(c(hst.orig$mids, hst.filled$mids)),
       ylim = c(0, max( range(c(hst.orig$counts, hst.filled$counts)))), xlab = '',
       main = '', col = 'black')
  box()
  text(trnsf.coords(c(0.8,0.9),c(0.9, 0.9)), labels =  c('filled', 'orig'),
       col = c('red', 'black'), cex = 2)


  hst.filled  <- logHist(cube.info.filled['ratio na',,], breaks =100, col = 'red',
                         pch = 16, xlab = '', main = '')
  par(new = TRUE)
  logHist(cube.info.orig['ratio na',,], breaks =100, ylim = hst.filled$ylim,
          cex = 1.1, xlab = 'ratio of missing values per grid point', main = '')
  text(trnsf.coords(c(0.7,0.9),c(0.9, 0.9)), labels =  c('filled', 'orig'),
       col = c('red', 'black'), cex = 2)



  ratios.take <- seq(0, min(cube.info.filled['ratio na', , ][cube.info.filled['ratio na', , ] != 0], na.rm = TRUE), length.out = n.series)
  ind.closest <- which.closest(ratios.take, cube.info.orig['ratio na', , ], arr.ind = TRUE)
  
  
  ## plot example series
  layout(matrix(1:n.series, n.series, 1))
  par(tcl = 0.2, mgp = c(1, 0, 0), mar = c(0, 0, 0, 0), oma = c(2, 2, 2, 2))
  args.extract =  c(list(data.filled), list(TRUE, TRUE, TRUE))
  args.orig    =  c(list(data.orig), list(TRUE, TRUE, TRUE))
  for (i in 1:n.series) {
    plot.bg(rgb(0.9,0.9,0.9))
    args.extract[[dim.lat + 1]] <- ind.closest[i,1]
    args.extract[[dim.long + 1]] <- ind.closest[i,2]
    args.orig[[dim.lat + 1]] <- ind.closest[i,1]
    args.orig[[dim.long + 1]] <- ind.closest[i,2]
    y.data       <- do.call('[',args.extract)
    y.data.orig  <- do.call('[',args.orig)
    if (sum(!is.na(y.data)) > 0 ) {
      plot(y.data, type = 'l', col = 'red', lwd = 2)
      points(y.data.orig, type = 'l', col = 'black', lwd = 2)
    } else {
      plot.new()      
    }
  }
  text(trnsf.coords(c(0.8,0.9),c(0.4, 0.4)), labels =  c('filled', 'orig'),
       col = c('red', 'black'), cex = 2)
  invisible(cube.info.agg)
}
##\code{\figure(visualize_ncdf_demo.png)}
