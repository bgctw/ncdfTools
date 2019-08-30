# REddyProcNCDF 1.1.5
- factored out creating unit-class columns from `readNcdfDataframe` 
  to `asUnitsDataFrame`. Users should call now 
  `readNcdfDataframe(...) %>% asUnitsDataFrame()`

# REddyProcNCDF 1.1.4

- moving netCDF related functions from REddyProc 1.1.3 to this new package
- automatically choosing between alternative backends RNetCDF and ncdf4, 
  using the one that can actually be loaded
- cleaning function arguments
  - fileName includes directory, removing Dir.s argument
  - simpler argument names (not include type information)

