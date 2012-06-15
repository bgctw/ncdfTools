data.bin2ncdf = function
##title<< tranform binary file to ncdf file
##description<< This function transforms a binary data file to a ncdf file formated in a standardized way.
   (
    file.input                             ##<< charcter string: name of input file
    , length = 1                           ##<< integer: length in bytes of each entry in input file
    , type = numeric()                     ##<< R data type of the data in input file
    , type.ncdf = 'NC_DOUBLE'              ##<< desired data type in ncdf file
    , dimensions                           ##<< character vector: names of the dimensions in binary file
    , dimension.values                     ##<< list: each list element has to contain the coordinate values for
                                           ##   respective dimension
    , signed = TRUE
    , var.name                             ##<< character string: short name of the variable in binary file
    , long_name = var.name                 ##<< character string: long name of the variable in binary file
    , var.units = '[]'                      ##<< character string: units of variable
    , scale.factor.in = 1                  ##<< numeric: factor to multiply the input data with
    , scale.factor.out = scale.factor.in   ##<< numeric: desired scale factor of the data in the ncdf file.
    , na.value.in = -9999                  ##<< numeric: missing value for input data
    , na.value.out = na.value.in           ##<< numeric: missing value for output data
    , offset.in = 0                        ##<< numeric: offset for input data
    , offset.out = offset.in)              ##<< numeric: offset for output data
##value<< Nothing is returned but a ncdf file with a standardized name is written in the working directory.
{
    require(chron)
    require(RNetCDF)
    call.args <- call.args2string()
    cat('Loading data ...\n')
    dims.lengths <- sapply(dimension.values,length)
    to.read      <- file(file.input, "rb")
    data.raw     <- readBin(to.read, type, n = prod(dims.lengths), endian = "little", size=length, signed = signed)
    close(to.read)
    cat('Transforming data ...\n')
    data.array   <- array(data.raw,dim=dims.lengths)
    data.array[data.array==na.value.in]=NA
    data.array   <- (data.array * scale.factor.in/scale.factor.out) + (offset.in -offset.out)
    cat('Creating ncdf file ...\n')
    file.name    <- paste(var.name,dims.lengths[dimensions=='longitude'],
                          dims.lengths[dimensions=='latitude'],
                          as.character(years(min(date.vec))),
                          as.character(years(max(date.vec))),'nc',sep='.')
    create.std.nc(file.name, var.name, lat.length = dims.lengths[dimensions=='latitude'],
                  long.length = dims.lengths[dimensions=='longitude'],
                  time.length = dims.lengths[dimensions=='time'],
                  add_offset = offset.out, scale_factor = scale.factor.out, missing_value = na.value,
                  type.var = 'NC_SHORT', var.units=  var.units)
    cat('Writing data ...\n')
    file.con      <- open.nc(file.name,write=TRUE)
    data.array.perm <- aperm(data.array,perm=match(ncdf.get.diminfo(file.con)[,'name'],dimensions))
    var.put.nc(file.con,var.name,data.array)
    var.put.nc(file.con,'latitude',dimension.values[dimensions=='latitude'][[1]])
    var.put.nc(file.con,'longitude',dimension.values[dimensions=='longitude'][[1]])
    time.lilian <- as.numeric(julian(dimension.values[dimensions=='time'][[1]], origin = as.POSIXct("1582-10-14", tz="UTC")))
    var.put.nc(file.con,'time',time.lilian)
    ncdf.def.all.atts(file.con,var.name,atts=list(long_name=long_name))
    history.string <- paste(Sys.time(),' ncdf file created from file ', file.input, ' using function data.bin2ncdf() by ',
                            Sys.info()['login'], sep = '')
    ncdf.def.all.atts(file.con, 'NC_GLOBAL', atts = list(history = history.string, creation_settings = call.args))
    close.nc(file.con)
    cat('File sucessfully transformed!\n')
}
