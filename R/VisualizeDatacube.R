VisualizeDatacube = function(
  ##title<< visualize/plot an overview of a ncdf file
  data.object             ##<< object to plot: file name or file.con object linking to a ncdf file
  , forth.dim = NA        ##<< position in possible forth dimension (height, spectral band etc) to plot
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
    if (class(data.object)=='NetCDF') {
        file.con=data.object
    } else {
        file.con   = open.nc(data.object)
    }

    if (var.name == 'auto')
      var.name <- ncdf.get.varinfo(file.con)$name[which.max(ncdf.get.varinfo(file.con)$n.dims)]

    lat.name  <- ncdf.get.diminfo(file.con)$name[pmatch('lat',ncdf.get.diminfo(file.con)$name)]
    long.name <- ncdf.get.diminfo(file.con)$name[pmatch('lon',ncdf.get.diminfo(file.con)$name)]
    
    data      <- var.get.nc(file.con,var.name)
    dim.long  <- match(long.name, ncdf.get.diminfo(file.con)$name)
    dim.lat   <- match(lat.name, ncdf.get.diminfo(file.con)$name)
    dim.time  <- match('time',ncdf.get.diminfo(file.con)$name)
    longitudes<- var.get.nc(file.con, long.name)
    latitudes <- var.get.nc(file.con, lat.name)
    time      <- var.get.nc(file.con,'time')

    dims.par  <- ncdf.get.diminfo(file.con)$name[var.inq.nc(file.con, var.name)$dimids + 1]
    aperm.data<- match(c('lat', 'lon', 'time'), dims.par)

    if (!is.na(forth.dim)) {
        data.cube.unsort <- aperm(data[,,,forth.dim], aperm.data)
    } else {
        data.cube.unsort <- aperm(data[,,], aperm.data)
    }
    data.cube.sort       <- data.cube.unsort[order(latitudes, decreasing = TRUE), order(longitudes), ]

    cube.info            <- aaply(data.cube.sort, c(1,2), GetVecInfo, .parallel = TRUE)
    dimnames(cube.info)[[3]] <- c('min', 'max', 'mean', 'sdev', 'ratio na', 'ratio inf')

    grids.valid <- which(apply(data.cube.sort,MAR=c(1,2),
                         function(x)sum(!is.na(x))>20),arr.ind=TRUE)
    ind.rand      <- round(runif(16,1,dim(grids.valid)[1]),digits=0)
    ind.lat.orig  <- (1:length(latitudes))[order(latitudes,decreasing=TRUE)][grids.valid[ind.rand,1]]
    ind.long.orig <- (1:length(longitudes))[order(longitudes)][grids.valid[ind.rand,2]]
    ind.orig      <- matrix(NA, ncol = {if(is.na(forth.dim)){3}else{4}}, nrow = length(ind.rand))
    if (is.na(forth.dim)) {
      colnames(ind.orig) <- c('lat', 'long', 'time')
    } else {
      colnames(ind.orig) <- c('lat', 'long', 'time', 'forth.dim')
      ind.orig[,4]           <- forth.dim
    }      
    ind.orig[,'lat']  <- ind.lat.orig
    ind.orig[,'long'] <- ind.long.orig
    ind.orig[,'time']      <- '..'
    if (!is.na(forth.dim))
        ind.orig[,4]           <- forth.dim
    
    #define color specs
    col.palette <- colorRampPalette(c('blue', 'yellow', 'red'))
    cols  <- brewer.pal(ceiling(n.series/2)*2, 'Set1')
    lty  <- rep(c(1), each = ceiling(n.series/2)*2)
    if (n.series > 8) {
      cols <- rep(cols, each = 2)
      lty  <- rep(c(1, 2), each = ceiling(n.series/2))
    }

    #plot maps
    z.range     <- range(cube.info[,,1:3],na.rm = TRUE, finite = TRUE)
    layout(matrix(c(2,4,6,8,10,12,1,3,5,7,9,11,13,13,13,13,13,13),byrow=TRUE,ncol=6),
            height=c(0.1,1,1))
    par(tcl = 0.2, mgp = c(1, 0, 0), mar = c(2, 0, 0, 1), oma = c(0, 2, 2, 0))
    pars.plot = c('min.data', 'max.data', 'mean.data', 'sdev.data', 'na.data', 'inf.data')
    for (i in 1:length(pars.plot)) {
      image.rotated(cube.info[, , i], row.vals = sort(latitudes, decreasing = TRUE),
                    col.vals = longitudes, xlab = '', col = col.palette(60),
                    zlim = range(pretty(cube.info[, , i])), scale = FALSE)
      if (i == 1) {
        y <-  latitudes[order(latitudes, decreasing=TRUE)][grids.valid[ind.rand[1:n.series], 1]]
        x <-  longitudes[grids.valid[ind.rand[1:n.series], 2]]
        points(x, y, cex = 2, pch = 17, col = cols[1:n.series])
        text(x, y, 1:n.series, pos = 3)
      }
      plot.new()
      color.legend(0, 0, 1, 1, rect.col = col.palette(20),
                   legend = pretty(cube.info[, , i])
                   , gradient = 'x', align = 'rb', cex = 0.7)
    }
    mtext(outer = TRUE, line = 0, side = 3, text = sub('.data', '', pars.plot)
          , at = 1 / length(pars.plot) * (0:(length(pars.plot) - 1)) + 1 / (2 * length(pars.plot)))
    
    #plot example series
    y.range<- range(data.cube.sort[grids.valid[ind.rand,1],grids.valid[ind.rand,2],],na.rm=TRUE)
    plot.bg(rgb(0.9,0.9,0.9))
    plot(1, 1, xlim = range(time), type = 'n', ylim = y.range, ...)    
   
    for (i in 1:n.series)
      points(time, data.cube.sort[grids.valid[ind.rand[i], 1], grids.valid[ind.rand[i], 2], ]
             , type = 'l', col = cols[i], lty = lty[i], lwd = lwd, ...)
    legend('topright', legend = paste(1:n.series, apply(ind.orig[1:n.series, ], MAR = 1, paste, collapse = ','), sep = ': '),
           col = cols[1:n.series], lty = lty[1:n.series], lwd = 2, bg = 'white', cex = par()$cex*2, ...)
    
    if (!(class(data.object)=='NetCDF'))
        close.nc(file.con)
}
##\code{\figure(visualize_ncdf_demo.png)}
