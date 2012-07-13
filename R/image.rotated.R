image.rotated = function(
        data          ##<< matrix: data to be plotted
        ,col.vals = c() ##<< numeric vector: coordinate values for the columns of data
        ,row.vals = c() ##<< numeric vector: coordinate values for the rows of data
        ,scale = TRUE
        ,col = heat.colors(20)
        ,zlim = range(data, na.rm=TRUE)
        ,...          ##<< further arguments passed to image
)
##title<< plot rotated image plot
##description<< plot a raster/matrix using image() but supplying a rotated version of the matrix
##details<< The normal image() function always plots a rotated version of a matrix. This function 
##          rotates the input to image in a way that the first entry of the matrix (col=1,row=1)
##          shows up at the top-left corner of the plot. In other words the way a matrix would be 
##          displayed by printing it is directly mapped to the plot.
##seealso<<
##\code{\link{image}}, the plotting routines of the raster package
{
    oopts <- options(warn = -1)
    add.args = list(...)
    if (length(col.vals) == 0) { 
      col.strings <- colnames(data)
      col.vals    <- 1:dim(data)[2]
    } else {
      col.strings <- col.vals
    }  
    
    if(sum(is.na(as.numeric(col.strings))) == 0) {
      col.strings.pretty   <- pretty(as.numeric(col.strings))
      a = lm(y~x, data = data.frame(x = range(as.numeric(col.strings)),y = range(col.vals)))
      col.vals.axis <- coefficients(a)[1] +  coefficients(a)[2]*col.strings.pretty 
    } else {
      col.vals.axis <- 1:length(row.strings)
        col.strings.pretty <- col.strings
    }
    
    if (length(row.vals) == 0) {
      row.strings <- rev(rownames(data))
      row.vals    <- 1:dim(data)[1]
    } else {
      row.strings <- rev(row.vals)
    }
    
    if(sum(is.na(as.numeric(row.strings)))==0) {
      row.strings.pretty   <- pretty(as.numeric(row.strings))
      a = lm(y~x, data=data.frame(x=range(as.numeric(row.strings)), y=range(row.vals)))
      row.vals.axis <- coefficients(a)[1] +  coefficients(a)[2]*row.strings.pretty 
    } else {
      row.vals.axis <- 1:length(row.strings)
      row.strings.pretty <- row.strings         
    }
  
    options(oopts)
    data=t(data)[,dim(data)[1]:1]
    if (scale) {
      old.mar <- par()$mar
      par(mar=par()$mar + c(0,0,0,2))
    }  
    
    image(x = sort(col.vals), y = sort(row.vals), z = data, xaxt = 'n', yaxt = 'n', col = col, zlim = zlim ,...)
    
    if (is.null(add.args$xaxt) || add.args$xaxt != 'n')       
       axis(side = 1,labels = col.strings.pretty, at = col.vals.axis)
    if (is.null(add.args$yaxt) || add.args$yaxt != 'n')
       axis(side = 2, labels = row.strings.pretty, at = row.vals.axis)    
    
    if (scale) {
      require(plotrix)
      width.col<- 0.05*diff(par()$usr[1:2])
      x.coords <- par()$usr[2]+ c(0.5,1.5)*width.col
      y.coords <- par()$usr[3:4]
      color.legend(x.coords[1],y.coords[1],x.coords[2],y.coords[2],
                   rect.col= col,
                   legend=pretty(seq(zlim[1],zlim[2],
                     length.out = length(col)))
                   ,gradient='y',align='rb',cex=1.2)
    } 
    if (scale)  
      par(mar = old.mar)
}    
