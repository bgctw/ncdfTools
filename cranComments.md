## Test environments
* local Mint 18, R 3.4.4
* R-devel-san docker image, R 3.4.4 
* Travis ci: Ubuntu 14.04.5 LTS 
* win_builder: x86_64-w64-mingw32 (64-bit), r74674

## R CMD check results
No further notes, warnings, nor errors.

## Notes
Packages code that was formerly part of REddyProc 1.1.3, but 
required dependencies on NetCDF system libraries and R-Packages. 
Moving this to its own packages helps easier installation of the REddyProc package for users not working with the NetCDF file format.

