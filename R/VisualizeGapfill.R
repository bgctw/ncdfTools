VisualizeGapfill <- function(
  ##title<< visualize/plot an overview of a ncdf file
  file.orig                ##<< object to plot: file name or file.con object linking to a ncdf file
  , file.filled
  , data.orig = c()
  , data.filled =c()                          
  , n.series = 16
  , lwd = 2
  , max.cores = 16                            
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
  library(RColorBrewer)

  cat('\nPreparing stuff ...')
  if (parallel) {
    require(foreach)
    if (getDoParWorkers() < 2) {
      cl <- RegisterParallel('snow', min(c(GetCoreLimit(), max.cores)))
    }
  }
  con.orig <- open.nc(file.orig)
  con.filled <- open.nc(file.filled)
  var.filled <- ncdf.get.varname(file.filled)
  var.orig   <- ncdf.get.varname(file.orig)

  if (length(data.orig) == 0)
    data.orig <- var.get.nc(con.orig, var.orig)

  if (length(data.filled) == 0)
    data.filled <- var.get.nc(con.filled, var.filled)  

  dim.lat <- pmatch('lat', ncdf.get.diminfo(con.orig)[var.inq.nc(con.orig, var.orig)$dimids + 1, 'name'])
  dim.long <- pmatch('lon', ncdf.get.diminfo(con.orig)[var.inq.nc(con.orig, var.orig)$dimids + 1, 'name'])
  
  ## calculate datacube info
  cat('Doing calculations ...')
  
  cube.info.orig     <- parApply(cl, data.orig, c(dim.lat, dim.long), GetVecInfo)       
  cube.info.filled   <- parApply(cl, data.filled, c(dim.lat, dim.long), GetVecInfo)       
  
  dimnames(cube.info.orig)[[1]] <- c('min', 'max', 'mean', 'sdev', 'ratio na', 'ratio inf')
  dimnames(cube.info.filled)[[1]] <- c('min', 'max', 'mean', 'sdev', 'ratio na', 'ratio inf')

  cat('Doing plots ...')

    
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
pdf(file.diagnostics, width = 12, height= 16)
    layout(matrix(c(1:9, rep(10,3)),byrow=TRUE,ncol=3),
        height=c(1,1,1,1))
    par(tcl = 0.2, mgp = c(1, 0, 0), mar = c(2, 0, 0, 1), oma = c(0, 2, 4, 0))
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
        if (sum(!is.na(data.t)) > 0 ) {
          image.rotated(data.t,  xlab = '', col = col.palette(60),
                        zlim = range(pretty(data.t), scale = FALSE))
        #  if (i == 1) {
        #    y <-  latitudes[order(latitudes, decreasing=TRUE)][grids.valid[ind.rand[1:n.series], 1]]
        #    x <-  longitudes[grids.valid[ind.rand[1:n.series], 2]]
        #    points(x, y, cex = 4, pch = 17, col = cols[1:n.series])
        #    text(x, y, 1:n.series, pos = 3)
        #  }
      #    plot.new()
      #    color.legend(0, 0, 1, 1, rect.col = col.palette(20),
       #                legend = format(pretty(data.t, digits = 5), scientific = -1)
        #               , gradient = 'x', align = 'rb', cex = 0.7)
        } else {
         # plot.new()
          plot.new()
        }   
      } 
      mtext(outer = TRUE, line = 0, side = 3, text = sub('.data', '', pars.plot)
            , at = 1 / length(pars.plot) * (0:(length(pars.plot) - 1)) + 1 / (2 * length(pars.plot)))
    }
  dev.off()
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
  cat('Finished!\n')
  invisible(cube.info.agg)
}
##\code{\figure(visualize_ncdf_demo.png)}
