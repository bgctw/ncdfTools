VisualizeDatacube <- function(
  ##title<< visualize/plot an overview of a ncdf file
  data.object             ##<< object to plot: file name or file.con object linking to a ncdf file
  , forth.dim = 0        ##<< position in possible forth dimension (height, spectral band etc) to plot
  , var.name = 'auto'     ##<< character string: name of the variable to plot
  , parallel = FALSE
  , n.series = 16
  , lwd = 2
  , ...
)
##details<<
##\if{html}{\out{<img src="../doc/visualize_ncdf_demo.png" alt="image ..visualize_ncdf_demo should be here"/>}}\ifelse{latex}{}{}
{
  ##TODO facilitade datacube input
  ##TODO include plot.nlines capabilites
  require(ncdf.tools)
  require(RNetCDF)
  require(plotrix)
  require(jannis.misc)
  require(plyr)
  library(RColorBrewer)
  
  if (parallel) {
    require(doMC)
    RegisterParallel('doMC', min(c(GetCoreLimit(), 16)))
  }  
  if (class(data.object) == 'NetCDF') {
    file.con   = data.object
  } else {
    file.con   = open.nc(data.object)
  }
  
  if (var.name == 'auto')
    var.name <- ncdf.get.varinfo(file.con)$name[which.max(ncdf.get.varinfo(file.con)$n.dims)]
  
  lat.name   <- ncdf.get.diminfo(file.con)$name[pmatch('lat', ncdf.get.diminfo(file.con)$name)]
  long.name  <- ncdf.get.diminfo(file.con)$name[pmatch('lon', ncdf.get.diminfo(file.con)$name)]
  
  dim.long   <- match(long.name, ncdf.get.diminfo(file.con)$name)
  dim.lat    <- match(lat.name, ncdf.get.diminfo(file.con)$name)
  dim.time   <- match('time', ncdf.get.diminfo(file.con)$name)
  longitudes <- var.get.nc(file.con, long.name)
  latitudes  <- var.get.nc(file.con, lat.name)
  time       <- date.ncdf2R(file.con, 'time')
  dims.par   <- ncdf.get.diminfo(file.con)$name[var.inq.nc(file.con, var.name)$dimids + 1]
  
  ## sort dataframe
  aperm.data <- match(c('lat', 'lon', 'time'), dims.par)
  data       <- var.get.nc(file.con,var.name)
  if (length(forth.dim) > 1 || forth.dim != 0) {
    aperm.data <- c(aperm.data, 4)
    length.forth.dim <- dim(data)[4]
  } else {
    length.forth.dim <- 1
  }
  data.cube.unsort   <- aperm(data, aperm.data)
  if (length(forth.dim) > 1 || forth.dim != 0) {
    data.cube.sort   <- data.cube.unsort[order(latitudes, decreasing = TRUE), order(longitudes), ,]
  } else {
    data.cube.sort   <- data.cube.unsort[order(latitudes, decreasing = TRUE), order(longitudes),]
  }
  data.cube.sort     <- array(data.cube.sort, dim = c(dim(data.cube.sort)[1:3], length.forth.dim) ) 
  
  ## calculate datacube info
  cube.info          <- aaply(data.cube.sort, c(1,2,4), GetVecInfo, .parallel = parallel)
  if  (length(forth.dim) == 1 && forth.dim == 0)
    cube.info              <- array(cube.info, dim = c(dim(cube.info)[1:2], 1, dim(cube.info)[3]))
  dimnames(cube.info)[[4]] <- c('min', 'max', 'mean', 'sdev', 'ratio na', 'ratio inf')
  nas.series         <- apply(data.cube.sort, MAR = c(1,2,4),  function(x){sum(is.na(x)) / length(x)})
  
  cube.info.agg      <- data.frame(min = apply(cube.info[,,,'min'], 3, min, na.rm = TRUE),
                                   max = apply(cube.info[,,,'max'], 3, max, na.rm = TRUE),
                                   mean = apply(cube.info[,,,'mean'], 3, mean, na.rm = TRUE),
                                   ratio.na = apply(cube.info[,,,'ratio na'], 3, mean, na.rm = TRUE),
                                   series.empty = apply(nas.series, 3, function(x) sum(x == 1)) / prod(dim(data.cube.sort)[1:2]),
                                   series.full = apply(nas.series, 3, function(x) sum(x == 0)) / prod(dim(data.cube.sort)[1:2]), 
                                   series.gappy = apply(nas.series, 3, function(x) sum(x != 0 & x != 1)) / prod(dim(data.cube.sort)[1:2]))
  for (h in 1:length(forth.dim)) {
    forth.dim.t = forth.dim[h]
    if (forth.dim.t == 0)
      forth.dim.t <- 1
    
    grids.valid <- which(nas.series[, , forth.dim.t] < 1, arr.ind = TRUE)
    ind.rand      <- round(runif(16,1,dim(grids.valid)[1]),digits=0)
    ind.lat.orig  <- (1:length(latitudes))[order(latitudes,decreasing=TRUE)][grids.valid[ind.rand,1]]
    ind.long.orig <- (1:length(longitudes))[order(longitudes)][grids.valid[ind.rand,2]]
    ind.orig      <- matrix(NA, ncol = {if(is.na(forth.dim.t)){3}else{4}}, nrow = length(ind.rand))
    if (forth.dim.t == 0) {
      colnames(ind.orig) <- c('lat', 'long', 'time')
    } else {
      colnames(ind.orig) <- c('lat', 'long', 'time', 'forth.dim')
      ind.orig[,4]           <- forth.dim.t
    }      
    ind.orig[,'lat']  <- ind.lat.orig
    ind.orig[,'long'] <- ind.long.orig
    ind.orig[,'time']      <- '..'
    if (forth.dim.t != 0)
      ind.orig[,4]           <- forth.dim.t
    
    ## define color specs
    col.palette <- colorRampPalette(c('blue', 'yellow', 'red'))
    cols  <- rep(brewer.pal(ceiling(n.series/2), 'Set1'), times = 2)
    lty  <- rep(c(1), each = ceiling(n.series/2)*2)
    if (n.series > 8) {
      cols <- rep(cols, each = 2)
      lty  <- rep(c(1, 2), each = ceiling(n.series/2))
    }
    
    ## plot maps
    z.range     <- range(cube.info[, , forth.dim.t, ],na.rm = TRUE, finite = TRUE)
    if (length(forth.dim) > 1 & names(dev.cur()) == 'null device' )
      x11()        
    layout(matrix(c(2,4,6,8,10,12,1,3,5,7,9,11,13,13,13,13,13,13),byrow=TRUE,ncol=6),
        height=c(0.1,1,1))
    par(tcl = 0.2, mgp = c(1, 0, 0), mar = c(2, 0, 0, 1), oma = c(0, 2, 4, 0))
    pars.plot = c('min.data', 'max.data', 'mean.data', 'sdev.data', 'na.data', 'inf.data')
    for (i in 1:length(pars.plot)) {
      if (sum(!is.na(cube.info[, , forth.dim.t, i])) > 0 ) {
        image.rotated(cube.info[, , forth.dim.t, i], row.vals = sort(latitudes, decreasing = TRUE),
            col.vals = longitudes, xlab = '', col = col.palette(60),
            zlim = range(pretty(cube.info[, , forth.dim.t, i])), scale = FALSE)
        if (i == 1) {
          y <-  latitudes[order(latitudes, decreasing=TRUE)][grids.valid[ind.rand[1:n.series], 1]]
          x <-  longitudes[grids.valid[ind.rand[1:n.series], 2]]
          points(x, y, cex = 4, pch = 17, col = cols[1:n.series])
          text(x, y, 1:n.series, pos = 3)
        }
        plot.new()
        color.legend(0, 0, 1, 1, rect.col = col.palette(20),
            legend = pretty(cube.info[, , forth.dim.t, i])
            , gradient = 'x', align = 'rb', cex = 0.7)
      } else {
        plot.new()
        plot.new()
      }   
    } 
    mtext(outer = TRUE, line = 0, side = 3, text = sub('.data', '', pars.plot)
        , at = 1 / length(pars.plot) * (0:(length(pars.plot) - 1)) + 1 / (2 * length(pars.plot)))
    mtext(outer = TRUE, side = 3, line = 1, cex = 3, text = paste('dim ', forth.dim.t))
    
    ## plot example series
    ind.series <-  array(FALSE, dim = dim(data.cube.sort)[1:2])
    ind.series[as.matrix(data.frame(a = grids.valid[ind.rand[1:n.series],1], b = grids.valid[ind.rand[1:n.series],2]))]=TRUE
    plot.bg(rgb(0.9,0.9,0.9))
    data.cube.t <- data.cube.sort[,,,forth.dim.t]
    if (cube.info.agg[forth.dim.t, 'series.empty'] != 1) {
      ydata = t(array(data.cube.t[ind.datacube(data.cube.t, ind.series, c(1,2))], dim = c(length(time), n.series)))
      plot.nlines(x.data = 1:length(time), y.data = ydata, option = 'stacked', col = cols[1:n.series], scale = 0.35, ...)
      legend('topright', legend = paste(1:n.series, apply(ind.orig[1:n.series, ], MAR = 1, paste, collapse = ','), sep = ': '),
          col = cols[1:n.series], lty = lty[1:n.series], lwd = 2, bg = 'white', cex = par()$cex*2, ...)
    }
  }
  if (!(class(data.object)=='NetCDF'))
    close.nc(file.con)
  invisible(cube.info.agg)
}
##\code{\figure(visualize_ncdf_demo.png)}
