call.args2string = function()
##title<< save function argument settings to a character string
{
    args.all  <- ls(parent.frame())
    args.call <- list()
    for (g in 1:length(args.all))
        args.call[[g]]<- get( args.all[g],envir=parent.frame())
    names(args.call)<- args.all
    extract.names=function(x)
    {
        if (class(x)[1]=='function') {
            text=body(x)
        } else {
            text = x
        }
        text
    }
    string.args  <- paste(paste(names(args.call),sapply(args.call,extract.names)
                                   ,sep=': '),collapse='; ')
    ##value<< character string: arguments given to function converted into a string.         
    return(string.args)
}
