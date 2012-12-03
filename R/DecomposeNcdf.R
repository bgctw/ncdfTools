
R version 2.15.1 (2012-06-22) -- "Roasted Marshmallows"
Copyright (C) 2012 The R Foundation for Statistical Computing
ISBN 3-900051-07-0
Platform: x86_64-unknown-linux-gnu (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.


Attaching package: ‘ncdf.tools’

The following object(s) are masked from ‘package:jannis.misc’:

    call.args2string, compile.sysinfo, extract.datacube, ind.datacube


Attaching package: ‘spectral.methods’

The following object(s) are masked from ‘package:jannis.misc’:

    add.axis, AttachList, MEF, RMSE, status.report

Loading required package: mvbutils
Loading required package: utils
Loading required package: tools
Loading required package: stats
MVBUTILS loaded

Loading required package: tcltk
Loading Tcl/Tk interface ... done
> + + + ... + > + + > + ... + > > + ... + > > .help.ESS <- help
> options(STERM='iESS', editor='emacsclient')
> setwd('/Net/Groups/C-Side/MDI/_data/DataStructureMDI/workingData/CMIP5/Data/bcc-csm1-1/cLitter')
> list.files()
 [1] "cLitter_Lmon_bcc-csm1-1_esmFdbk1_r1i1p1_185001-198912.nc"                         
 [2] "cLitter_Lmon_bcc-csm1-1_esmFdbk1_r1i1p1_185001-198912_specdecomp.nc"              
 [3] "cLitter_Lmon_bcc-csm1-1_esmFixClim1_r1i1p1_185001-198912.nc"                      
 [4] "cLitter_Lmon_bcc-csm1-1_esmFixClim1_r1i1p1_185001-198912_specdecomp.nc"           
 [5] "delete.me.RData"                                                                  
 [6] "grouping_error_1353960588.5534.RData"                                             
 [7] "grouping_error_1353960588.56713.RData"                                            
 [8] "results_cLitter_Lmon_bcc-csm1-1_esmFdbk1_r1i1p1_185001-198912.nc.RData"           
 [9] "results_cLitter_Lmon_bcc-csm1-1_esmFixClim1_r1i1p1_185001-198912.nc.RData"        
[10] "workspace_error_cLitter_Lmon_bcc-csm1-1_esmFdbk1_r1i1p1_185001-198912.nc_2_43.rda"
[11] "workspace_error_cLitter_Lmon_bcc-csm1-1_esmFdbk1_r1i1p1_185001-198912.nc_4_50.rda"
> load('delete.me.RData')
> ls()
 [1] "algorithm.type"  "borders.wl"      "call.args"       "check.files"    
 [5] "debugging"       "dump.frames.mod" "file.name"       "file.settings"  
 [9] "harmonics"       "i"               "job.id"          "M"              
[13] "max.cores"       "n.comp"          "objects.save"    "packages"       
[17] "path.to.file"    "pkg.loaded"      "repeat.extr"     "run.info"       
[21] "time.start"      "tresh.const"    
>   suffix <- switch(algorithm.type, Decomp = '_specdecomp.nc', Gapfill = '_gapfill.nc' )
> suffix
NULL
> algorith.type
Error: object 'algorith.type' not found
> algorithm.type
[1] "Decompose"
> getwd()
[1] "/Minerva/MDI/_data/DataStructureMDI/workingData/CMIP5/Data/bcc-csm1-1/cLitter"
> print(paste(as.character(Sys.time()),': Working directory is: \n ', getwd(), sep=""))
[1] "2012-11-30 16:08:15: Working directory is: \n /Minerva/MDI/_data/DataStructureMDI/workingData/CMIP5/Data/bcc-csm1-1/cLitter"
> cat(paste(as.character(Sys.time()),': Working directory is: \n ', getwd(), sep=""))
2012-11-30 16:08:30: Working directory is: 
 /Minerva/MDI/_data/DataStructureMDI/workingData/CMIP5/Data/bcc-csm1-1/cLitter> cat(paste(as.character(Sys.time()),': Working directory is: \n ', getwd(), '\n', sep=""))
2012-11-30 16:08:43: Working directory is: 
 /Minerva/MDI/_data/DataStructureMDI/workingData/CMIP5/Data/bcc-csm1-1/cLitter
> cat('Starting calculation ...................................................................\n')
Starting calculation ...................................................................
> getwd()
[1] "/Minerva/MDI/_data/DataStructureMDI/workingData/CMIP5/Data/bcc-csm1-1/cLitter"
> setwd('/Net/Groups/C-Side/MDI/_data/DataStructureMDI/workingData/CMIP5/Data/bcc-csm1-1/cLitter')
> list.files()
 [1] "cLitter_Lmon_bcc-csm1-1_esmFdbk1_r1i1p1_185001-198912.nc"                         
 [2] "cLitter_Lmon_bcc-csm1-1_esmFdbk1_r1i1p1_185001-198912_specdecomp.nc"              
 [3] "cLitter_Lmon_bcc-csm1-1_esmFixClim1_r1i1p1_185001-198912.nc"                      
 [4] "delete.me.RData"                                                                  
 [5] "grouping_error_1353960588.5534.RData"                                             
 [6] "grouping_error_1353960588.56713.RData"                                            
 [7] "results_cLitter_Lmon_bcc-csm1-1_esmFdbk1_r1i1p1_185001-198912.nc.RData"           
 [8] "results_cLitter_Lmon_bcc-csm1-1_esmFixClim1_r1i1p1_185001-198912.nc.RData"        
 [9] "workspace_error_cLitter_Lmon_bcc-csm1-1_esmFdbk1_r1i1p1_185001-198912.nc_2_43.rda"
[10] "workspace_error_cLitter_Lmon_bcc-csm1-1_esmFdbk1_r1i1p1_185001-198912.nc_4_50.rda"
> file.remove(list.files()[c(4:6,8:10)])
[1] TRUE TRUE TRUE TRUE TRUE TRUE
> list.files()
[1] "cLitter_Lmon_bcc-csm1-1_esmFdbk1_r1i1p1_185001-198912.nc"              
[2] "cLitter_Lmon_bcc-csm1-1_esmFdbk1_r1i1p1_185001-198912_specdecomp.nc"   
[3] "cLitter_Lmon_bcc-csm1-1_esmFixClim1_r1i1p1_185001-198912.nc"           
[4] "results_cLitter_Lmon_bcc-csm1-1_esmFdbk1_r1i1p1_185001-198912.nc.RData"
> index <- c(14, 21,75:80,81,82,85,86,87,89,91,92,94,95,96,98,111-120)
> index
 [1] 14 21 75 76 77 78 79 80 81 82 85 86 87 89 91 92 94 95 96 98 -9
> getwd()
[1] "/Minerva/MDI/_data/DataStructureMDI/workingData/CMIP5/Data/bcc-csm1-1/cLitter"
> setwd('../..')
> getwd()
[1] "/Minerva/MDI/_data/DataStructureMDI/workingData/CMIP5/Data"
> file.name = list:esm
Error: object 'esm' not found
> file.name = 'list:esm'
> + [1] TRUE
>   filepath  <- read.csv(paste(path.to.file, '/Filelists/', strsplit(file.name, ':')[[1]][2],
+                               '.list', sep =''), header = FALSE, stringsAsFactor = FALSE)[job.id,]
Error in file(file, "rt") : cannot open the connection
In addition: Warning message:
In file(file, "rt") :
  cannot open file '_data/DataStructureMDI/workingData/CMIP5/Data/bcc-csm1-1/cLitter/Filelists/esm.list': No such file or directory
> path.to.file
[1] "_data/DataStructureMDI/workingData/CMIP5/Data/bcc-csm1-1/cLitter"
> path.to.file <- ('../')
> getwd()
[1] "/Minerva/MDI/_data/DataStructureMDI/workingData/CMIP5/Data"
> path.to.file = ''
>   filepath  <- read.csv(paste(path.to.file, '/Filelists/', strsplit(file.name, ':')[[1]][2],
+                               '.list', sep =''), header = FALSE, stringsAsFactor = FALSE)[job.id,]
Error in file(file, "rt") : cannot open the connection
In addition: Warning message:
In file(file, "rt") :
  cannot open file '/Filelists/esm.list': No such file or directory
> + + [1] "/Filelists/esm.list"
> getwd()
[1] "/Minerva/MDI/_data/DataStructureMDI/workingData/CMIP5/Data"
> path.to.file = getwd()
> + + [1] "bcc-csm1-1/cLitter/cLitter_Lmon_bcc-csm1-1_esmFixClim1_r1i1p1_185001-198912.nc"
> files.all <- read.csv(paste(path.to.file, '/Filelists/', strsplit(file.name, ':')[[1]][2],
                              '.list', sep =''), header = FALSE, stringsAsFactor = FALSE)
+ > files.all
                                                                                    V1
1       bcc-csm1-1/cLitter/cLitter_Lmon_bcc-csm1-1_esmFixClim1_r1i1p1_185001-198912.nc
2          bcc-csm1-1/cLitter/cLitter_Lmon_bcc-csm1-1_esmFdbk1_r1i1p1_185001-198912.nc
3             CanESM2/cLitter/cLitter_Lmon_CanESM2_esmFixClim1_r1i1p1_185001-198912.nc
4                CanESM2/cLitter/cLitter_Lmon_CanESM2_esmFdbk1_r1i1p1_185001-198912.nc
5         CESM1-BGC/cLitter/cLitter_Lmon_CESM1-BGC_esmFixClim1_r1i1p1_185001-198912.nc
6         CESM1-BGC/cLitter/cLitter_Lmon_CESM1-BGC_esmFixClim1_r1i1p2_185001-198912.nc
7         CESM1-BGC/cLitter/cLitter_Lmon_CESM1-BGC_esmFixClim1_r1i1p3_185001-198912.nc
8            CESM1-BGC/cLitter/cLitter_Lmon_CESM1-BGC_esmFdbk1_r1i1p1_185001-198912.nc
9   IPSL-CM5A-LR/cLitter/cLitter_Lmon_IPSL-CM5A-LR_esmFixClim1_r1i1p1_185001-198912.nc
10     IPSL-CM5A-LR/cLitter/cLitter_Lmon_IPSL-CM5A-LR_esmFdbk1_r1i1p1_185001-198912.nc
11     IPSL-CM5A-MR/cLitter/cLitter_Lmon_IPSL-CM5A-MR_esmFdbk1_r1i1p1_185001-198912.nc
12      MPI-ESM-LR/cLitter/cLitter_Lmon_MPI-ESM-LR_esmFixClim1_r1i1p1_185001-198912.nc
13         MPI-ESM-LR/cLitter/cLitter_Lmon_MPI-ESM-LR_esmFdbk1_r1i1p1_185001-198912.nc
14               CanESM2/co2mass/co2mass_Amon_CanESM2_esmFdbk1_r1i1p1_185001-198912.nc
15         GFDL-ESM2M/co2mass/co2mass_Amon_GFDL-ESM2M_esmFdbk1_r1i1p1_185101-198912.nc
16                    CanESM2/co2/co2_Amon_CanESM2_esmFixClim1_r1i1p1_185001-198912.nc
17                       CanESM2/co2/co2_Amon_CanESM2_esmFdbk1_r1i1p1_185001-198912.nc
18                CESM1-BGC/co2/co2_Amon_CESM1-BGC_esmFixClim1_r1i1p1_185101-198912.nc
19                CESM1-BGC/co2/co2_Amon_CESM1-BGC_esmFixClim1_r1i1p2_185101-198912.nc
20                CESM1-BGC/co2/co2_Amon_CESM1-BGC_esmFixClim1_r1i1p3_185101-198912.nc
21                   CESM1-BGC/co2/co2_Amon_CESM1-BGC_esmFdbk1_r1i1p1_185101-198912.nc
22              GFDL-ESM2M/co2/co2_Amon_GFDL-ESM2M_esmFixClim1_r1i1p1_185101-198912.nc
23                 GFDL-ESM2M/co2/co2_Amon_GFDL-ESM2M_esmFdbk1_r1i1p1_185101-198912.nc
24          bcc-csm1-1/cSoil/cSoil_Lmon_bcc-csm1-1_esmFixClim1_r1i1p1_185001-198912.nc
25             bcc-csm1-1/cSoil/cSoil_Lmon_bcc-csm1-1_esmFdbk1_r1i1p1_185001-198912.nc
26                CanESM2/cSoil/cSoil_Lmon_CanESM2_esmFixClim1_r1i1p1_185001-198912.nc
27                   CanESM2/cSoil/cSoil_Lmon_CanESM2_esmFdbk1_r1i1p1_185001-198912.nc
28            CESM1-BGC/cSoil/cSoil_Lmon_CESM1-BGC_esmFixClim1_r1i1p1_185001-198912.nc
29            CESM1-BGC/cSoil/cSoil_Lmon_CESM1-BGC_esmFixClim1_r1i1p2_185001-198912.nc
30            CESM1-BGC/cSoil/cSoil_Lmon_CESM1-BGC_esmFixClim1_r1i1p3_185001-198912.nc
31               CESM1-BGC/cSoil/cSoil_Lmon_CESM1-BGC_esmFdbk1_r1i1p1_185001-198912.nc
32          GFDL-ESM2M/cSoil/cSoil_Lmon_GFDL-ESM2M_esmFixClim1_r1i1p1_185101-198912.nc
33             GFDL-ESM2M/cSoil/cSoil_Lmon_GFDL-ESM2M_esmFdbk1_r1i1p1_185101-198912.nc
34      IPSL-CM5A-LR/cSoil/cSoil_Lmon_IPSL-CM5A-LR_esmFixClim1_r1i1p1_185001-198912.nc
35         IPSL-CM5A-LR/cSoil/cSoil_Lmon_IPSL-CM5A-LR_esmFdbk1_r1i1p1_185001-198912.nc
36         IPSL-CM5A-MR/cSoil/cSoil_Lmon_IPSL-CM5A-MR_esmFdbk1_r1i1p1_185001-198912.nc
37          MPI-ESM-LR/cSoil/cSoil_Lmon_MPI-ESM-LR_esmFixClim1_r1i1p1_185001-198912.nc
38             MPI-ESM-LR/cSoil/cSoil_Lmon_MPI-ESM-LR_esmFdbk1_r1i1p1_185001-198912.nc
39          bcc-csm1-1/cTerr/cTerr_Lmon_bcc-csm1-1_esmFixClim1_r1i1p1_185001-198912.nc
40             bcc-csm1-1/cTerr/cTerr_Lmon_bcc-csm1-1_esmFdbk1_r1i1p1_185001-198912.nc
41                CanESM2/cTerr/cTerr_Lmon_CanESM2_esmFixClim1_r1i1p1_185001-198912.nc
42                   CanESM2/cTerr/cTerr_Lmon_CanESM2_esmFdbk1_r1i1p1_185001-198912.nc
43            CESM1-BGC/cTerr/cTerr_Lmon_CESM1-BGC_esmFixClim1_r1i1p1_185001-198912.nc
44            CESM1-BGC/cTerr/cTerr_Lmon_CESM1-BGC_esmFixClim1_r1i1p2_185001-198912.nc
45            CESM1-BGC/cTerr/cTerr_Lmon_CESM1-BGC_esmFixClim1_r1i1p3_185001-198912.nc
46               CESM1-BGC/cTerr/cTerr_Lmon_CESM1-BGC_esmFdbk1_r1i1p1_185001-198912.nc
47          GFDL-ESM2M/cTerr/cTerr_Lmon_GFDL-ESM2M_esmFixClim1_r1i1p1_185101-198912.nc
48             GFDL-ESM2M/cTerr/cTerr_Lmon_GFDL-ESM2M_esmFdbk1_r1i1p1_185101-198912.nc
49      IPSL-CM5A-LR/cTerr/cTerr_Lmon_IPSL-CM5A-LR_esmFixClim1_r1i1p1_185001-198912.nc
50         IPSL-CM5A-LR/cTerr/cTerr_Lmon_IPSL-CM5A-LR_esmFdbk1_r1i1p1_185001-198912.nc
51         IPSL-CM5A-MR/cTerr/cTerr_Lmon_IPSL-CM5A-MR_esmFdbk1_r1i1p1_185001-198912.nc
52          MPI-ESM-LR/cTerr/cTerr_Lmon_MPI-ESM-LR_esmFixClim1_r1i1p1_185001-198912.nc
53             MPI-ESM-LR/cTerr/cTerr_Lmon_MPI-ESM-LR_esmFdbk1_r1i1p1_185001-198912.nc
54            bcc-csm1-1/cVeg/cVeg_Lmon_bcc-csm1-1_esmFixClim1_r1i1p1_185001-198912.nc
55               bcc-csm1-1/cVeg/cVeg_Lmon_bcc-csm1-1_esmFdbk1_r1i1p1_185001-198912.nc
56                  CanESM2/cVeg/cVeg_Lmon_CanESM2_esmFixClim1_r1i1p1_185001-198912.nc
57                     CanESM2/cVeg/cVeg_Lmon_CanESM2_esmFdbk1_r1i1p1_185001-198912.nc
58              CESM1-BGC/cVeg/cVeg_Lmon_CESM1-BGC_esmFixClim1_r1i1p1_185001-198912.nc
59              CESM1-BGC/cVeg/cVeg_Lmon_CESM1-BGC_esmFixClim1_r1i1p2_185001-198912.nc
60              CESM1-BGC/cVeg/cVeg_Lmon_CESM1-BGC_esmFixClim1_r1i1p3_185001-198912.nc
61                 CESM1-BGC/cVeg/cVeg_Lmon_CESM1-BGC_esmFdbk1_r1i1p1_185001-198912.nc
62            GFDL-ESM2M/cVeg/cVeg_Lmon_GFDL-ESM2M_esmFixClim1_r1i1p1_185101-198912.nc
63               GFDL-ESM2M/cVeg/cVeg_Lmon_GFDL-ESM2M_esmFdbk1_r1i1p1_185101-198912.nc
64        IPSL-CM5A-LR/cVeg/cVeg_Lmon_IPSL-CM5A-LR_esmFixClim1_r1i1p1_185001-198912.nc
65           IPSL-CM5A-LR/cVeg/cVeg_Lmon_IPSL-CM5A-LR_esmFdbk1_r1i1p1_185001-198912.nc
66           IPSL-CM5A-MR/cVeg/cVeg_Lmon_IPSL-CM5A-MR_esmFdbk1_r1i1p1_185001-198912.nc
67            MPI-ESM-LR/cVeg/cVeg_Lmon_MPI-ESM-LR_esmFixClim1_r1i1p1_185001-198912.nc
68               MPI-ESM-LR/cVeg/cVeg_Lmon_MPI-ESM-LR_esmFdbk1_r1i1p1_185001-198912.nc
69                       CanESM2/gpp/gpp_Lmon_CanESM2_esmFdbk1_r1i1p1_185001-198912.nc
70                 GFDL-ESM2M/gpp/gpp_Lmon_GFDL-ESM2M_esmFdbk1_r1i1p1_185101-198912.nc
71             IPSL-CM5A-LR/gpp/gpp_Lmon_IPSL-CM5A-LR_esmFdbk1_r1i1p1_185001-198912.nc
72             IPSL-CM5A-MR/gpp/gpp_Lmon_IPSL-CM5A-MR_esmFdbk1_r1i1p1_185001-198912.nc
73                 MPI-ESM-LR/gpp/gpp_Lmon_MPI-ESM-LR_esmFdbk1_r1i1p1_185001-198912.nc
74                bcc-csm1-1/pr/pr_Amon_bcc-csm1-1_esmFixClim1_r1i1p1_185001-198912.nc
75               bcc-csm1-1/pr/pr_OImon_bcc-csm1-1_esmFixClim1_r1i1p1_185001-198912.nc
76                   bcc-csm1-1/pr/pr_Amon_bcc-csm1-1_esmFdbk1_r1i1p1_185001-198912.nc
77                  bcc-csm1-1/pr/pr_OImon_bcc-csm1-1_esmFdbk1_r1i1p1_185001-198912.nc
78                      CanESM2/pr/pr_Amon_CanESM2_esmFixClim1_r1i1p1_185001-198912.nc
79                     CanESM2/pr/pr_OImon_CanESM2_esmFixClim1_r1i1p1_185001-198912.nc
80                         CanESM2/pr/pr_Amon_CanESM2_esmFdbk1_r1i1p1_185001-198912.nc
81                        CanESM2/pr/pr_OImon_CanESM2_esmFdbk1_r1i1p1_185001-198912.nc
82                  CESM1-BGC/pr/pr_Amon_CESM1-BGC_esmFixClim1_r1i1p1_185001-198912.nc
83                  CESM1-BGC/pr/pr_Amon_CESM1-BGC_esmFixClim1_r1i1p2_185001-198912.nc
84                  CESM1-BGC/pr/pr_Amon_CESM1-BGC_esmFixClim1_r1i1p3_185001-198912.nc
85                  CESM1-BGC/pr/pr_Omon_CESM1-BGC_esmFixClim1_r1i1p1_185001-198912.nc
86                  CESM1-BGC/pr/pr_Omon_CESM1-BGC_esmFixClim1_r1i1p2_185001-198912.nc
87                  CESM1-BGC/pr/pr_Omon_CESM1-BGC_esmFixClim1_r1i1p3_185001-198912.nc
88                     CESM1-BGC/pr/pr_Amon_CESM1-BGC_esmFdbk1_r1i1p1_185001-198912.nc
89                     CESM1-BGC/pr/pr_Omon_CESM1-BGC_esmFdbk1_r1i1p1_185001-198912.nc
90                GFDL-ESM2M/pr/pr_Amon_GFDL-ESM2M_esmFixClim1_r1i1p1_185101-198912.nc
91               GFDL-ESM2M/pr/pr_OImon_GFDL-ESM2M_esmFixClim1_r1i1p1_185101-198912.nc
92                GFDL-ESM2M/pr/pr_Omon_GFDL-ESM2M_esmFixClim1_r1i1p1_185101-198912.nc
93                   GFDL-ESM2M/pr/pr_Amon_GFDL-ESM2M_esmFdbk1_r1i1p1_185101-198912.nc
94                  GFDL-ESM2M/pr/pr_OImon_GFDL-ESM2M_esmFdbk1_r1i1p1_185101-198912.nc
95                   GFDL-ESM2M/pr/pr_Omon_GFDL-ESM2M_esmFdbk1_r1i1p1_185001-198912.nc
96                   GFDL-ESM2M/pr/pr_Omon_GFDL-ESM2M_esmFdbk1_r1i1p1_185101-198912.nc
97            IPSL-CM5A-LR/pr/pr_Amon_IPSL-CM5A-LR_esmFixClim1_r1i1p1_185001-198912.nc
98            IPSL-CM5A-LR/pr/pr_Omon_IPSL-CM5A-LR_esmFixClim1_r1i1p1_185001-198912.nc
99               IPSL-CM5A-LR/pr/pr_Amon_IPSL-CM5A-LR_esmFdbk1_r1i1p1_185001-198912.nc
100              IPSL-CM5A-LR/pr/pr_Omon_IPSL-CM5A-LR_esmFdbk1_r1i1p1_185001-198912.nc
101              IPSL-CM5A-MR/pr/pr_Amon_IPSL-CM5A-MR_esmFdbk1_r1i1p1_185001-198912.nc
102              IPSL-CM5A-MR/pr/pr_Omon_IPSL-CM5A-MR_esmFdbk1_r1i1p1_185001-198912.nc
103               MPI-ESM-LR/pr/pr_Amon_MPI-ESM-LR_esmFixClim1_r1i1p1_185001-198912.nc
104                  MPI-ESM-LR/pr/pr_Amon_MPI-ESM-LR_esmFdbk1_r1i1p1_185001-198912.nc
105             bcc-csm1-1/tas/tas_Amon_bcc-csm1-1_esmFixClim1_r1i1p1_185001-198912.nc
106                bcc-csm1-1/tas/tas_Amon_bcc-csm1-1_esmFdbk1_r1i1p1_185001-198912.nc
107                   CanESM2/tas/tas_Amon_CanESM2_esmFixClim1_r1i1p1_185001-198912.nc
108                      CanESM2/tas/tas_Amon_CanESM2_esmFdbk1_r1i1p1_185001-198912.nc
109               CESM1-BGC/tas/tas_Amon_CESM1-BGC_esmFixClim1_r1i1p1_185001-198912.nc
110               CESM1-BGC/tas/tas_Amon_CESM1-BGC_esmFixClim1_r1i1p2_185001-198912.nc
111               CESM1-BGC/tas/tas_Amon_CESM1-BGC_esmFixClim1_r1i1p3_185001-198912.nc
112                  CESM1-BGC/tas/tas_Amon_CESM1-BGC_esmFdbk1_r1i1p1_185001-198912.nc
113             GFDL-ESM2M/tas/tas_Amon_GFDL-ESM2M_esmFixClim1_r1i1p1_185101-198912.nc
114                GFDL-ESM2M/tas/tas_Amon_GFDL-ESM2M_esmFdbk1_r1i1p1_185101-198912.nc
115       HadGEM2-ES/tas/tas_Amon_HadGEM2-ES_esmFixClim1_r1i1p1_aggrg_185912-199912.nc
116         IPSL-CM5A-LR/tas/tas_Amon_IPSL-CM5A-LR_esmFixClim1_r1i1p1_185001-198912.nc
117            IPSL-CM5A-LR/tas/tas_Amon_IPSL-CM5A-LR_esmFdbk1_r1i1p1_185001-198912.nc
118            IPSL-CM5A-MR/tas/tas_Amon_IPSL-CM5A-MR_esmFdbk1_r1i1p1_185001-198912.nc
119             MPI-ESM-LR/tas/tas_Amon_MPI-ESM-LR_esmFixClim1_r1i1p1_185001-198912.nc
120                MPI-ESM-LR/tas/tas_Amon_MPI-ESM-LR_esmFdbk1_r1i1p1_185001-198912.nc
> file.kill <- files.all[index
+ ]
Error in `[.default`(files.all, index) : 
  only 0's may be mixed with negative subscripts
> index
 [1] 14 21 75 76 77 78 79 80 81 82 85 86 87 89 91 92 94 95 96 98 -9
> index <- c(14, 21,75:80,81,82,85,86,87,89,91,92,94,95,96,98,111:120)
> files.all <- read.csv(paste(path.to.file, '/Filelists/', strsplit(file.name, ':')[[1]][2],
                              '.list', sep =''), header = FALSE, stringsAsFactor = FALSE)
+ > files.kill <- files.all[index]
Error in `[.data.frame`(files.all, index) : undefined columns selected
> str(files.all)
'data.frame':	120 obs. of  1 variable:
 $ V1: chr  "bcc-csm1-1/cLitter/cLitter_Lmon_bcc-csm1-1_esmFixClim1_r1i1p1_185001-198912.nc" "bcc-csm1-1/cLitter/cLitter_Lmon_bcc-csm1-1_esmFdbk1_r1i1p1_185001-198912.nc" "CanESM2/cLitter/cLitter_Lmon_CanESM2_esmFixClim1_r1i1p1_185001-198912.nc" "CanESM2/cLitter/cLitter_Lmon_CanESM2_esmFdbk1_r1i1p1_185001-198912.nc" ...
> files.kill <- files.all[index,1]
> feiles.kill
Error: object 'feiles.kill' not found
> files.kill
 [1] "CanESM2/co2mass/co2mass_Amon_CanESM2_esmFdbk1_r1i1p1_185001-198912.nc"       
 [2] "CESM1-BGC/co2/co2_Amon_CESM1-BGC_esmFdbk1_r1i1p1_185101-198912.nc"           
 [3] "bcc-csm1-1/pr/pr_OImon_bcc-csm1-1_esmFixClim1_r1i1p1_185001-198912.nc"       
 [4] "bcc-csm1-1/pr/pr_Amon_bcc-csm1-1_esmFdbk1_r1i1p1_185001-198912.nc"           
 [5] "bcc-csm1-1/pr/pr_OImon_bcc-csm1-1_esmFdbk1_r1i1p1_185001-198912.nc"          
 [6] "CanESM2/pr/pr_Amon_CanESM2_esmFixClim1_r1i1p1_185001-198912.nc"              
 [7] "CanESM2/pr/pr_OImon_CanESM2_esmFixClim1_r1i1p1_185001-198912.nc"             
 [8] "CanESM2/pr/pr_Amon_CanESM2_esmFdbk1_r1i1p1_185001-198912.nc"                 
 [9] "CanESM2/pr/pr_OImon_CanESM2_esmFdbk1_r1i1p1_185001-198912.nc"                
[10] "CESM1-BGC/pr/pr_Amon_CESM1-BGC_esmFixClim1_r1i1p1_185001-198912.nc"          
[11] "CESM1-BGC/pr/pr_Omon_CESM1-BGC_esmFixClim1_r1i1p1_185001-198912.nc"          
[12] "CESM1-BGC/pr/pr_Omon_CESM1-BGC_esmFixClim1_r1i1p2_185001-198912.nc"          
[13] "CESM1-BGC/pr/pr_Omon_CESM1-BGC_esmFixClim1_r1i1p3_185001-198912.nc"          
[14] "CESM1-BGC/pr/pr_Omon_CESM1-BGC_esmFdbk1_r1i1p1_185001-198912.nc"             
[15] "GFDL-ESM2M/pr/pr_OImon_GFDL-ESM2M_esmFixClim1_r1i1p1_185101-198912.nc"       
[16] "GFDL-ESM2M/pr/pr_Omon_GFDL-ESM2M_esmFixClim1_r1i1p1_185101-198912.nc"        
[17] "GFDL-ESM2M/pr/pr_OImon_GFDL-ESM2M_esmFdbk1_r1i1p1_185101-198912.nc"          
[18] "GFDL-ESM2M/pr/pr_Omon_GFDL-ESM2M_esmFdbk1_r1i1p1_185001-198912.nc"           
[19] "GFDL-ESM2M/pr/pr_Omon_GFDL-ESM2M_esmFdbk1_r1i1p1_185101-198912.nc"           
[20] "IPSL-CM5A-LR/pr/pr_Omon_IPSL-CM5A-LR_esmFixClim1_r1i1p1_185001-198912.nc"    
[21] "CESM1-BGC/tas/tas_Amon_CESM1-BGC_esmFixClim1_r1i1p3_185001-198912.nc"        
[22] "CESM1-BGC/tas/tas_Amon_CESM1-BGC_esmFdbk1_r1i1p1_185001-198912.nc"           
[23] "GFDL-ESM2M/tas/tas_Amon_GFDL-ESM2M_esmFixClim1_r1i1p1_185101-198912.nc"      
[24] "GFDL-ESM2M/tas/tas_Amon_GFDL-ESM2M_esmFdbk1_r1i1p1_185101-198912.nc"         
[25] "HadGEM2-ES/tas/tas_Amon_HadGEM2-ES_esmFixClim1_r1i1p1_aggrg_185912-199912.nc"
[26] "IPSL-CM5A-LR/tas/tas_Amon_IPSL-CM5A-LR_esmFixClim1_r1i1p1_185001-198912.nc"  
[27] "IPSL-CM5A-LR/tas/tas_Amon_IPSL-CM5A-LR_esmFdbk1_r1i1p1_185001-198912.nc"     
[28] "IPSL-CM5A-MR/tas/tas_Amon_IPSL-CM5A-MR_esmFdbk1_r1i1p1_185001-198912.nc"     
[29] "MPI-ESM-LR/tas/tas_Amon_MPI-ESM-LR_esmFixClim1_r1i1p1_185001-198912.nc"      
[30] "MPI-ESM-LR/tas/tas_Amon_MPI-ESM-LR_esmFdbk1_r1i1p1_185001-198912.nc"         
> algorithm.type
[1] "Decompose"
>    suffix <- switch(algorithm.type, Decompose = '_specdecomp.nc', Gapfill = '_gapfill.nc' )
> files.kill <-  sub('[.]nc$', suffix, files.kill)
> files.kill
 [1] "CanESM2/co2mass/co2mass_Amon_CanESM2_esmFdbk1_r1i1p1_185001-198912_specdecomp.nc"       
 [2] "CESM1-BGC/co2/co2_Amon_CESM1-BGC_esmFdbk1_r1i1p1_185101-198912_specdecomp.nc"           
 [3] "bcc-csm1-1/pr/pr_OImon_bcc-csm1-1_esmFixClim1_r1i1p1_185001-198912_specdecomp.nc"       
 [4] "bcc-csm1-1/pr/pr_Amon_bcc-csm1-1_esmFdbk1_r1i1p1_185001-198912_specdecomp.nc"           
 [5] "bcc-csm1-1/pr/pr_OImon_bcc-csm1-1_esmFdbk1_r1i1p1_185001-198912_specdecomp.nc"          
 [6] "CanESM2/pr/pr_Amon_CanESM2_esmFixClim1_r1i1p1_185001-198912_specdecomp.nc"              
 [7] "CanESM2/pr/pr_OImon_CanESM2_esmFixClim1_r1i1p1_185001-198912_specdecomp.nc"             
 [8] "CanESM2/pr/pr_Amon_CanESM2_esmFdbk1_r1i1p1_185001-198912_specdecomp.nc"                 
 [9] "CanESM2/pr/pr_OImon_CanESM2_esmFdbk1_r1i1p1_185001-198912_specdecomp.nc"                
[10] "CESM1-BGC/pr/pr_Amon_CESM1-BGC_esmFixClim1_r1i1p1_185001-198912_specdecomp.nc"          
[11] "CESM1-BGC/pr/pr_Omon_CESM1-BGC_esmFixClim1_r1i1p1_185001-198912_specdecomp.nc"          
[12] "CESM1-BGC/pr/pr_Omon_CESM1-BGC_esmFixClim1_r1i1p2_185001-198912_specdecomp.nc"          
[13] "CESM1-BGC/pr/pr_Omon_CESM1-BGC_esmFixClim1_r1i1p3_185001-198912_specdecomp.nc"          
[14] "CESM1-BGC/pr/pr_Omon_CESM1-BGC_esmFdbk1_r1i1p1_185001-198912_specdecomp.nc"             
[15] "GFDL-ESM2M/pr/pr_OImon_GFDL-ESM2M_esmFixClim1_r1i1p1_185101-198912_specdecomp.nc"       
[16] "GFDL-ESM2M/pr/pr_Omon_GFDL-ESM2M_esmFixClim1_r1i1p1_185101-198912_specdecomp.nc"        
[17] "GFDL-ESM2M/pr/pr_OImon_GFDL-ESM2M_esmFdbk1_r1i1p1_185101-198912_specdecomp.nc"          
[18] "GFDL-ESM2M/pr/pr_Omon_GFDL-ESM2M_esmFdbk1_r1i1p1_185001-198912_specdecomp.nc"           
[19] "GFDL-ESM2M/pr/pr_Omon_GFDL-ESM2M_esmFdbk1_r1i1p1_185101-198912_specdecomp.nc"           
[20] "IPSL-CM5A-LR/pr/pr_Omon_IPSL-CM5A-LR_esmFixClim1_r1i1p1_185001-198912_specdecomp.nc"    
[21] "CESM1-BGC/tas/tas_Amon_CESM1-BGC_esmFixClim1_r1i1p3_185001-198912_specdecomp.nc"        
[22] "CESM1-BGC/tas/tas_Amon_CESM1-BGC_esmFdbk1_r1i1p1_185001-198912_specdecomp.nc"           
[23] "GFDL-ESM2M/tas/tas_Amon_GFDL-ESM2M_esmFixClim1_r1i1p1_185101-198912_specdecomp.nc"      
[24] "GFDL-ESM2M/tas/tas_Amon_GFDL-ESM2M_esmFdbk1_r1i1p1_185101-198912_specdecomp.nc"         
[25] "HadGEM2-ES/tas/tas_Amon_HadGEM2-ES_esmFixClim1_r1i1p1_aggrg_185912-199912_specdecomp.nc"
[26] "IPSL-CM5A-LR/tas/tas_Amon_IPSL-CM5A-LR_esmFixClim1_r1i1p1_185001-198912_specdecomp.nc"  
[27] "IPSL-CM5A-LR/tas/tas_Amon_IPSL-CM5A-LR_esmFdbk1_r1i1p1_185001-198912_specdecomp.nc"     
[28] "IPSL-CM5A-MR/tas/tas_Amon_IPSL-CM5A-MR_esmFdbk1_r1i1p1_185001-198912_specdecomp.nc"     
[29] "MPI-ESM-LR/tas/tas_Amon_MPI-ESM-LR_esmFixClim1_r1i1p1_185001-198912_specdecomp.nc"      
[30] "MPI-ESM-LR/tas/tas_Amon_MPI-ESM-LR_esmFdbk1_r1i1p1_185001-198912_specdecomp.nc"         
> file.remove(files.kill)
 [1]  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE
[13]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[25]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
Warning messages:
1: In file.remove(files.kill) :
  cannot remove file 'bcc-csm1-1/pr/pr_OImon_bcc-csm1-1_esmFixClim1_r1i1p1_185001-198912_specdecomp.nc', reason 'No such file or directory'
2: In file.remove(files.kill) :
  cannot remove file 'bcc-csm1-1/pr/pr_Amon_bcc-csm1-1_esmFdbk1_r1i1p1_185001-198912_specdecomp.nc', reason 'No such file or directory'
3: In file.remove(files.kill) :
  cannot remove file 'bcc-csm1-1/pr/pr_OImon_bcc-csm1-1_esmFdbk1_r1i1p1_185001-198912_specdecomp.nc', reason 'No such file or directory'
4: In file.remove(files.kill) :
  cannot remove file 'CanESM2/pr/pr_Amon_CanESM2_esmFixClim1_r1i1p1_185001-198912_specdecomp.nc', reason 'No such file or directory'
5: In file.remove(files.kill) :
  cannot remove file 'CanESM2/pr/pr_OImon_CanESM2_esmFixClim1_r1i1p1_185001-198912_specdecomp.nc', reason 'No such file or directory'
> rm(list=ls())
> load('//Net/Groups/C-Side/MDI/tmp/jbuttlar/Cluster_jobs_debugging/_data/DataStructureMDI/workingData/CMIP5/Data/CanESM2/pr/error_debug_pr_OImon_CanESM2_esmFdbk1_r1i1p1_185001-198912.nc.rda')
> q()
Save workspace image? [y/n/c]: n

Process R finished at Fri Nov 30 19:11:54 2012


R version 2.15.1 (2012-06-22) -- "Roasted Marshmallows"
Copyright (C) 2012 The R Foundation for Statistical Computing
ISBN 3-900051-07-0
Platform: x86_64-unknown-linux-gnu (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.


Attaching package: ‘ncdf.tools’

The following object(s) are masked from ‘package:jannis.misc’:

    call.args2string, compile.sysinfo, extract.datacube, ind.datacube


Attaching package: ‘spectral.methods’

The following object(s) are masked from ‘package:jannis.misc’:

    add.axis, AttachList, MEF, RMSE, status.report

Loading required package: mvbutils
Loading required package: utils
Loading required package: tools
Loading required package: stats
MVBUTILS loaded

Loading required package: tcltk
Loading Tcl/Tk interface ... done
> + + + ... + > + + > + ... + > > + ... + > > .help.ESS <- help
> options(STERM='iESS', editor='emacsclient')
> libary(jannis.misc)
Error: could not find function "libary"
> library(jannis.misc)
> BuildPackage('ncdf.tools')
Loading required package: inlinedocs
Read 10 items
* checking for file ‘ncdf.tools/DESCRIPTION’ ... OK
* preparing ‘ncdf.tools’:
* checking DESCRIPTION meta-information ... OK
* excluding invalid files
Subdirectory 'R' contains invalid file names:
  ‘.project’
* checking for LF line-endings in source and make files
* checking for empty or unneeded directories
* building ‘ncdf.tools_0.5.1.200.tar.gz’

Updating HTML index of packages in '.Library'
Making packages.html  ... done
* installing *source* package ‘ncdf.tools’ ...
** R
** inst
** preparing package for lazy loading
** help
*** installing help indices
** building package indices
** installing vignettes
** testing if installed package can be loaded

* DONE (ncdf.tools)

Attaching package: ‘ncdf.tools’

The following object(s) are masked from ‘package:jannis.misc’:

    call.args2string, compile.sysinfo, extract.datacube, ind.datacube

> BuildPackage('jannis.misc')
Read 10 items
* checking for file ‘jannis.misc/DESCRIPTION’ ... OK
* preparing ‘jannis.misc’:
* checking DESCRIPTION meta-information ... OK
* checking for LF line-endings in source and make files
* checking for empty or unneeded directories
* building ‘jannis.misc_0.5.1.267.tar.gz’

Updating HTML index of packages in '.Library'
Making packages.html  ... done
* installing *source* package ‘jannis.misc’ ...
** R
** inst
** preparing package for lazy loading
** help
*** installing help indices
** building package indices
** installing vignettes
** testing if installed package can be loaded

* DONE (jannis.misc)

Attaching package: ‘jannis.misc’

The following object(s) are masked from ‘package:ncdf.tools’:

    call.args2string, compile.sysinfo, extract.datacube, ind.datacube

The following object(s) are masked from ‘package:spectral.methods’:

    add.axis, AttachList, MEF, RMSE, status.report

> BuildPackage('spectral.methods')
Read 10 items
* checking for file ‘spectral.methods/DESCRIPTION’ ... OK
* preparing ‘spectral.methods’:
* checking DESCRIPTION meta-information ... OK
* checking for LF line-endings in source and make files
* checking for empty or unneeded directories
* building ‘spectral.methods_0.5.1.264.tar.gz’

Updating HTML index of packages in '.Library'
Making packages.html  ... done
* installing *source* package ‘spectral.methods’ ...
** R
** preparing package for lazy loading
** help
*** installing help indices
** building package indices
** testing if installed package can be loaded

* DONE (spectral.methods)

Attaching package: ‘spectral.methods’

The following object(s) are masked from ‘package:jannis.misc’:

    add.axis, AttachList, MEF, RMSE, status.report

> load('//Net/Groups/C-Side/MDI/tmp/jbuttlar/Cluster_jobs_debugging/_data/DataStructureMDI/workingData/CMIP5/Data/CanESM2/pr/error_debug_pr_OImon_CanESM2_esmFdbk1_r1i1p1_185001-198912.nc.rda')
> debugger(get(ls()))
Message:  Error in DecomposeNcdf(borders.wl = list(c = c(361, Inf), a = c(11, 13 : 
  No series/slices available for filling. Most probably only totally gappy and totally gap-free slices/series exist.
Calls: source ... withVisible -> eval -> eval -> do.call -> DecomposeNcdf
Available environments had calls:
1: source("Skripte/Utils/Specdecomp/2_calculation.R", local = TRUE)
2: withVisible(eval(ei, envir))
3: eval(ei, envir)
4: eval(expr, envir, enclos)
5: do.call(paste(algorithm.type, "Ncdf", sep = ""), call.args)
6: DecomposeNcdf(borders.wl = list(c = c(361, Inf), a = c(11, 13), b = c(13, 3
7: stop(paste("No series/slices available for filling. Most probably only", " 
8: dump.frames.mod(file.name = file.name, file.results = file.results)

Enter an environment number, or 0 to exit  Selection: 6
Browsing in the environment with call:
   DecomposeNcdf(borders.wl = list(c = c(361, Inf), a = c(11, 13), b = c(13, 3
Called from: debugger.look(ind)
Browse[1]> Available environments had calls:
1: source("Skripte/Utils/Specdecomp/2_calculation.R", local = TRUE)
2: withVisible(eval(ei, envir))
3: eval(ei, envir)
4: eval(expr, envir, enclos)
5: do.call(paste(algorithm.type, "Ncdf", sep = ""), call.args)
6: DecomposeNcdf(borders.wl = list(c = c(361, Inf), a = c(11, 13), b = c(13, 3
7: stop(paste("No series/slices available for filling. Most probably only", " 
8: dump.frames.mod(file.name = file.name, file.results = file.results)

Enter an environment number, or 0 to exit  Selection: 
Selection: 6
Browsing in the environment with call:
   DecomposeNcdf(borders.wl = list(c = c(361, Inf), a = c(11, 13), b = c(13, 3
Called from: debugger.look(ind)
Browse[1]> ls()
 [1] "amnt.na"             "args.call"           "args.call.filecheck"
 [4] "args.call.global"    "borders.low"         "borders.up"         
 [7] "borders.wl"          "calc.parallel"       "center.series"      
[10] "check.files"         "data.all"            "debugging"          
[13] "dim.name"            "dim.process.id"      "dims.cycle.id"      
[16] "dims.cycle.length"   "dims.cycle.n"        "dims.cycle.name"    
[19] "dims.ids.data"       "dims.info"           "dim.values"         
[22] "file.con.copy"       "file.con.orig"       "file.name"          
[25] "file.name.copy"      "fun.constant"        "fun.na"             
[28] "fun.zero"            "harmonics"           "M"                  
[31] "max.cores"           "n.bands"             "n.comp"             
[34] "n.steps"             "n.timesteps"         "package.parallel"   
[37] "pad.series"          "print.status"        "ratio.const"        
[40] "repeat.extr"         "res.check"           "slices.constant"    
[43] "slices.empty"        "slices.gappy"        "slices.process"     
[46] "slices.valid"        "slices.zero"         "tresh.const"        
[49] "var.name"           
Browse[1]> Q
> BuildPackage('ncdf.tools')
Read 10 items
* checking for file ‘ncdf.tools/DESCRIPTION’ ... OK
* preparing ‘ncdf.tools’:
* checking DESCRIPTION meta-information ... OK
* excluding invalid files
Subdirectory 'R' contains invalid file names:
  ‘.project’
* checking for LF line-endings in source and make files
* checking for empty or unneeded directories
* building ‘ncdf.tools_0.5.1.200.tar.gz’

Updating HTML index of packages in '.Library'
Making packages.html  ... done
* installing *source* package ‘ncdf.tools’ ...
** R
** inst
** preparing package for lazy loading
** help
*** installing help indices
** building package indices
** installing vignettes
** testing if installed package can be loaded

* DONE (ncdf.tools)

Attaching package: ‘ncdf.tools’

The following object(s) are masked from ‘package:jannis.misc’:

    call.args2string, compile.sysinfo, extract.datacube, ind.datacube

> debugger(get(ls()))
Message:  Error in DecomposeNcdf(borders.wl = list(c = c(361, Inf), a = c(11, 13 : 
  No series/slices available for filling. Most probably only totally gappy and totally gap-free slices/series exist.
Calls: source ... withVisible -> eval -> eval -> do.call -> DecomposeNcdf
Available environments had calls:
1: source("Skripte/Utils/Specdecomp/2_calculation.R", local = TRUE)
2: withVisible(eval(ei, envir))
3: eval(ei, envir)
4: eval(expr, envir, enclos)
5: do.call(paste(algorithm.type, "Ncdf", sep = ""), call.args)
6: DecomposeNcdf(borders.wl = list(c = c(361, Inf), a = c(11, 13), b = c(13, 3
7: stop(paste("No series/slices available for filling. Most probably only", " 
8: dump.frames.mod(file.name = file.name, file.results = file.results)

Enter an environment number, or 0 to exit  Selection: 6
Browsing in the environment with call:
   DecomposeNcdf(borders.wl = list(c = c(361, Inf), a = c(11, 13), b = c(13, 3
Called from: debugger.look(ind)
Browse[1]> Available environments had calls:
1: source("Skripte/Utils/Specdecomp/2_calculation.R", local = TRUE)
2: withVisible(eval(ei, envir))
3: eval(ei, envir)
4: eval(expr, envir, enclos)
5: do.call(paste(algorithm.type, "Ncdf", sep = ""), call.args)
6: DecomposeNcdf(borders.wl = list(c = c(361, Inf), a = c(11, 13), b = c(13, 3
7: stop(paste("No series/slices available for filling. Most probably only", " 
8: dump.frames.mod(file.name = file.name, file.results = file.results)

Enter an environment number, or 0 to exit  Selection: 
Selection: 6
Browsing in the environment with call:
   DecomposeNcdf(borders.wl = list(c = c(361, Inf), a = c(11, 13), b = c(13, 3
Called from: debugger.look(ind)
Browse[1]> ls()
 [1] "amnt.na"             "args.call"           "args.call.filecheck"
 [4] "args.call.global"    "borders.low"         "borders.up"         
 [7] "borders.wl"          "calc.parallel"       "center.series"      
[10] "check.files"         "data.all"            "debugging"          
[13] "dim.name"            "dim.process.id"      "dims.cycle.id"      
[16] "dims.cycle.length"   "dims.cycle.n"        "dims.cycle.name"    
[19] "dims.ids.data"       "dims.info"           "dim.values"         
[22] "file.con.copy"       "file.con.orig"       "file.name"          
[25] "file.name.copy"      "fun.constant"        "fun.na"             
[28] "fun.zero"            "harmonics"           "M"                  
[31] "max.cores"           "n.bands"             "n.comp"             
[34] "n.steps"             "n.timesteps"         "package.parallel"   
[37] "pad.series"          "print.status"        "ratio.const"        
[40] "repeat.extr"         "res.check"           "slices.constant"    
[43] "slices.empty"        "slices.gappy"        "slices.process"     
[46] "slices.valid"        "slices.zero"         "tresh.const"        
[49] "var.name"           
Browse[1]> slices.process
   [1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  [13] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  [25] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  [37] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  [49] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  [61] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  [73] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  [85] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  [97] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [109] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [121] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [133] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [145] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [157] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [169] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [181] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [193] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [205] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [217] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [229] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [241] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [253] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [265] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [277] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [289] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [301] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [313] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [325] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [337] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [349] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [361] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [373] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [385] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [397] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [409] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [421] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [433] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [445] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [457] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [469] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [481] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [493] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [505] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [517] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [529] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [541] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [553] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [565] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [577] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [589] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [601] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [613] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [625] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [637] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [649] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [661] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [673] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [685] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [697] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [709] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [721] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [733] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [745] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [757] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [769] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [781] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [793] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [805] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [817] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [829] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [841] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [853] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [865] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [877] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [889] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [901] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [913] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [925] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [937] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [949] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [961] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [973] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [985] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [997] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1009] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1021] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1033] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1045] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1057] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1069] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1081] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1093] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1105] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1117] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1129] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1141] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1153] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1165] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1177] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1189] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1201] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1213] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1225] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1237] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1249] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1261] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1273] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1285] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1297] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1309] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1321] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1333] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1345] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1357] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1369] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1381] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1393] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1405] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1417] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1429] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1441] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1453] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1465] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1477] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1489] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1501] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1513] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1525] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1537] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1549] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1561] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1573] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1585] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1597] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1609] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1621] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1633] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1645] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1657] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1669] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1681] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1693] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1705] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1717] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1729] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1741] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1753] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1765] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1777] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1789] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1801] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1813] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1825] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1837] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1849] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1861] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1873] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1885] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1897] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1909] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1921] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1933] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1945] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1957] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1969] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1981] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[1993] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2005] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2017] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2029] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2041] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2053] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2065] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2077] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2089] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2101] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2113] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2125] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2137] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2149] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2161] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2173] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2185] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2197] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2209] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2221] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2233] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2245] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2257] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2269] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2281] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2293] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2305] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2317] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2329] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2341] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2353] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2365] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2377] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2389] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2401] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2413] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2425] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2437] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2449] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2461] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2473] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2485] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2497] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2509] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2521] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2533] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2545] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2557] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2569] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2581] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2593] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2605] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2617] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2629] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2641] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2653] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2665] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2677] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2689] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2701] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2713] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2725] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2737] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2749] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2761] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2773] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2785] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2797] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2809] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2821] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2833] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2845] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2857] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2869] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2881] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2893] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2905] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2917] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2929] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2941] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2953] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2965] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2977] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[2989] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3001] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3013] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3025] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3037] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3049] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3061] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3073] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3085] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3097] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3109] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3121] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3133] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3145] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3157] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3169] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3181] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3193] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3205] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3217] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3229] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3241] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3253] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3265] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3277] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3289] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3301] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3313] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3325] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3337] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3349] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3361] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3373] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3385] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3397] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3409] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3421] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3433] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3445] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3457] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3469] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3481] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3493] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3505] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3517] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3529] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3541] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3553] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3565] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3577] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3589] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3601] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3613] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3625] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3637] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3649] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3661] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3673] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3685] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3697] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3709] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3721] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3733] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3745] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3757] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3769] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3781] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3793] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3805] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3817] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3829] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3841] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3853] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3865] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3877] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3889] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3901] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3913] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3925] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3937] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3949] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3961] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3973] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3985] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[3997] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4009] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4021] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4033] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4045] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4057] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4069] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4081] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4093] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4105] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4117] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4129] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4141] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4153] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4165] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4177] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4189] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4201] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4213] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4225] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4237] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4249] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4261] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4273] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4285] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4297] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4309] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4321] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4333] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4345] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4357] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4369] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4381] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4393] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4405] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4417] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4429] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4441] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4453] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4465] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4477] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4489] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4501] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4513] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4525] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4537] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4549] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4561] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4573] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4585] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4597] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4609] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4621] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4633] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4645] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4657] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4669] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4681] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4693] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4705] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4717] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4729] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4741] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4753] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4765] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4777] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4789] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4801] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4813] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4825] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4837] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4849] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4861] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4873] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4885] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4897] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4909] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4921] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4933] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4945] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4957] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4969] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4981] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[4993] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5005] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5017] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5029] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5041] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5053] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5065] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5077] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5089] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5101] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5113] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5125] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5137] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5149] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5161] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5173] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5185] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5197] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5209] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5221] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5233] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5245] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5257] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5269] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5281] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5293] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5305] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5317] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5329] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5341] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5353] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5365] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5377] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5389] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5401] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5413] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5425] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5437] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5449] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5461] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5473] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5485] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5497] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5509] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5521] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5533] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5545] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5557] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5569] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5581] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5593] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5605] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5617] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5629] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5641] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5653] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5665] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5677] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5689] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5701] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5713] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5725] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5737] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5749] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5761] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5773] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5785] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5797] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5809] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5821] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5833] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5845] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5857] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5869] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5881] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5893] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5905] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5917] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5929] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5941] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5953] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5965] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5977] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[5989] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6001] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6013] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6025] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6037] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6049] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6061] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6073] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6085] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6097] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6109] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6121] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6133] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6145] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6157] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6169] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6181] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6193] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6205] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6217] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6229] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6241] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6253] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6265] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6277] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6289] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6301] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6313] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6325] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6337] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6349] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6361] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6373] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6385] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6397] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6409] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6421] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6433] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6445] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6457] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6469] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6481] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6493] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6505] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6517] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6529] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6541] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6553] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6565] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6577] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6589] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6601] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6613] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6625] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6637] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6649] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6661] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6673] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6685] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6697] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6709] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6721] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6733] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6745] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6757] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6769] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6781] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6793] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6805] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6817] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6829] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6841] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6853] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6865] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6877] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6889] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6901] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6913] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6925] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6937] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6949] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6961] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6973] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6985] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[6997] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7009] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7021] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7033] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7045] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7057] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7069] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7081] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7093] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7105] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7117] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7129] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7141] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7153] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7165] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7177] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7189] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7201] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7213] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7225] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7237] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7249] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7261] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7273] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7285] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7297] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7309] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7321] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7333] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7345] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7357] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7369] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7381] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7393] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7405] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7417] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7429] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7441] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7453] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7465] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7477] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7489] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7501] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7513] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7525] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7537] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7549] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7561] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7573] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7585] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7597] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7609] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7621] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7633] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7645] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7657] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7669] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7681] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7693] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7705] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7717] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7729] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7741] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7753] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7765] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7777] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7789] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7801] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7813] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7825] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7837] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7849] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7861] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7873] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7885] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7897] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7909] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7921] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7933] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7945] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7957] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7969] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7981] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[7993] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[8005] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[8017] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[8029] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[8041] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[8053] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[8065] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[8077] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[8089] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[8101] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[8113] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[8125] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[8137] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[8149] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[8161] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[8173] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[8185] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
Browse[1]> amnt.na
       [,1] [,2] [,3] [,4]         [,5]        [,6]        [,7]        [,8]
  [1,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 0.096428571
  [2,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 0.104166667
  [3,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 0.117261905
  [4,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 0.127380952
  [5,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 0.129761905
  [6,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 0.139285714
  [7,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 0.151785714
  [8,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 0.168452381
  [9,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 0.176785714
 [10,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 0.188095238
 [11,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 0.186309524
 [12,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 0.185119048
 [13,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 0.192261905
 [14,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 0.199404762
 [15,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 1.000000000
 [16,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 1.000000000
 [17,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 1.000000000
 [18,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 1.000000000
 [19,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 1.000000000
 [20,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 1.000000000
 [21,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 1.000000000
 [22,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 1.000000000
 [23,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 1.000000000
 [24,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 1.000000000
 [25,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 1.000000000
 [26,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 0.043452381
 [27,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 0.106547619
 [28,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 0.175595238
 [29,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 1.000000000
 [30,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 1.000000000
 [31,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 1.000000000
 [32,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 1.000000000
 [33,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 1.000000000
 [34,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 1.000000000
 [35,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 1.000000000
 [36,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 1.000000000
 [37,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 1.000000000
 [38,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 1.000000000
 [39,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 1.000000000
 [40,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 1.000000000
 [41,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 1.000000000
 [42,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 1.000000000
 [43,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 1.000000000
 [44,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 1.000000000
 [45,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 1.000000000
 [46,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 1.000000000
 [47,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 1.000000000
 [48,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 1.000000000
 [49,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 1.000000000
 [50,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 1.000000000
 [51,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 1.000000000
 [52,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 1.000000000
 [53,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 1.000000000
 [54,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 1.000000000
 [55,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 1.000000000
 [56,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 0.001190476
 [57,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 0.028571429
 [58,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 0.078571429
 [59,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 0.100595238
 [60,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 0.102380952
 [61,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 0.087500000
 [62,]    1    1    1    1 0.1178571429 0.030952381 0.007142857 0.061309524
 [63,]    1    1    1    1 0.0857142857 0.047619048 0.034523810 0.126190476
 [64,]    1    1    1    1 0.0625000000 0.054761905 0.071428571 0.184523810
 [65,]    1    1    1    1 0.0375000000 0.065476190 0.110119048 0.226190476
 [66,]    1    1    1    1 0.0273809524 0.075000000 0.145833333 0.258333333
 [67,]    1    1    1    1 0.0244047619 0.080357143 0.172023810 0.281547619
 [68,]    1    1    1    1 0.0255952381 0.093452381 0.194047619 0.306547619
 [69,]    1    1    1    1 0.0321428571 0.104166667 0.219642857 0.328571429
 [70,]    1    1    1    1 0.0434523810 0.113095238 0.241666667 0.341666667
 [71,]    1    1    1    1 0.0553571429 0.119642857 0.253571429 0.355357143
 [72,]    1    1    1    1 0.0726190476 0.128571429 0.263690476 0.372023810
 [73,]    1    1    1    1 0.0940476190 0.138690476 0.275000000 0.394642857
 [74,]    1    1    1    1 0.1190476190 0.152380952 0.292261905 0.407738095
 [75,]    1    1    1    1 1.0000000000 0.171428571 0.307142857 0.425595238
 [76,]    1    1    1    1 1.0000000000 0.198214286 0.323809524 0.442857143
 [77,]    1    1    1    1 1.0000000000 0.211309524 0.330952381 0.464880952
 [78,]    1    1    1    1 1.0000000000 0.223214286 0.338690476 0.480357143
 [79,]    1    1    1    1 1.0000000000 0.230357143 0.342261905 0.491071429
 [80,]    1    1    1    1 1.0000000000 0.256547619 0.333928571 0.497619048
 [81,]    1    1    1    1 1.0000000000 1.000000000 0.325595238 0.510119048
 [82,]    1    1    1    1 1.0000000000 1.000000000 0.316071429 0.510119048
 [83,]    1    1    1    1 1.0000000000 1.000000000 0.311904762 0.514285714
 [84,]    1    1    1    1 1.0000000000 1.000000000 0.314880952 0.517261905
 [85,]    1    1    1    1 1.0000000000 1.000000000 0.305952381 0.522619048
 [86,]    1    1    1    1 1.0000000000 1.000000000 0.300595238 0.523809524
 [87,]    1    1    1    1 1.0000000000 1.000000000 0.275000000 0.517857143
 [88,]    1    1    1    1 1.0000000000 0.035714286 0.228571429 0.495833333
 [89,]    1    1    1    1 1.0000000000 0.169047619 0.273809524 0.495238095
 [90,]    1    1    1    1 1.0000000000 0.233333333 0.308333333 0.501785714
 [91,]    1    1    1    1 1.0000000000 0.260119048 0.321428571 0.501785714
 [92,]    1    1    1    1 1.0000000000 0.285714286 0.316071429 0.502380952
 [93,]    1    1    1    1 1.0000000000 1.000000000 0.300595238 0.501190476
 [94,]    1    1    1    1 1.0000000000 1.000000000 0.283333333 0.493452381
 [95,]    1    1    1    1 1.0000000000 1.000000000 0.270833333 0.477976190
 [96,]    1    1    1    1 1.0000000000 1.000000000 0.269047619 0.455952381
 [97,]    1    1    1    1 1.0000000000 1.000000000 0.272619048 0.444047619
 [98,]    1    1    1    1 1.0000000000 1.000000000 0.277976190 0.432142857
 [99,]    1    1    1    1 1.0000000000 1.000000000 0.280952381 0.422619048
[100,]    1    1    1    1 1.0000000000 1.000000000 0.272023810 0.407142857
[101,]    1    1    1    1 1.0000000000 1.000000000 0.282142857 0.384523810
[102,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 0.366071429
[103,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 0.335119048
[104,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 0.320238095
[105,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 1.000000000
[106,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 1.000000000
[107,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 0.068452381
[108,]    1    1    1    1 1.0000000000 0.002976190 0.005952381 0.038690476
[109,]    1    1    1    1 1.0000000000 0.004166667 0.007738095 0.054761905
[110,]    1    1    1    1 1.0000000000 0.004166667 0.008928571 0.086309524
[111,]    1    1    1    1 1.0000000000 0.002976190 0.011309524 0.101785714
[112,]    1    1    1    1 1.0000000000 0.002976190 0.014285714 0.118452381
[113,]    1    1    1    1 1.0000000000 0.001785714 0.016666667 0.123809524
[114,]    1    1    1    1 0.0011904762 0.001785714 0.016666667 0.117857143
[115,]    1    1    1    1 0.0005952381 0.002380952 0.018452381 0.109523810
[116,]    1    1    1    1 0.0005952381 0.004166667 0.019642857 0.098809524
[117,]    1    1    1    1 0.0017857143 0.008928571 0.021428571 0.088690476
[118,]    1    1    1    1 1.0000000000 0.016666667 0.020238095 0.077380952
[119,]    1    1    1    1 1.0000000000 0.022619048 0.020833333 0.065476190
[120,]    1    1    1    1 1.0000000000 0.032738095 0.022023810 0.058333333
[121,]    1    1    1    1 1.0000000000 1.000000000 0.023214286 0.051190476
[122,]    1    1    1    1 1.0000000000 1.000000000 0.030952381 0.045238095
[123,]    1    1    1    1 1.0000000000 1.000000000 0.034523810 0.038690476
[124,]    1    1    1    1 1.0000000000 1.000000000 0.055952381 0.039880952
[125,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 0.047619048
[126,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 0.055952381
[127,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 0.069047619
[128,]    1    1    1    1 1.0000000000 1.000000000 1.000000000 0.083928571
             [,9]     [,10]     [,11]     [,12]     [,13]     [,14] [,15] [,16]
  [1,] 0.25952381 0.3851190 0.4809524 0.6166667 0.8434524 1.0000000     1     1
  [2,] 0.27380952 0.4000000 0.4940476 0.6279762 0.8702381 1.0000000     1     1
  [3,] 0.28750000 0.4226190 0.5065476 0.6398810 0.8958333 1.0000000     1     1
  [4,] 0.29821429 0.4309524 0.5220238 0.6577381 0.9136905 1.0000000     1     1
  [5,] 0.29940476 0.4386905 0.5345238 0.6761905 0.9279762 1.0000000     1     1
  [6,] 0.30119048 0.4440476 0.5517857 0.7077381 0.9434524 1.0000000     1     1
  [7,] 0.30416667 0.4500000 0.5654762 0.7380952 0.9601190 1.0000000     1     1
  [8,] 0.30892857 0.4571429 0.5833333 0.7767857 0.9803571 1.0000000     1     1
  [9,] 0.30297619 0.4577381 0.6005952 0.8166667 0.9934524 1.0000000     1     1
 [10,] 0.29761905 0.4613095 0.6238095 0.8511905 0.9976190 1.0000000     1     1
 [11,] 0.27380952 0.4571429 0.6422619 0.8755952 0.9976190 1.0000000     1     1
 [12,] 0.23928571 0.4494048 0.6458333 0.8946429 0.9994048 1.0000000     1     1
 [13,] 0.18392857 0.4285714 0.6422619 0.8982143 1.0000000 1.0000000     1     1
 [14,] 0.14523810 0.4053571 0.6279762 0.8898810 1.0000000 1.0000000     1     1
 [15,] 0.12738095 0.3934524 0.6119048 0.8630952 1.0000000 1.0000000     1     1
 [16,] 0.11964286 0.3958333 0.6071429 0.8434524 0.9988095 1.0000000     1     1
 [17,] 0.11607143 0.3994048 0.6095238 0.8375000 0.9988095 1.0000000     1     1
 [18,] 0.11428571 0.4065476 0.6214286 0.8428571 0.9964286 1.0000000     1     1
 [19,] 0.11488095 0.4071429 0.6303571 0.8494048 0.9964286 1.0000000     1     1
 [20,] 0.11369048 0.4011905 0.6380952 0.8565476 0.9952381 1.0000000     1     1
 [21,] 0.11190476 0.3910714 0.6357143 0.8505952 0.9916667 1.0000000     1     1
 [22,] 0.10952381 0.3714286 0.6244048 0.8404762 0.9851190 1.0000000     1     1
 [23,] 0.10297619 0.3494048 0.6023810 0.8285714 0.9720238 1.0000000     1     1
 [24,] 0.09345238 0.3339286 0.5773810 0.8053571 0.9559524 1.0000000     1     1
 [25,] 0.08750000 0.3107143 0.5511905 0.7910714 0.9333333 0.9988095     1     1
 [26,] 0.07678571 0.2934524 0.5244048 0.7642857 0.9130952 0.9928571     1     1
 [27,] 0.10357143 0.3053571 0.4934524 0.7232143 0.8845238 0.9892857     1     1
 [28,] 0.10178571 0.3035714 0.4732143 0.6785714 0.8529762 0.9910714     1     1
 [29,] 0.10297619 0.2976190 0.4583333 0.6625000 0.8642857 0.9988095     1     1
 [30,] 0.12023810 0.2994048 0.4517857 0.6886905 0.9494048 1.0000000     1     1
 [31,] 0.13750000 0.3142857 0.4577381 0.7380952 0.9982143 1.0000000     1     1
 [32,] 0.16190476 0.3422619 0.4863095 0.7940476 0.9994048 1.0000000     1     1
 [33,] 0.18392857 0.3767857 0.5309524 0.8464286 1.0000000 1.0000000     1     1
 [34,] 0.19821429 0.4101190 0.5821429 0.8982143 1.0000000 1.0000000     1     1
 [35,] 0.20714286 0.4339286 0.6380952 0.9375000 1.0000000 1.0000000     1     1
 [36,] 0.21428571 0.4511905 0.6988095 0.9678571 1.0000000 1.0000000     1     1
 [37,] 0.21428571 0.4577381 0.7541667 0.9886905 1.0000000 1.0000000     1     1
 [38,] 0.23750000 0.4708333 0.8077381 0.9958333 1.0000000 1.0000000     1     1
 [39,] 0.25297619 0.4904762 0.8482143 0.9994048 1.0000000 1.0000000     1     1
 [40,] 0.26309524 0.5160714 0.8779762 1.0000000 1.0000000 1.0000000     1     1
 [41,] 0.26785714 0.5434524 0.8952381 1.0000000 1.0000000 1.0000000     1     1
 [42,] 0.26726190 0.5642857 0.9107143 1.0000000 1.0000000 1.0000000     1     1
 [43,] 0.26964286 0.5797619 0.9255952 1.0000000 1.0000000 1.0000000     1     1
 [44,] 0.28392857 0.5886905 0.9410714 1.0000000 1.0000000 1.0000000     1     1
 [45,] 0.30238095 0.6065476 0.9511905 1.0000000 1.0000000 1.0000000     1     1
 [46,] 0.30714286 0.6291667 0.9678571 1.0000000 1.0000000 1.0000000     1     1
 [47,] 0.30059524 0.6541667 0.9779762 1.0000000 1.0000000 1.0000000     1     1
 [48,] 0.28750000 0.6744048 0.9839286 1.0000000 1.0000000 1.0000000     1     1
 [49,] 0.27797619 0.6821429 0.9880952 1.0000000 1.0000000 1.0000000     1     1
 [50,] 0.27559524 0.6708333 0.9904762 1.0000000 1.0000000 1.0000000     1     1
 [51,] 0.27857143 0.6309524 0.9904762 1.0000000 1.0000000 1.0000000     1     1
 [52,] 0.27857143 0.5773810 0.9851190 1.0000000 1.0000000 1.0000000     1     1
 [53,] 0.26726190 0.5369048 0.9750000 1.0000000 1.0000000 1.0000000     1     1
 [54,] 0.24583333 0.4952381 0.9577381 1.0000000 1.0000000 1.0000000     1     1
 [55,] 0.21011905 0.4696429 0.9452381 1.0000000 1.0000000 1.0000000     1     1
 [56,] 0.14821429 0.4410714 0.9297619 1.0000000 1.0000000 1.0000000     1     1
 [57,] 0.23095238 0.4714286 0.9029762 1.0000000 1.0000000 1.0000000     1     1
 [58,] 0.26607143 0.5184524 0.9077381 1.0000000 1.0000000 1.0000000     1     1
 [59,] 0.28988095 0.5750000 0.9517857 1.0000000 1.0000000 1.0000000     1     1
 [60,] 0.30000000 0.6101190 0.9767857 1.0000000 1.0000000 1.0000000     1     1
 [61,] 0.30119048 0.6261905 0.9779762 1.0000000 1.0000000 1.0000000     1     1
 [62,] 0.29464286 0.6309524 0.9702381 1.0000000 1.0000000 1.0000000     1     1
 [63,] 0.31607143 0.6380952 0.9678571 1.0000000 1.0000000 1.0000000     1     1
 [64,] 0.34702381 0.6482143 0.9702381 1.0000000 1.0000000 1.0000000     1     1
 [65,] 0.37261905 0.6601190 0.9761905 1.0000000 1.0000000 1.0000000     1     1
 [66,] 0.40059524 0.6744048 0.9785714 1.0000000 1.0000000 1.0000000     1     1
 [67,] 0.42142857 0.6803571 0.9785714 1.0000000 1.0000000 1.0000000     1     1
 [68,] 0.44583333 0.6880952 0.9767857 1.0000000 1.0000000 1.0000000     1     1
 [69,] 0.46785714 0.6964286 0.9755952 1.0000000 1.0000000 1.0000000     1     1
 [70,] 0.48988095 0.7113095 0.9750000 1.0000000 1.0000000 1.0000000     1     1
 [71,] 0.50119048 0.7232143 0.9744048 1.0000000 1.0000000 1.0000000     1     1
 [72,] 0.52083333 0.7267857 0.9690476 1.0000000 1.0000000 1.0000000     1     1
 [73,] 0.53571429 0.7351190 0.9595238 1.0000000 1.0000000 1.0000000     1     1
 [74,] 0.55119048 0.7410714 0.9369048 1.0000000 1.0000000 1.0000000     1     1
 [75,] 0.57083333 0.7595238 0.9273810 1.0000000 1.0000000 1.0000000     1     1
 [76,] 0.59047619 0.7898810 0.9351190 1.0000000 1.0000000 1.0000000     1     1
 [77,] 0.61250000 0.8232143 0.9535714 1.0000000 1.0000000 1.0000000     1     1
 [78,] 0.63988095 0.8511905 0.9720238 1.0000000 1.0000000 1.0000000     1     1
 [79,] 0.66845238 0.8684524 0.9827381 1.0000000 1.0000000 1.0000000     1     1
 [80,] 0.68809524 0.8916667 0.9934524 1.0000000 1.0000000 1.0000000     1     1
 [81,] 0.70773810 0.9077381 0.9976190 1.0000000 1.0000000 1.0000000     1     1
 [82,] 0.73154762 0.9285714 1.0000000 1.0000000 1.0000000 1.0000000     1     1
 [83,] 0.74821429 0.9505952 1.0000000 1.0000000 1.0000000 1.0000000     1     1
 [84,] 0.76190476 0.9607143 1.0000000 1.0000000 1.0000000 1.0000000     1     1
 [85,] 0.77380952 0.9690476 1.0000000 1.0000000 1.0000000 1.0000000     1     1
 [86,] 0.78452381 0.9773810 1.0000000 1.0000000 1.0000000 1.0000000     1     1
 [87,] 0.80119048 0.9904762 1.0000000 1.0000000 1.0000000 1.0000000     1     1
 [88,] 0.80476190 0.9964286 1.0000000 1.0000000 1.0000000 1.0000000     1     1
 [89,] 0.80595238 0.9970238 1.0000000 1.0000000 1.0000000 1.0000000     1     1
 [90,] 0.80595238 0.9988095 1.0000000 1.0000000 1.0000000 1.0000000     1     1
 [91,] 0.79821429 0.9994048 1.0000000 1.0000000 1.0000000 1.0000000     1     1
 [92,] 0.78988095 0.9964286 1.0000000 1.0000000 1.0000000 1.0000000     1     1
 [93,] 0.78035714 0.9946429 1.0000000 1.0000000 1.0000000 1.0000000     1     1
 [94,] 0.76726190 0.9946429 1.0000000 1.0000000 1.0000000 1.0000000     1     1
 [95,] 0.74940476 0.9904762 1.0000000 1.0000000 1.0000000 1.0000000     1     1
 [96,] 0.72797619 0.9839286 1.0000000 1.0000000 1.0000000 1.0000000     1     1
 [97,] 0.70714286 0.9791667 1.0000000 1.0000000 1.0000000 1.0000000     1     1
 [98,] 0.67738095 0.9720238 1.0000000 1.0000000 1.0000000 1.0000000     1     1
 [99,] 0.65357143 0.9648810 1.0000000 1.0000000 1.0000000 1.0000000     1     1
[100,] 0.61964286 0.9464286 1.0000000 1.0000000 1.0000000 1.0000000     1     1
[101,] 0.58750000 0.9220238 1.0000000 1.0000000 1.0000000 1.0000000     1     1
[102,] 0.55476190 0.8863095 1.0000000 1.0000000 1.0000000 1.0000000     1     1
[103,] 0.51726190 0.8339286 1.0000000 1.0000000 1.0000000 1.0000000     1     1
[104,] 0.48511905 0.7494048 1.0000000 1.0000000 1.0000000 1.0000000     1     1
[105,] 0.46130952 0.6625000 1.0000000 1.0000000 1.0000000 1.0000000     1     1
[106,] 1.00000000 0.7166667 0.9988095 1.0000000 1.0000000 1.0000000     1     1
[107,] 0.32559524 0.6720238 0.9940476 1.0000000 1.0000000 1.0000000     1     1
[108,] 0.28571429 0.6684524 0.9821429 1.0000000 1.0000000 1.0000000     1     1
[109,] 0.27857143 0.6642857 0.9428571 1.0000000 1.0000000 1.0000000     1     1
[110,] 0.28750000 0.5994048 0.8767857 1.0000000 1.0000000 1.0000000     1     1
[111,] 0.29107143 0.5351190 0.8083333 0.9946429 1.0000000 1.0000000     1     1
[112,] 0.29226190 0.5095238 0.7744048 0.9619048 0.9976190 0.9994048     1     1
[113,] 0.29226190 0.4886905 0.7369048 0.9160714 0.9833333 1.0000000     1     1
[114,] 0.27559524 0.4625000 0.6916667 0.8982143 0.9833333 1.0000000     1     1
[115,] 0.26488095 0.4285714 0.6285714 0.8636905 0.9803571 1.0000000     1     1
[116,] 0.25000000 0.4119048 0.5904762 0.8273810 0.9773810 1.0000000     1     1
[117,] 0.23809524 0.3916667 0.5654762 0.7767857 0.9476190 1.0000000     1     1
[118,] 0.22678571 0.3761905 0.5369048 0.7208333 0.9238095 1.0000000     1     1
[119,] 0.21547619 0.3601190 0.5136905 0.6988095 0.9279762 1.0000000     1     1
[120,] 0.20654762 0.3446429 0.4922619 0.6773810 0.9327381 1.0000000     1     1
[121,] 0.19523810 0.3309524 0.4714286 0.6630952 0.9315476 1.0000000     1     1
[122,] 0.18630952 0.3244048 0.4666667 0.6571429 0.9321429 1.0000000     1     1
[123,] 0.18273810 0.3208333 0.4595238 0.6511905 0.9357143 1.0000000     1     1
[124,] 0.18214286 0.3202381 0.4500000 0.6363095 0.9190476 1.0000000     1     1
[125,] 0.18928571 0.3279762 0.4505952 0.6232143 0.8809524 1.0000000     1     1
[126,] 0.20892857 0.3410714 0.4547619 0.6107143 0.8392857 1.0000000     1     1
[127,] 0.22023810 0.3535714 0.4565476 0.6071429 0.8005952 1.0000000     1     1
[128,] 0.23869048 0.3648810 0.4696429 0.6083333 0.8136905 1.0000000     1     1
       [,17] [,18] [,19] [,20] [,21] [,22] [,23] [,24] [,25] [,26] [,27] [,28]
  [1,]     1     1     1     1     1     1     1     1     1     1     1     1
  [2,]     1     1     1     1     1     1     1     1     1     1     1     1
  [3,]     1     1     1     1     1     1     1     1     1     1     1     1
  [4,]     1     1     1     1     1     1     1     1     1     1     1     1
  [5,]     1     1     1     1     1     1     1     1     1     1     1     1
  [6,]     1     1     1     1     1     1     1     1     1     1     1     1
  [7,]     1     1     1     1     1     1     1     1     1     1     1     1
  [8,]     1     1     1     1     1     1     1     1     1     1     1     1
  [9,]     1     1     1     1     1     1     1     1     1     1     1     1
 [10,]     1     1     1     1     1     1     1     1     1     1     1     1
 [11,]     1     1     1     1     1     1     1     1     1     1     1     1
 [12,]     1     1     1     1     1     1     1     1     1     1     1     1
 [13,]     1     1     1     1     1     1     1     1     1     1     1     1
 [14,]     1     1     1     1     1     1     1     1     1     1     1     1
 [15,]     1     1     1     1     1     1     1     1     1     1     1     1
 [16,]     1     1     1     1     1     1     1     1     1     1     1     1
 [17,]     1     1     1     1     1     1     1     1     1     1     1     1
 [18,]     1     1     1     1     1     1     1     1     1     1     1     1
 [19,]     1     1     1     1     1     1     1     1     1     1     1     1
 [20,]     1     1     1     1     1     1     1     1     1     1     1     1
 [21,]     1     1     1     1     1     1     1     1     1     1     1     1
 [22,]     1     1     1     1     1     1     1     1     1     1     1     1
 [23,]     1     1     1     1     1     1     1     1     1     1     1     1
 [24,]     1     1     1     1     1     1     1     1     1     1     1     1
 [25,]     1     1     1     1     1     1     1     1     1     1     1     1
 [26,]     1     1     1     1     1     1     1     1     1     1     1     1
 [27,]     1     1     1     1     1     1     1     1     1     1     1     1
 [28,]     1     1     1     1     1     1     1     1     1     1     1     1
 [29,]     1     1     1     1     1     1     1     1     1     1     1     1
 [30,]     1     1     1     1     1     1     1     1     1     1     1     1
 [31,]     1     1     1     1     1     1     1     1     1     1     1     1
 [32,]     1     1     1     1     1     1     1     1     1     1     1     1
 [33,]     1     1     1     1     1     1     1     1     1     1     1     1
 [34,]     1     1     1     1     1     1     1     1     1     1     1     1
 [35,]     1     1     1     1     1     1     1     1     1     1     1     1
 [36,]     1     1     1     1     1     1     1     1     1     1     1     1
 [37,]     1     1     1     1     1     1     1     1     1     1     1     1
 [38,]     1     1     1     1     1     1     1     1     1     1     1     1
 [39,]     1     1     1     1     1     1     1     1     1     1     1     1
 [40,]     1     1     1     1     1     1     1     1     1     1     1     1
 [41,]     1     1     1     1     1     1     1     1     1     1     1     1
 [42,]     1     1     1     1     1     1     1     1     1     1     1     1
 [43,]     1     1     1     1     1     1     1     1     1     1     1     1
 [44,]     1     1     1     1     1     1     1     1     1     1     1     1
 [45,]     1     1     1     1     1     1     1     1     1     1     1     1
 [46,]     1     1     1     1     1     1     1     1     1     1     1     1
 [47,]     1     1     1     1     1     1     1     1     1     1     1     1
 [48,]     1     1     1     1     1     1     1     1     1     1     1     1
 [49,]     1     1     1     1     1     1     1     1     1     1     1     1
 [50,]     1     1     1     1     1     1     1     1     1     1     1     1
 [51,]     1     1     1     1     1     1     1     1     1     1     1     1
 [52,]     1     1     1     1     1     1     1     1     1     1     1     1
 [53,]     1     1     1     1     1     1     1     1     1     1     1     1
 [54,]     1     1     1     1     1     1     1     1     1     1     1     1
 [55,]     1     1     1     1     1     1     1     1     1     1     1     1
 [56,]     1     1     1     1     1     1     1     1     1     1     1     1
 [57,]     1     1     1     1     1     1     1     1     1     1     1     1
 [58,]     1     1     1     1     1     1     1     1     1     1     1     1
 [59,]     1     1     1     1     1     1     1     1     1     1     1     1
 [60,]     1     1     1     1     1     1     1     1     1     1     1     1
 [61,]     1     1     1     1     1     1     1     1     1     1     1     1
 [62,]     1     1     1     1     1     1     1     1     1     1     1     1
 [63,]     1     1     1     1     1     1     1     1     1     1     1     1
 [64,]     1     1     1     1     1     1     1     1     1     1     1     1
 [65,]     1     1     1     1     1     1     1     1     1     1     1     1
 [66,]     1     1     1     1     1     1     1     1     1     1     1     1
 [67,]     1     1     1     1     1     1     1     1     1     1     1     1
 [68,]     1     1     1     1     1     1     1     1     1     1     1     1
 [69,]     1     1     1     1     1     1     1     1     1     1     1     1
 [70,]     1     1     1     1     1     1     1     1     1     1     1     1
 [71,]     1     1     1     1     1     1     1     1     1     1     1     1
 [72,]     1     1     1     1     1     1     1     1     1     1     1     1
 [73,]     1     1     1     1     1     1     1     1     1     1     1     1
 [74,]     1     1     1     1     1     1     1     1     1     1     1     1
 [75,]     1     1     1     1     1     1     1     1     1     1     1     1
 [76,]     1     1     1     1     1     1     1     1     1     1     1     1
 [77,]     1     1     1     1     1     1     1     1     1     1     1     1
 [78,]     1     1     1     1     1     1     1     1     1     1     1     1
 [79,]     1     1     1     1     1     1     1     1     1     1     1     1
 [80,]     1     1     1     1     1     1     1     1     1     1     1     1
 [81,]     1     1     1     1     1     1     1     1     1     1     1     1
 [82,]     1     1     1     1     1     1     1     1     1     1     1     1
 [83,]     1     1     1     1     1     1     1     1     1     1     1     1
 [84,]     1     1     1     1     1     1     1     1     1     1     1     1
 [85,]     1     1     1     1     1     1     1     1     1     1     1     1
 [86,]     1     1     1     1     1     1     1     1     1     1     1     1
 [87,]     1     1     1     1     1     1     1     1     1     1     1     1
 [88,]     1     1     1     1     1     1     1     1     1     1     1     1
 [89,]     1     1     1     1     1     1     1     1     1     1     1     1
 [90,]     1     1     1     1     1     1     1     1     1     1     1     1
 [91,]     1     1     1     1     1     1     1     1     1     1     1     1
 [92,]     1     1     1     1     1     1     1     1     1     1     1     1
 [93,]     1     1     1     1     1     1     1     1     1     1     1     1
 [94,]     1     1     1     1     1     1     1     1     1     1     1     1
 [95,]     1     1     1     1     1     1     1     1     1     1     1     1
 [96,]     1     1     1     1     1     1     1     1     1     1     1     1
 [97,]     1     1     1     1     1     1     1     1     1     1     1     1
 [98,]     1     1     1     1     1     1     1     1     1     1     1     1
 [99,]     1     1     1     1     1     1     1     1     1     1     1     1
[100,]     1     1     1     1     1     1     1     1     1     1     1     1
[101,]     1     1     1     1     1     1     1     1     1     1     1     1
[102,]     1     1     1     1     1     1     1     1     1     1     1     1
[103,]     1     1     1     1     1     1     1     1     1     1     1     1
[104,]     1     1     1     1     1     1     1     1     1     1     1     1
[105,]     1     1     1     1     1     1     1     1     1     1     1     1
[106,]     1     1     1     1     1     1     1     1     1     1     1     1
[107,]     1     1     1     1     1     1     1     1     1     1     1     1
[108,]     1     1     1     1     1     1     1     1     1     1     1     1
[109,]     1     1     1     1     1     1     1     1     1     1     1     1
[110,]     1     1     1     1     1     1     1     1     1     1     1     1
[111,]     1     1     1     1     1     1     1     1     1     1     1     1
[112,]     1     1     1     1     1     1     1     1     1     1     1     1
[113,]     1     1     1     1     1     1     1     1     1     1     1     1
[114,]     1     1     1     1     1     1     1     1     1     1     1     1
[115,]     1     1     1     1     1     1     1     1     1     1     1     1
[116,]     1     1     1     1     1     1     1     1     1     1     1     1
[117,]     1     1     1     1     1     1     1     1     1     1     1     1
[118,]     1     1     1     1     1     1     1     1     1     1     1     1
[119,]     1     1     1     1     1     1     1     1     1     1     1     1
[120,]     1     1     1     1     1     1     1     1     1     1     1     1
[121,]     1     1     1     1     1     1     1     1     1     1     1     1
[122,]     1     1     1     1     1     1     1     1     1     1     1     1
[123,]     1     1     1     1     1     1     1     1     1     1     1     1
[124,]     1     1     1     1     1     1     1     1     1     1     1     1
[125,]     1     1     1     1     1     1     1     1     1     1     1     1
[126,]     1     1     1     1     1     1     1     1     1     1     1     1
[127,]     1     1     1     1     1     1     1     1     1     1     1     1
[128,]     1     1     1     1     1     1     1     1     1     1     1     1
       [,29] [,30] [,31] [,32] [,33] [,34] [,35] [,36] [,37] [,38] [,39] [,40]
  [1,]     1     1     1     1     1     1     1     1     1     1     1     1
  [2,]     1     1     1     1     1     1     1     1     1     1     1     1
  [3,]     1     1     1     1     1     1     1     1     1     1     1     1
  [4,]     1     1     1     1     1     1     1     1     1     1     1     1
  [5,]     1     1     1     1     1     1     1     1     1     1     1     1
  [6,]     1     1     1     1     1     1     1     1     1     1     1     1
  [7,]     1     1     1     1     1     1     1     1     1     1     1     1
  [8,]     1     1     1     1     1     1     1     1     1     1     1     1
  [9,]     1     1     1     1     1     1     1     1     1     1     1     1
 [10,]     1     1     1     1     1     1     1     1     1     1     1     1
 [11,]     1     1     1     1     1     1     1     1     1     1     1     1
 [12,]     1     1     1     1     1     1     1     1     1     1     1     1
 [13,]     1     1     1     1     1     1     1     1     1     1     1     1
 [14,]     1     1     1     1     1     1     1     1     1     1     1     1
 [15,]     1     1     1     1     1     1     1     1     1     1     1     1
 [16,]     1     1     1     1     1     1     1     1     1     1     1     1
 [17,]     1     1     1     1     1     1     1     1     1     1     1     1
 [18,]     1     1     1     1     1     1     1     1     1     1     1     1
 [19,]     1     1     1     1     1     1     1     1     1     1     1     1
 [20,]     1     1     1     1     1     1     1     1     1     1     1     1
 [21,]     1     1     1     1     1     1     1     1     1     1     1     1
 [22,]     1     1     1     1     1     1     1     1     1     1     1     1
 [23,]     1     1     1     1     1     1     1     1     1     1     1     1
 [24,]     1     1     1     1     1     1     1     1     1     1     1     1
 [25,]     1     1     1     1     1     1     1     1     1     1     1     1
 [26,]     1     1     1     1     1     1     1     1     1     1     1     1
 [27,]     1     1     1     1     1     1     1     1     1     1     1     1
 [28,]     1     1     1     1     1     1     1     1     1     1     1     1
 [29,]     1     1     1     1     1     1     1     1     1     1     1     1
 [30,]     1     1     1     1     1     1     1     1     1     1     1     1
 [31,]     1     1     1     1     1     1     1     1     1     1     1     1
 [32,]     1     1     1     1     1     1     1     1     1     1     1     1
 [33,]     1     1     1     1     1     1     1     1     1     1     1     1
 [34,]     1     1     1     1     1     1     1     1     1     1     1     1
 [35,]     1     1     1     1     1     1     1     1     1     1     1     1
 [36,]     1     1     1     1     1     1     1     1     1     1     1     1
 [37,]     1     1     1     1     1     1     1     1     1     1     1     1
 [38,]     1     1     1     1     1     1     1     1     1     1     1     1
 [39,]     1     1     1     1     1     1     1     1     1     1     1     1
 [40,]     1     1     1     1     1     1     1     1     1     1     1     1
 [41,]     1     1     1     1     1     1     1     1     1     1     1     1
 [42,]     1     1     1     1     1     1     1     1     1     1     1     1
 [43,]     1     1     1     1     1     1     1     1     1     1     1     1
 [44,]     1     1     1     1     1     1     1     1     1     1     1     1
 [45,]     1     1     1     1     1     1     1     1     1     1     1     1
 [46,]     1     1     1     1     1     1     1     1     1     1     1     1
 [47,]     1     1     1     1     1     1     1     1     1     1     1     1
 [48,]     1     1     1     1     1     1     1     1     1     1     1     1
 [49,]     1     1     1     1     1     1     1     1     1     1     1     1
 [50,]     1     1     1     1     1     1     1     1     1     1     1     1
 [51,]     1     1     1     1     1     1     1     1     1     1     1     1
 [52,]     1     1     1     1     1     1     1     1     1     1     1     1
 [53,]     1     1     1     1     1     1     1     1     1     1     1     1
 [54,]     1     1     1     1     1     1     1     1     1     1     1     1
 [55,]     1     1     1     1     1     1     1     1     1     1     1     1
 [56,]     1     1     1     1     1     1     1     1     1     1     1     1
 [57,]     1     1     1     1     1     1     1     1     1     1     1     1
 [58,]     1     1     1     1     1     1     1     1     1     1     1     1
 [59,]     1     1     1     1     1     1     1     1     1     1     1     1
 [60,]     1     1     1     1     1     1     1     1     1     1     1     1
 [61,]     1     1     1     1     1     1     1     1     1     1     1     1
 [62,]     1     1     1     1     1     1     1     1     1     1     1     1
 [63,]     1     1     1     1     1     1     1     1     1     1     1     1
 [64,]     1     1     1     1     1     1     1     1     1     1     1     1
 [65,]     1     1     1     1     1     1     1     1     1     1     1     1
 [66,]     1     1     1     1     1     1     1     1     1     1     1     1
 [67,]     1     1     1     1     1     1     1     1     1     1     1     1
 [68,]     1     1     1     1     1     1     1     1     1     1     1     1
 [69,]     1     1     1     1     1     1     1     1     1     1     1     1
 [70,]     1     1     1     1     1     1     1     1     1     1     1     1
 [71,]     1     1     1     1     1     1     1     1     1     1     1     1
 [72,]     1     1     1     1     1     1     1     1     1     1     1     1
 [73,]     1     1     1     1     1     1     1     1     1     1     1     1
 [74,]     1     1     1     1     1     1     1     1     1     1     1     1
 [75,]     1     1     1     1     1     1     1     1     1     1     1     1
 [76,]     1     1     1     1     1     1     1     1     1     1     1     1
 [77,]     1     1     1     1     1     1     1     1     1     1     1     1
 [78,]     1     1     1     1     1     1     1     1     1     1     1     1
 [79,]     1     1     1     1     1     1     1     1     1     1     1     1
 [80,]     1     1     1     1     1     1     1     1     1     1     1     1
 [81,]     1     1     1     1     1     1     1     1     1     1     1     1
 [82,]     1     1     1     1     1     1     1     1     1     1     1     1
 [83,]     1     1     1     1     1     1     1     1     1     1     1     1
 [84,]     1     1     1     1     1     1     1     1     1     1     1     1
 [85,]     1     1     1     1     1     1     1     1     1     1     1     1
 [86,]     1     1     1     1     1     1     1     1     1     1     1     1
 [87,]     1     1     1     1     1     1     1     1     1     1     1     1
 [88,]     1     1     1     1     1     1     1     1     1     1     1     1
 [89,]     1     1     1     1     1     1     1     1     1     1     1     1
 [90,]     1     1     1     1     1     1     1     1     1     1     1     1
 [91,]     1     1     1     1     1     1     1     1     1     1     1     1
 [92,]     1     1     1     1     1     1     1     1     1     1     1     1
 [93,]     1     1     1     1     1     1     1     1     1     1     1     1
 [94,]     1     1     1     1     1     1     1     1     1     1     1     1
 [95,]     1     1     1     1     1     1     1     1     1     1     1     1
 [96,]     1     1     1     1     1     1     1     1     1     1     1     1
 [97,]     1     1     1     1     1     1     1     1     1     1     1     1
 [98,]     1     1     1     1     1     1     1     1     1     1     1     1
 [99,]     1     1     1     1     1     1     1     1     1     1     1     1
[100,]     1     1     1     1     1     1     1     1     1     1     1     1
[101,]     1     1     1     1     1     1     1     1     1     1     1     1
[102,]     1     1     1     1     1     1     1     1     1     1     1     1
[103,]     1     1     1     1     1     1     1     1     1     1     1     1
[104,]     1     1     1     1     1     1     1     1     1     1     1     1
[105,]     1     1     1     1     1     1     1     1     1     1     1     1
[106,]     1     1     1     1     1     1     1     1     1     1     1     1
[107,]     1     1     1     1     1     1     1     1     1     1     1     1
[108,]     1     1     1     1     1     1     1     1     1     1     1     1
[109,]     1     1     1     1     1     1     1     1     1     1     1     1
[110,]     1     1     1     1     1     1     1     1     1     1     1     1
[111,]     1     1     1     1     1     1     1     1     1     1     1     1
[112,]     1     1     1     1     1     1     1     1     1     1     1     1
[113,]     1     1     1     1     1     1     1     1     1     1     1     1
[114,]     1     1     1     1     1     1     1     1     1     1     1     1
[115,]     1     1     1     1     1     1     1     1     1     1     1     1
[116,]     1     1     1     1     1     1     1     1     1     1     1     1
[117,]     1     1     1     1     1     1     1     1     1     1     1     1
[118,]     1     1     1     1     1     1     1     1     1     1     1     1
[119,]     1     1     1     1     1     1     1     1     1     1     1     1
[120,]     1     1     1     1     1     1     1     1     1     1     1     1
[121,]     1     1     1     1     1     1     1     1     1     1     1     1
[122,]     1     1     1     1     1     1     1     1     1     1     1     1
[123,]     1     1     1     1     1     1     1     1     1     1     1     1
[124,]     1     1     1     1     1     1     1     1     1     1     1     1
[125,]     1     1     1     1     1     1     1     1     1     1     1     1
[126,]     1     1     1     1     1     1     1     1     1     1     1     1
[127,]     1     1     1     1     1     1     1     1     1     1     1     1
[128,]     1     1     1     1     1     1     1     1     1     1     1     1
       [,41] [,42] [,43] [,44] [,45] [,46] [,47] [,48]     [,49]     [,50]
  [1,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
  [2,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
  [3,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
  [4,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
  [5,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
  [6,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
  [7,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
  [8,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
  [9,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [10,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [11,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [12,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [13,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [14,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [15,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [16,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [17,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [18,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [19,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [20,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [21,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [22,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [23,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [24,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [25,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [26,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [27,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [28,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [29,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [30,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [31,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [32,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [33,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [34,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [35,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [36,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [37,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [38,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [39,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [40,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [41,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [42,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [43,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [44,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [45,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [46,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [47,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [48,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [49,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [50,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [51,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [52,]     1     1     1     1     1     1     1     1 1.0000000 0.8892857
 [53,]     1     1     1     1     1     1     1     1 1.0000000 0.8892857
 [54,]     1     1     1     1     1     1     1     1 0.9898810 0.9357143
 [55,]     1     1     1     1     1     1     1     1 1.0000000 0.9636905
 [56,]     1     1     1     1     1     1     1     1 0.9988095 0.9690476
 [57,]     1     1     1     1     1     1     1     1 0.9988095 0.9672619
 [58,]     1     1     1     1     1     1     1     1 0.9976190 0.9577381
 [59,]     1     1     1     1     1     1     1     1 1.0000000 0.9779762
 [60,]     1     1     1     1     1     1     1     1 1.0000000 0.9928571
 [61,]     1     1     1     1     1     1     1     1 1.0000000 0.9964286
 [62,]     1     1     1     1     1     1     1     1 1.0000000 0.9994048
 [63,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [64,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [65,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [66,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [67,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [68,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [69,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [70,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [71,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [72,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [73,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [74,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [75,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [76,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [77,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [78,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [79,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [80,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [81,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [82,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [83,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [84,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [85,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [86,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [87,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [88,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [89,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [90,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [91,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [92,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [93,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [94,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [95,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [96,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [97,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
 [98,]     1     1     1     1     1     1     1     1 1.0000000 0.9976190
 [99,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
[100,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
[101,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
[102,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
[103,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
[104,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
[105,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
[106,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
[107,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
[108,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
[109,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
[110,]     1     1     1     1     1     1     1     1 1.0000000 0.9773810
[111,]     1     1     1     1     1     1     1     1 1.0000000 0.9934524
[112,]     1     1     1     1     1     1     1     1 1.0000000 0.9964286
[113,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
[114,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
[115,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
[116,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
[117,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
[118,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
[119,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
[120,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
[121,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
[122,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
[123,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
[124,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
[125,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
[126,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
[127,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
[128,]     1     1     1     1     1     1     1     1 1.0000000 1.0000000
           [,51]     [,52]     [,53]     [,54]     [,55]     [,56]     [,57]
  [1,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 0.9976190
  [2,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
  [3,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
  [4,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
  [5,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
  [6,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
  [7,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
  [8,] 1.0000000 1.0000000 1.0000000 0.9922619 0.9773810 1.0000000 1.0000000
  [9,] 1.0000000 1.0000000 1.0000000 0.9904762 1.0000000 0.8875000 1.0000000
 [10,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [11,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [12,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [13,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [14,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [15,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 0.7279762
 [16,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 0.7255952
 [17,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 0.7196429
 [18,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 0.7154762
 [19,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [20,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [21,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [22,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [23,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [24,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [25,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [26,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [27,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [28,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [29,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [30,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [31,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [32,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [33,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [34,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [35,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [36,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [37,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [38,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [39,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [40,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [41,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [42,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [43,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [44,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [45,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [46,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [47,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [48,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [49,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [50,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [51,] 1.0000000 0.6369048 0.7351190 1.0000000 1.0000000 1.0000000 1.0000000
 [52,] 1.0000000 0.7601190 0.8898810 1.0000000 1.0000000 1.0000000 1.0000000
 [53,] 0.8273810 0.8470238 0.9452381 1.0000000 1.0000000 1.0000000 1.0000000
 [54,] 0.9011905 0.9142857 0.9583333 1.0000000 1.0000000 1.0000000 1.0000000
 [55,] 0.9422619 0.9547619 0.9619048 1.0000000 1.0000000 1.0000000 1.0000000
 [56,] 0.9666667 0.9916667 0.9696429 1.0000000 1.0000000 1.0000000 1.0000000
 [57,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [58,] 0.9250000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [59,] 0.9392857 0.8773810 0.8297619 1.0000000 1.0000000 1.0000000 1.0000000
 [60,] 0.9779762 0.9541667 0.9107143 1.0000000 1.0000000 1.0000000 1.0000000
 [61,] 0.9940476 0.9809524 0.9404762 0.8303571 1.0000000 1.0000000 1.0000000
 [62,] 0.9970238 0.9952381 0.9773810 0.9160714 1.0000000 1.0000000 1.0000000
 [63,] 1.0000000 0.9970238 0.9916667 0.9553571 1.0000000 1.0000000 1.0000000
 [64,] 1.0000000 0.9994048 0.9934524 0.9613095 1.0000000 1.0000000 1.0000000
 [65,] 1.0000000 1.0000000 0.9958333 0.9607143 0.8732143 1.0000000 1.0000000
 [66,] 1.0000000 1.0000000 0.9964286 0.9863095 0.9422619 1.0000000 0.4208333
 [67,] 1.0000000 1.0000000 0.9982143 0.9910714 0.9690476 1.0000000 0.4577381
 [68,] 1.0000000 1.0000000 0.9988095 0.9964286 0.9785714 1.0000000 0.5184524
 [69,] 1.0000000 1.0000000 1.0000000 0.9982143 0.9755952 0.7791667 0.6267857
 [70,] 1.0000000 1.0000000 1.0000000 0.9994048 0.9851190 1.0000000 0.6636905
 [71,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [72,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [73,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [74,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [75,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [76,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [77,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [78,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [79,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [80,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [81,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [82,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [83,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [84,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [85,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [86,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [87,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [88,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [89,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [90,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [91,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [92,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [93,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [94,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [95,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
 [96,] 1.0000000 1.0000000 0.5619048 0.5226190 1.0000000 1.0000000 1.0000000
 [97,] 1.0000000 1.0000000 0.5845238 0.5285714 0.5041667 1.0000000 1.0000000
 [98,] 1.0000000 1.0000000 0.6017857 0.5541667 0.5232143 1.0000000 0.3940476
 [99,] 1.0000000 1.0000000 0.6244048 0.5880952 0.5404762 1.0000000 1.0000000
[100,] 1.0000000 0.7017857 0.6541667 0.6107143 0.5321429 0.4625000 0.4267857
[101,] 1.0000000 0.7000000 0.6714286 0.6214286 0.5672619 0.5113095 0.4357143
[102,] 1.0000000 1.0000000 1.0000000 1.0000000 0.5845238 0.6017857 1.0000000
[103,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
[104,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000
[105,] 1.0000000 1.0000000 1.0000000 0.6934524 0.8261905 1.0000000 1.0000000
[106,] 1.0000000 1.0000000 1.0000000 0.8738095 0.8648810 1.0000000 0.3744048
[107,] 1.0000000 1.0000000 1.0000000 0.7589286 0.6083333 0.5166667 0.4107143
[108,] 1.0000000 1.0000000 0.7583333 0.6934524 0.5845238 0.5095238 0.4458333
[109,] 1.0000000 0.8285714 0.7529762 0.6827381 0.6065476 0.5595238 0.4994048
[110,] 0.8946429 0.8321429 0.7821429 0.7208333 0.6184524 1.0000000 1.0000000
[111,] 0.9339286 0.8755952 0.8410714 0.7857143 1.0000000 1.0000000 1.0000000
[112,] 0.9696429 0.9345238 0.9154762 0.8303571 1.0000000 1.0000000 1.0000000
[113,] 0.9916667 0.9726190 0.9625000 0.8791667 1.0000000 1.0000000 1.0000000
[114,] 0.9976190 0.9940476 0.9869048 0.8898810 1.0000000 1.0000000 1.0000000
[115,] 1.0000000 1.0000000 0.9964286 0.9101190 0.6535714 1.0000000 1.0000000
[116,] 1.0000000 1.0000000 1.0000000 0.9738095 0.8380952 1.0000000 1.0000000
[117,] 1.0000000 1.0000000 1.0000000 0.9988095 0.9375000 0.6738095 1.0000000
[118,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 0.9410714 1.0000000
[119,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 0.8678571 1.0000000
[120,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 0.6875000 0.4113095
[121,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 0.9309524 0.4541667
[122,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 0.9607143 0.4523810
[123,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 0.5339286
[124,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 0.6773810
[125,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 0.9994048 0.8220238
[126,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 0.9267857
[127,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 0.9732143
[128,] 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 1.0000000 0.9922619
           [,58]     [,59]     [,60]     [,61]     [,62]     [,63]     [,64]
  [1,] 0.9779762 0.9458333 0.8797619 0.4666667 0.2148810 0.1690476 0.1517857
  [2,] 0.9928571 0.9809524 0.9511905 0.5863095 0.2202381 0.1738095 0.1529762
  [3,] 0.9982143 0.9946429 0.9880952 0.7744048 0.2273810 0.1785714 0.1541667
  [4,] 1.0000000 0.9994048 0.9982143 0.8517857 0.2327381 0.1797619 0.1547619
  [5,] 1.0000000 1.0000000 1.0000000 0.8833333 0.2464286 0.1863095 0.1571429
  [6,] 1.0000000 1.0000000 1.0000000 1.0000000 0.2517857 0.1910714 0.1571429
  [7,] 1.0000000 1.0000000 0.9940476 1.0000000 0.2541667 0.1946429 0.1571429
  [8,] 1.0000000 0.9988095 0.9666667 1.0000000 0.2583333 0.1994048 0.1571429
  [9,] 1.0000000 0.9922619 0.9047619 1.0000000 0.2625000 0.2023810 0.1559524
 [10,] 1.0000000 0.9702381 0.8303571 0.3970238 0.2672619 0.2035714 0.1595238
 [11,] 1.0000000 0.9476190 0.8130952 0.4339286 0.2690476 0.2047619 0.1595238
 [12,] 0.9142857 0.9178571 0.8023810 0.4666667 0.2708333 0.2059524 0.1601190
 [13,] 0.8761905 0.8779762 0.7851190 0.4964286 0.2714286 0.2089286 0.1619048
 [14,] 0.8386905 0.8351190 0.7583333 0.5136905 0.2708333 0.2113095 0.1613095
 [15,] 0.7809524 0.7994048 0.7232143 0.5178571 0.2744048 0.2089286 0.1613095
 [16,] 0.7273810 0.7517857 0.6910714 0.5184524 0.2732143 0.2071429 0.1595238
 [17,] 0.6982143 0.6964286 0.6517857 0.5095238 0.2696429 0.2065476 0.1589286
 [18,] 0.6714286 0.6505952 0.6178571 0.4940476 0.2720238 0.2065476 0.1589286
 [19,] 0.6541667 0.6178571 0.5773810 0.4702381 0.2726190 0.2053571 0.1577381
 [20,] 1.0000000 0.6005952 0.5440476 0.4369048 0.2696429 0.2029762 0.1577381
 [21,] 1.0000000 1.0000000 0.5160714 0.4029762 0.2672619 0.2035714 0.1583333
 [22,] 0.4571429 0.4500000 0.4863095 0.3720238 0.2660714 0.2041667 0.1577381
 [23,] 0.4446429 0.4333333 0.4559524 0.3529762 0.2678571 0.2023810 0.1589286
 [24,] 0.4285714 0.4226190 0.4333333 0.3535714 0.2708333 0.2017857 0.1595238
 [25,] 1.0000000 0.4196429 0.4190476 0.3553571 0.2690476 0.2041667 0.1601190
 [26,] 1.0000000 0.4226190 0.4160714 0.3571429 0.2690476 0.2059524 0.1583333
 [27,] 1.0000000 0.4208333 0.4101190 0.3595238 0.2714286 0.2089286 0.1607143
 [28,] 1.0000000 0.4166667 0.4077381 0.3619048 0.2726190 0.2095238 0.1619048
 [29,] 1.0000000 0.4166667 0.4005952 0.3636905 0.2761905 0.2089286 0.1613095
 [30,] 1.0000000 0.4059524 0.3892857 0.3666667 0.2773810 0.2065476 0.1607143
 [31,] 1.0000000 1.0000000 0.3928571 0.3648810 0.2797619 0.2065476 0.1601190
 [32,] 1.0000000 1.0000000 0.3976190 0.3672619 0.2755952 0.2077381 0.1607143
 [33,] 1.0000000 1.0000000 0.4047619 0.3750000 0.2684524 0.2083333 0.1625000
 [34,] 1.0000000 1.0000000 0.4255952 0.3880952 0.2630952 0.2077381 0.1619048
 [35,] 1.0000000 1.0000000 1.0000000 1.0000000 0.2541667 0.2023810 0.1619048
 [36,] 1.0000000 1.0000000 1.0000000 1.0000000 0.2428571 0.2017857 0.1625000
 [37,] 1.0000000 1.0000000 1.0000000 0.2392857 0.2327381 0.2011905 0.1607143
 [38,] 1.0000000 1.0000000 1.0000000 0.2386905 0.2250000 0.1994048 0.1619048
 [39,] 1.0000000 1.0000000 1.0000000 0.2398810 0.2184524 0.1970238 0.1613095
 [40,] 1.0000000 1.0000000 1.0000000 0.2422619 0.2178571 0.1934524 0.1613095
 [41,] 1.0000000 1.0000000 1.0000000 0.2434524 0.2160714 0.1916667 0.1595238
 [42,] 1.0000000 0.2702381 0.2535714 0.2404762 0.2142857 0.1880952 0.1589286
 [43,] 1.0000000 0.2875000 0.2583333 0.2416667 0.2101190 0.1875000 0.1571429
 [44,] 1.0000000 0.2976190 0.2654762 0.2404762 0.2107143 0.1839286 0.1553571
 [45,] 1.0000000 0.3083333 0.2666667 0.2375000 0.2065476 0.1779762 0.1541667
 [46,] 1.0000000 0.3285714 0.2642857 0.2363095 0.2011905 0.1738095 0.1505952
 [47,] 1.0000000 0.3434524 0.2660714 0.2345238 0.1976190 0.1708333 0.1482143
 [48,] 1.0000000 0.3601190 0.2672619 0.2255952 0.1946429 0.1684524 0.1476190
 [49,] 1.0000000 0.3785714 0.2648810 0.2250000 0.1922619 0.1636905 0.1452381
 [50,] 1.0000000 0.3982143 0.2625000 0.2220238 0.1863095 0.1613095 0.1440476
 [51,] 1.0000000 1.0000000 0.2613095 0.2184524 0.1803571 0.1577381 0.1446429
 [52,] 1.0000000 0.2857143 0.2648810 0.2130952 0.1750000 0.1541667 0.1428571
 [53,] 1.0000000 0.2928571 0.2636905 0.2101190 0.1714286 0.1517857 0.1416667
 [54,] 1.0000000 0.2982143 0.2607143 0.2065476 0.1678571 0.1505952 0.1380952
 [55,] 1.0000000 0.3005952 0.2607143 0.2047619 0.1666667 0.1464286 0.1380952
 [56,] 1.0000000 0.3059524 0.2583333 0.2059524 0.1654762 0.1434524 0.1363095
 [57,] 0.3220238 0.3065476 0.2553571 0.2047619 0.1642857 0.1416667 0.1345238
 [58,] 0.3428571 0.3125000 0.2541667 0.2047619 0.1642857 0.1380952 0.1327381
 [59,] 0.3660714 0.3202381 0.2535714 0.2065476 0.1613095 0.1357143 0.1321429
 [60,] 0.3750000 0.3232143 0.2547619 0.2017857 0.1589286 0.1357143 0.1315476
 [61,] 0.3767857 0.3220238 0.2529762 0.1994048 0.1589286 0.1345238 0.1315476
 [62,] 0.3863095 0.3226190 0.2511905 0.1946429 0.1547619 0.1321429 0.1315476
 [63,] 0.3857143 0.3202381 0.2500000 0.1898810 0.1511905 0.1303571 0.1315476
 [64,] 0.3863095 0.3208333 0.2488095 0.1839286 0.1494048 0.1285714 0.1297619
 [65,] 0.3940476 0.3190476 0.2446429 0.1815476 0.1458333 0.1285714 0.1303571
 [66,] 0.4059524 0.3148810 0.2398810 0.1761905 0.1392857 0.1279762 0.1297619
 [67,] 0.4238095 0.3101190 0.2380952 0.1726190 0.1363095 0.1261905 0.1273810
 [68,] 0.4464286 0.3083333 0.2321429 0.1672619 0.1339286 0.1261905 0.1279762
 [69,] 0.4589286 0.3119048 0.2255952 0.1630952 0.1327381 0.1255952 0.1261905
 [70,] 0.4708333 0.3130952 0.2238095 0.1589286 0.1297619 0.1261905 0.1255952
 [71,] 0.4708333 0.3130952 0.2226190 0.1541667 0.1297619 0.1250000 0.1273810
 [72,] 0.4851190 0.3142857 0.2154762 0.1541667 0.1267857 0.1232143 0.1255952
 [73,] 1.0000000 0.3160714 0.2113095 0.1511905 0.1244048 0.1226190 0.1250000
 [74,] 0.3821429 0.3184524 0.2041667 0.1488095 0.1261905 0.1202381 0.1244048
 [75,] 0.3803571 0.3136905 0.1964286 0.1446429 0.1250000 0.1202381 0.1238095
 [76,] 0.3827381 0.3053571 0.1880952 0.1440476 0.1226190 0.1202381 0.1244048
 [77,] 0.3803571 0.2904762 0.1851190 0.1410714 0.1226190 0.1184524 0.1232143
 [78,] 0.3779762 0.2809524 0.1821429 0.1363095 0.1196429 0.1184524 0.1220238
 [79,] 0.3803571 0.2767857 0.1791667 0.1339286 0.1190476 0.1178571 0.1226190
 [80,] 0.3857143 0.2690476 0.1750000 0.1315476 0.1184524 0.1184524 0.1214286
 [81,] 0.3863095 0.2630952 0.1714286 0.1285714 0.1178571 0.1190476 0.1220238
 [82,] 0.3988095 0.2684524 0.1702381 0.1255952 0.1160714 0.1166667 0.1226190
 [83,] 0.4178571 0.2744048 0.1648810 0.1208333 0.1166667 0.1160714 0.1226190
 [84,] 0.4297619 0.2934524 0.1630952 0.1190476 0.1160714 0.1172619 0.1226190
 [85,] 0.4886905 1.0000000 0.1636905 0.1172619 0.1172619 0.1178571 0.1226190
 [86,] 0.5113095 1.0000000 0.1690476 0.1184524 0.1196429 0.1178571 0.1232143
 [87,] 1.0000000 1.0000000 1.0000000 0.1184524 0.1208333 0.1196429 0.1226190
 [88,] 1.0000000 1.0000000 1.0000000 0.1244048 0.1238095 0.1208333 0.1232143
 [89,] 1.0000000 0.4130952 1.0000000 0.1250000 0.1273810 0.1214286 0.1232143
 [90,] 1.0000000 0.4023810 1.0000000 0.1315476 0.1309524 0.1226190 0.1238095
 [91,] 1.0000000 1.0000000 0.2095238 0.1386905 0.1351190 0.1226190 0.1232143
 [92,] 1.0000000 0.3190476 0.2154762 0.1500000 0.1375000 0.1226190 0.1220238
 [93,] 0.4065476 0.3511905 1.0000000 0.1517857 0.1392857 0.1232143 0.1226190
 [94,] 0.4261905 1.0000000 1.0000000 0.1636905 0.1363095 0.1214286 0.1232143
 [95,] 1.0000000 1.0000000 1.0000000 1.0000000 0.1351190 0.1232143 0.1232143
 [96,] 1.0000000 1.0000000 1.0000000 1.0000000 0.1309524 0.1238095 0.1226190
 [97,] 0.3803571 1.0000000 1.0000000 1.0000000 0.1291667 0.1232143 0.1220238
 [98,] 1.0000000 1.0000000 1.0000000 1.0000000 0.1279762 0.1214286 0.1226190
 [99,] 1.0000000 1.0000000 1.0000000 1.0000000 0.1238095 0.1220238 0.1238095
[100,] 1.0000000 1.0000000 1.0000000 1.0000000 0.1220238 0.1232143 0.1232143
[101,] 1.0000000 1.0000000 1.0000000 1.0000000 0.1202381 0.1255952 0.1232143
[102,] 1.0000000 0.3339286 1.0000000 1.0000000 0.1172619 0.1261905 0.1244048
[103,] 0.3255952 0.3220238 1.0000000 1.0000000 0.1190476 0.1273810 0.1238095
[104,] 0.3351190 0.3363095 1.0000000 1.0000000 0.1190476 0.1273810 0.1250000
[105,] 0.3482143 0.3571429 1.0000000 1.0000000 0.1184524 0.1285714 0.1250000
[106,] 0.3601190 0.3714286 1.0000000 1.0000000 0.1178571 0.1285714 0.1250000
[107,] 0.3851190 0.3767857 1.0000000 1.0000000 0.1166667 0.1285714 0.1255952
[108,] 0.4053571 0.3946429 1.0000000 1.0000000 0.1172619 0.1273810 0.1279762
[109,] 0.4214286 1.0000000 1.0000000 1.0000000 0.1154762 0.1273810 0.1279762
[110,] 1.0000000 1.0000000 1.0000000 1.0000000 0.1125000 0.1273810 0.1285714
[111,] 1.0000000 1.0000000 1.0000000 1.0000000 0.1095238 0.1255952 0.1285714
[112,] 1.0000000 1.0000000 1.0000000 1.0000000 0.1077381 0.1238095 0.1291667
[113,] 1.0000000 1.0000000 1.0000000 1.0000000 0.1041667 0.1238095 0.1309524
[114,] 1.0000000 1.0000000 1.0000000 1.0000000 0.1041667 0.1238095 0.1309524
[115,] 1.0000000 1.0000000 1.0000000 1.0000000 0.1047619 0.1273810 0.1321429
[116,] 1.0000000 1.0000000 1.0000000 1.0000000 0.1041667 0.1273810 0.1327381
[117,] 1.0000000 1.0000000 1.0000000 1.0000000 0.1047619 0.1279762 0.1333333
[118,] 1.0000000 1.0000000 1.0000000 1.0000000 0.1071429 0.1291667 0.1351190
[119,] 1.0000000 1.0000000 1.0000000 1.0000000 0.1095238 0.1333333 0.1363095
[120,] 1.0000000 1.0000000 1.0000000 1.0000000 0.1125000 0.1345238 0.1375000
[121,] 1.0000000 1.0000000 1.0000000 1.0000000 0.1178571 0.1375000 0.1398810
[122,] 0.3416667 1.0000000 1.0000000 1.0000000 0.1255952 0.1440476 0.1392857
[123,] 0.3386905 0.2565476 0.2000000 0.1755952 0.1398810 0.1452381 0.1404762
[124,] 0.4547619 0.3220238 0.2607143 0.1946429 0.1535714 0.1482143 0.1422619
[125,] 0.6529762 0.4613095 0.3404762 0.2375000 0.1660714 0.1541667 0.1434524
[126,] 0.7892857 0.6523810 0.4660714 0.2851190 0.1755952 0.1571429 0.1452381
[127,] 0.8833333 0.8000000 0.6125000 0.3315476 0.1898810 0.1630952 0.1470238
[128,] 0.9505952 0.8970238 0.7613095 0.3982143 0.2029762 0.1672619 0.1500000
Browse[1]>     fun.na <- function(x){sum(is.na(x)) / n.timesteps}
Browse[1]>     amnt.na                     <- apply(data.all, MAR = dims.cycle.id, fun.na)
Browse[1]>     slices.empty                <- amnt.na == 1
Browse[1]>     slices.valid                <- amnt.na == 0
Browse[1] 
>        [,1] [,2] [,3] [,4]  [,5]  [,6]  [,7]  [,8]  [,9] [,10] [,11] [,12]
  [1,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE
  [2,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE
  [3,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE
  [4,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE
  [5,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE
  [6,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE
  [7,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE
  [8,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE
  [9,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE
 [10,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE
 [11,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE
 [12,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE
 [13,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE
 [14,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE
 [15,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE
 [16,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE
 [17,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE
 [18,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE
 [19,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE
 [20,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE
 [21,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE
 [22,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE
 [23,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE
 [24,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE
 [25,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE
 [26,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE
 [27,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE
 [28,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE
 [29,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE
 [30,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE
 [31,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE
 [32,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE
 [33,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE
 [34,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE
 [35,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE
 [36,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE
 [37,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE
 [38,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE
 [39,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE
 [40,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE
 [41,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE
 [42,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE
 [43,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE
 [44,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE
 [45,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE
 [46,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE
 [47,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE
 [48,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE
 [49,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE
 [50,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE
 [51,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE
 [52,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE
 [53,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE
 [54,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE
 [55,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE
 [56,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE  TRUE
 [57,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE  TRUE
 [58,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE  TRUE
 [59,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE  TRUE
 [60,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE  TRUE
 [61,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE  TRUE
 [62,] TRUE TRUE TRUE TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
 [63,] TRUE TRUE TRUE TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
 [64,] TRUE TRUE TRUE TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
 [65,] TRUE TRUE TRUE TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
 [66,] TRUE TRUE TRUE TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
 [67,] TRUE TRUE TRUE TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
 [68,] TRUE TRUE TRUE TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
 [69,] TRUE TRUE TRUE TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
 [70,] TRUE TRUE TRUE TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
 [71,] TRUE TRUE TRUE TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
 [72,] TRUE TRUE TRUE TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
 [73,] TRUE TRUE TRUE TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
 [74,] TRUE TRUE TRUE TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
 [75,] TRUE TRUE TRUE TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
 [76,] TRUE TRUE TRUE TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
 [77,] TRUE TRUE TRUE TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
 [78,] TRUE TRUE TRUE TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
 [79,] TRUE TRUE TRUE TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
 [80,] TRUE TRUE TRUE TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
 [81,] TRUE TRUE TRUE TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE  TRUE
 [82,] TRUE TRUE TRUE TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE  TRUE  TRUE
 [83,] TRUE TRUE TRUE TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE  TRUE  TRUE
 [84,] TRUE TRUE TRUE TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE  TRUE  TRUE
 [85,] TRUE TRUE TRUE TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE  TRUE  TRUE
 [86,] TRUE TRUE TRUE TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE  TRUE  TRUE
 [87,] TRUE TRUE TRUE TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE  TRUE  TRUE
 [88,] TRUE TRUE TRUE TRUE  TRUE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE
 [89,] TRUE TRUE TRUE TRUE  TRUE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE
 [90,] TRUE TRUE TRUE TRUE  TRUE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE
 [91,] TRUE TRUE TRUE TRUE  TRUE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE
 [92,] TRUE TRUE TRUE TRUE  TRUE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE
 [93,] TRUE TRUE TRUE TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE  TRUE  TRUE
 [94,] TRUE TRUE TRUE TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE  TRUE  TRUE
 [95,] TRUE TRUE TRUE TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE  TRUE  TRUE
 [96,] TRUE TRUE TRUE TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE  TRUE  TRUE
 [97,] TRUE TRUE TRUE TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE  TRUE  TRUE
 [98,] TRUE TRUE TRUE TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE  TRUE  TRUE
 [99,] TRUE TRUE TRUE TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE  TRUE  TRUE
[100,] TRUE TRUE TRUE TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE  TRUE  TRUE
[101,] TRUE TRUE TRUE TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE  TRUE  TRUE
[102,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE  TRUE
[103,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE  TRUE
[104,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE  TRUE
[105,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE  TRUE  TRUE
[106,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE  TRUE
[107,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE  TRUE
[108,] TRUE TRUE TRUE TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
[109,] TRUE TRUE TRUE TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
[110,] TRUE TRUE TRUE TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
[111,] TRUE TRUE TRUE TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[112,] TRUE TRUE TRUE TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[113,] TRUE TRUE TRUE TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[114,] TRUE TRUE TRUE TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[115,] TRUE TRUE TRUE TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[116,] TRUE TRUE TRUE TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[117,] TRUE TRUE TRUE TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[118,] TRUE TRUE TRUE TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[119,] TRUE TRUE TRUE TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[120,] TRUE TRUE TRUE TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[121,] TRUE TRUE TRUE TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE
[122,] TRUE TRUE TRUE TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE
[123,] TRUE TRUE TRUE TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE
[124,] TRUE TRUE TRUE TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE
[125,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE
[126,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE
[127,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE
[128,] TRUE TRUE TRUE TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE
       [,13] [,14] [,15] [,16] [,17] [,18] [,19] [,20] [,21] [,22] [,23] [,24]
  [1,] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
  [2,] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
  [3,] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
  [4,] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
  [5,] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
  [6,] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
  [7,] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
  [8,] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
  [9,] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [10,] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [11,] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [12,] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [13,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [14,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [15,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [16,] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [17,] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [18,] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [19,] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [20,] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [21,] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [22,] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [23,] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [24,] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [25,] FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [26,] FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [27,] FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [28,] FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [29,] FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [30,] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [31,] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [32,] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [33,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [34,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [35,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [36,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [37,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [38,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [39,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [40,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [41,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [42,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [43,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [44,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [45,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [46,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [47,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [48,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [49,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [50,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [51,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [52,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [53,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [54,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [55,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [56,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [57,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [58,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [59,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [60,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [61,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [62,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [63,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [64,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [65,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [66,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [67,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [68,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [69,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [70,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [71,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [72,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [73,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [74,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [75,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [76,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [77,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [78,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [79,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [80,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [81,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [82,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [83,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [84,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [85,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [86,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [87,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [88,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [89,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [90,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [91,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [92,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [93,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [94,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [95,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [96,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [97,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [98,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [99,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[100,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[101,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[102,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[103,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[104,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[105,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[106,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[107,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[108,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[109,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[110,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[111,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[112,] FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[113,] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[114,] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[115,] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[116,] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[117,] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[118,] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[119,] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[120,] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[121,] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[122,] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[123,] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[124,] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[125,] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[126,] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[127,] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[128,] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
       [,25] [,26] [,27] [,28] [,29] [,30] [,31] [,32] [,33] [,34] [,35] [,36]
  [1,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
  [2,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
  [3,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
  [4,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
  [5,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
  [6,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
  [7,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
  [8,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
  [9,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [10,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [11,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [12,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [13,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [14,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [15,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [16,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [17,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [18,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [19,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [20,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [21,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [22,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [23,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [24,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [25,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [26,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [27,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [28,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [29,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [30,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [31,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [32,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [33,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [34,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [35,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [36,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [37,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [38,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [39,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [40,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [41,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [42,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [43,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [44,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [45,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [46,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [47,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [48,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [49,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [50,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [51,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [52,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [53,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [54,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [55,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [56,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [57,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [58,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [59,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [60,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [61,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [62,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [63,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [64,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [65,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [66,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [67,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [68,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [69,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [70,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [71,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [72,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [73,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [74,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [75,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [76,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [77,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [78,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [79,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [80,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [81,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [82,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [83,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [84,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [85,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [86,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [87,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [88,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [89,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [90,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [91,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [92,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [93,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [94,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [95,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [96,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [97,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [98,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [99,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[100,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[101,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[102,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[103,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[104,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[105,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[106,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[107,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[108,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[109,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[110,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[111,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[112,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[113,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[114,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[115,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[116,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[117,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[118,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[119,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[120,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[121,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[122,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[123,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[124,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[125,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[126,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[127,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[128,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
       [,37] [,38] [,39] [,40] [,41] [,42] [,43] [,44] [,45] [,46] [,47] [,48]
  [1,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
  [2,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
  [3,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
  [4,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
  [5,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
  [6,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
  [7,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
  [8,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
  [9,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [10,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [11,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [12,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [13,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [14,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [15,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [16,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [17,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [18,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [19,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [20,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [21,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [22,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [23,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [24,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [25,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [26,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [27,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [28,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [29,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [30,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [31,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [32,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [33,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [34,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [35,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [36,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [37,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [38,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [39,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [40,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [41,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [42,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [43,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [44,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [45,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [46,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [47,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [48,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [49,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [50,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [51,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [52,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [53,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [54,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [55,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [56,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [57,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [58,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [59,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [60,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [61,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [62,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [63,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [64,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [65,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [66,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [67,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [68,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [69,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [70,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [71,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [72,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [73,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [74,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [75,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [76,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [77,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [78,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [79,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [80,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [81,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [82,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [83,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [84,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [85,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [86,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [87,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [88,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [89,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [90,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [91,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [92,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [93,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [94,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [95,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [96,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [97,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [98,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [99,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[100,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[101,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[102,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[103,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[104,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[105,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[106,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[107,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[108,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[109,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[110,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[111,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[112,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[113,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[114,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[115,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[116,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[117,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[118,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[119,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[120,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[121,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[122,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[123,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[124,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[125,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[126,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[127,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[128,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
       [,49] [,50] [,51] [,52] [,53] [,54] [,55] [,56] [,57] [,58] [,59] [,60]
  [1,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE
  [2,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE
  [3,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE
  [4,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE
  [5,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
  [6,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
  [7,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE
  [8,]  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE  TRUE  TRUE  TRUE FALSE FALSE
  [9,]  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE FALSE  TRUE  TRUE FALSE FALSE
 [10,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE
 [11,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE
 [12,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE
 [13,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE
 [14,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE
 [15,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE
 [16,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE
 [17,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE
 [18,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE
 [19,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE
 [20,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE
 [21,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE
 [22,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE
 [23,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE
 [24,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE
 [25,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE
 [26,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE
 [27,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE
 [28,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE
 [29,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE
 [30,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE
 [31,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE
 [32,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE
 [33,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE
 [34,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE
 [35,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [36,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [37,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [38,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [39,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [40,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [41,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [42,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE
 [43,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE
 [44,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE
 [45,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE
 [46,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE
 [47,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE
 [48,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE
 [49,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE
 [50,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE
 [51,]  TRUE  TRUE  TRUE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE
 [52,]  TRUE FALSE  TRUE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE
 [53,]  TRUE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE
 [54,] FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE
 [55,]  TRUE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE
 [56,] FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE
 [57,] FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE
 [58,] FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE
 [59,]  TRUE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE
 [60,]  TRUE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE
 [61,]  TRUE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE FALSE FALSE FALSE
 [62,]  TRUE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE FALSE FALSE FALSE
 [63,]  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE  TRUE  TRUE FALSE FALSE FALSE
 [64,]  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE  TRUE  TRUE FALSE FALSE FALSE
 [65,]  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE  TRUE FALSE FALSE FALSE
 [66,]  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE
 [67,]  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE
 [68,]  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE
 [69,]  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [70,]  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE
 [71,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE
 [72,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE
 [73,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE
 [74,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE
 [75,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE
 [76,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE
 [77,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE
 [78,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE
 [79,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE
 [80,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE
 [81,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE
 [82,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE
 [83,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE
 [84,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE
 [85,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE FALSE
 [86,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE FALSE
 [87,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [88,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [89,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE
 [90,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE
 [91,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE
 [92,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE
 [93,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE  TRUE
 [94,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE
 [95,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [96,]  TRUE  TRUE  TRUE  TRUE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [97,]  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE  TRUE FALSE  TRUE  TRUE
 [98,]  TRUE FALSE  TRUE  TRUE FALSE FALSE FALSE  TRUE FALSE  TRUE  TRUE  TRUE
 [99,]  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE
[100,]  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE
[101,]  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE
[102,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE  TRUE  TRUE FALSE  TRUE
[103,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE  TRUE
[104,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE  TRUE
[105,]  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE  TRUE  TRUE FALSE FALSE  TRUE
[106,]  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE  TRUE FALSE FALSE FALSE  TRUE
[107,]  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
[108,]  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
[109,]  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE
[110,]  TRUE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE
[111,]  TRUE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[112,]  TRUE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[113,]  TRUE  TRUE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[114,]  TRUE  TRUE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
[115,]  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE
[116,]  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE
[117,]  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE
[118,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE
[119,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE
[120,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE  TRUE  TRUE  TRUE
[121,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE  TRUE  TRUE  TRUE
[122,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE  TRUE
[123,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE
[124,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE
[125,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE
[126,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE
[127,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE
[128,]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE
       [,61] [,62] [,63] [,64]
  [1,] FALSE FALSE FALSE FALSE
  [2,] FALSE FALSE FALSE FALSE
  [3,] FALSE FALSE FALSE FALSE
  [4,] FALSE FALSE FALSE FALSE
  [5,] FALSE FALSE FALSE FALSE
  [6,]  TRUE FALSE FALSE FALSE
  [7,]  TRUE FALSE FALSE FALSE
  [8,]  TRUE FALSE FALSE FALSE
  [9,]  TRUE FALSE FALSE FALSE
 [10,] FALSE FALSE FALSE FALSE
 [11,] FALSE FALSE FALSE FALSE
 [12,] FALSE FALSE FALSE FALSE
 [13,] FALSE FALSE FALSE FALSE
 [14,] FALSE FALSE FALSE FALSE
 [15,] FALSE FALSE FALSE FALSE
 [16,] FALSE FALSE FALSE FALSE
 [17,] FALSE FALSE FALSE FALSE
 [18,] FALSE FALSE FALSE FALSE
 [19,] FALSE FALSE FALSE FALSE
 [20,] FALSE FALSE FALSE FALSE
 [21,] FALSE FALSE FALSE FALSE
 [22,] FALSE FALSE FALSE FALSE
 [23,] FALSE FALSE FALSE FALSE
 [24,] FALSE FALSE FALSE FALSE
 [25,] FALSE FALSE FALSE FALSE
 [26,] FALSE FALSE FALSE FALSE
 [27,] FALSE FALSE FALSE FALSE
 [28,] FALSE FALSE FALSE FALSE
 [29,] FALSE FALSE FALSE FALSE
 [30,] FALSE FALSE FALSE FALSE
 [31,] FALSE FALSE FALSE FALSE
 [32,] FALSE FALSE FALSE FALSE
 [33,] FALSE FALSE FALSE FALSE
 [34,] FALSE FALSE FALSE FALSE
 [35,]  TRUE FALSE FALSE FALSE
 [36,]  TRUE FALSE FALSE FALSE
 [37,] FALSE FALSE FALSE FALSE
 [38,] FALSE FALSE FALSE FALSE
 [39,] FALSE FALSE FALSE FALSE
 [40,] FALSE FALSE FALSE FALSE
 [41,] FALSE FALSE FALSE FALSE
 [42,] FALSE FALSE FALSE FALSE
 [43,] FALSE FALSE FALSE FALSE
 [44,] FALSE FALSE FALSE FALSE
 [45,] FALSE FALSE FALSE FALSE
 [46,] FALSE FALSE FALSE FALSE
 [47,] FALSE FALSE FALSE FALSE
 [48,] FALSE FALSE FALSE FALSE
 [49,] FALSE FALSE FALSE FALSE
 [50,] FALSE FALSE FALSE FALSE
 [51,] FALSE FALSE FALSE FALSE
 [52,] FALSE FALSE FALSE FALSE
 [53,] FALSE FALSE FALSE FALSE
 [54,] FALSE FALSE FALSE FALSE
 [55,] FALSE FALSE FALSE FALSE
 [56,] FALSE FALSE FALSE FALSE
 [57,] FALSE FALSE FALSE FALSE
 [58,] FALSE FALSE FALSE FALSE
 [59,] FALSE FALSE FALSE FALSE
 [60,] FALSE FALSE FALSE FALSE
 [61,] FALSE FALSE FALSE FALSE
 [62,] FALSE FALSE FALSE FALSE
 [63,] FALSE FALSE FALSE FALSE
 [64,] FALSE FALSE FALSE FALSE
 [65,] FALSE FALSE FALSE FALSE
 [66,] FALSE FALSE FALSE FALSE
 [67,] FALSE FALSE FALSE FALSE
 [68,] FALSE FALSE FALSE FALSE
 [69,] FALSE FALSE FALSE FALSE
 [70,] FALSE FALSE FALSE FALSE
 [71,] FALSE FALSE FALSE FALSE
 [72,] FALSE FALSE FALSE FALSE
 [73,] FALSE FALSE FALSE FALSE
 [74,] FALSE FALSE FALSE FALSE
 [75,] FALSE FALSE FALSE FALSE
 [76,] FALSE FALSE FALSE FALSE
 [77,] FALSE FALSE FALSE FALSE
 [78,] FALSE FALSE FALSE FALSE
 [79,] FALSE FALSE FALSE FALSE
 [80,] FALSE FALSE FALSE FALSE
 [81,] FALSE FALSE FALSE FALSE
 [82,] FALSE FALSE FALSE FALSE
 [83,] FALSE FALSE FALSE FALSE
 [84,] FALSE FALSE FALSE FALSE
 [85,] FALSE FALSE FALSE FALSE
 [86,] FALSE FALSE FALSE FALSE
 [87,] FALSE FALSE FALSE FALSE
 [88,] FALSE FALSE FALSE FALSE
 [89,] FALSE FALSE FALSE FALSE
 [90,] FALSE FALSE FALSE FALSE
 [91,] FALSE FALSE FALSE FALSE
 [92,] FALSE FALSE FALSE FALSE
 [93,] FALSE FALSE FALSE FALSE
 [94,] FALSE FALSE FALSE FALSE
 [95,]  TRUE FALSE FALSE FALSE
 [96,]  TRUE FALSE FALSE FALSE
 [97,]  TRUE FALSE FALSE FALSE
 [98,]  TRUE FALSE FALSE FALSE
 [99,]  TRUE FALSE FALSE FALSE
[100,]  TRUE FALSE FALSE FALSE
[101,]  TRUE FALSE FALSE FALSE
[102,]  TRUE FALSE FALSE FALSE
[103,]  TRUE FALSE FALSE FALSE
[104,]  TRUE FALSE FALSE FALSE
[105,]  TRUE FALSE FALSE FALSE
[106,]  TRUE FALSE FALSE FALSE
[107,]  TRUE FALSE FALSE FALSE
[108,]  TRUE FALSE FALSE FALSE
[109,]  TRUE FALSE FALSE FALSE
[110,]  TRUE FALSE FALSE FALSE
[111,]  TRUE FALSE FALSE FALSE
[112,]  TRUE FALSE FALSE FALSE
[113,]  TRUE FALSE FALSE FALSE
[114,]  TRUE FALSE FALSE FALSE
[115,]  TRUE FALSE FALSE FALSE
[116,]  TRUE FALSE FALSE FALSE
[117,]  TRUE FALSE FALSE FALSE
[118,]  TRUE FALSE FALSE FALSE
[119,]  TRUE FALSE FALSE FALSE
[120,]  TRUE FALSE FALSE FALSE
[121,]  TRUE FALSE FALSE FALSE
[122,]  TRUE FALSE FALSE FALSE
[123,] FALSE FALSE FALSE FALSE
[124,] FALSE FALSE FALSE FALSE
[125,] FALSE FALSE FALSE FALSE
[126,] FALSE FALSE FALSE FALSE
[127,] FALSE FALSE FALSE FALSE
[128,] FALSE FALSE FALSE FALSE
Browse[1] 
>         [,1]  [,2]  [,3]  [,4]  [,5]  [,6]  [,7]  [,8]  [,9] [,10] [,11] [,12]
  [1,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  [2,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  [3,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  [4,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  [5,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  [6,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  [7,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  [8,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  [9,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [10,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [11,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [12,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [13,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [14,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [15,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [16,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [17,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [18,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [19,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [20,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [21,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [22,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [23,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [24,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [25,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [26,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [27,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [28,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [29,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [30,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [31,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [32,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [33,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [34,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [35,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [36,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [37,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [38,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [39,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [40,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [41,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [42,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [43,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [44,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [45,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [46,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [47,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [48,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [49,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [50,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [51,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [52,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [53,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [54,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [55,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [56,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [57,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [58,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [59,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [60,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [61,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [62,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [63,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [64,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [65,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [66,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [67,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [68,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [69,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [70,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [71,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [72,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [73,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [74,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [75,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [76,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [77,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [78,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [79,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [80,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [81,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [82,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [83,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [84,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [85,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [86,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [87,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [88,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [89,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [90,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [91,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [92,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [93,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [94,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [95,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [96,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [97,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [98,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [99,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[100,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[101,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[102,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[103,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[104,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[105,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[106,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[107,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[108,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[109,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[110,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[111,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[112,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[113,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[114,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[115,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[116,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[117,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[118,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[119,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[120,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[121,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[122,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[123,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[124,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[125,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[126,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[127,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[128,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
       [,13] [,14] [,15] [,16] [,17] [,18] [,19] [,20] [,21] [,22] [,23] [,24]
  [1,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  [2,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  [3,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  [4,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  [5,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  [6,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  [7,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  [8,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  [9,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [10,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [11,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [12,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [13,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [14,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [15,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [16,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [17,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [18,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [19,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [20,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [21,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [22,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [23,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [24,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [25,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [26,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [27,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [28,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [29,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [30,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [31,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [32,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [33,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [34,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [35,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [36,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [37,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [38,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [39,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [40,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [41,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [42,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [43,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [44,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [45,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [46,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [47,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [48,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [49,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [50,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [51,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [52,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [53,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [54,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [55,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [56,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [57,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [58,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [59,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [60,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [61,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [62,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [63,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [64,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [65,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [66,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [67,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [68,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [69,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [70,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [71,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [72,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [73,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [74,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [75,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [76,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [77,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [78,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [79,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [80,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [81,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [82,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [83,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [84,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [85,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [86,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [87,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [88,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [89,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [90,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [91,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [92,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [93,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [94,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [95,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [96,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [97,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [98,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [99,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[100,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[101,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[102,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[103,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[104,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[105,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[106,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[107,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[108,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[109,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[110,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[111,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[112,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[113,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[114,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[115,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[116,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[117,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[118,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[119,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[120,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[121,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[122,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[123,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[124,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[125,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[126,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[127,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[128,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
       [,25] [,26] [,27] [,28] [,29] [,30] [,31] [,32] [,33] [,34] [,35] [,36]
  [1,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  [2,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  [3,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  [4,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  [5,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  [6,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  [7,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  [8,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  [9,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [10,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [11,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [12,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [13,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [14,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [15,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [16,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [17,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [18,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [19,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [20,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [21,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [22,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [23,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [24,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [25,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [26,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [27,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [28,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [29,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [30,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [31,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [32,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [33,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [34,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [35,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [36,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [37,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [38,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [39,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [40,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [41,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [42,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [43,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [44,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [45,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [46,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [47,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [48,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [49,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [50,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [51,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [52,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [53,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [54,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [55,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [56,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [57,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [58,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [59,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [60,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [61,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [62,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [63,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [64,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [65,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [66,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [67,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [68,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [69,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [70,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [71,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [72,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [73,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [74,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [75,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [76,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [77,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [78,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [79,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [80,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [81,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [82,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [83,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [84,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [85,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [86,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [87,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [88,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [89,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [90,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [91,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [92,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [93,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [94,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [95,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [96,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [97,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [98,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [99,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[100,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[101,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[102,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[103,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[104,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[105,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[106,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[107,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[108,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[109,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[110,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[111,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[112,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[113,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[114,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[115,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[116,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[117,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[118,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[119,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[120,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[121,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[122,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[123,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[124,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[125,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[126,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[127,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[128,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
       [,37] [,38] [,39] [,40] [,41] [,42] [,43] [,44] [,45] [,46] [,47] [,48]
  [1,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  [2,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  [3,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  [4,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  [5,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  [6,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  [7,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  [8,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  [9,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [10,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [11,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [12,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [13,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [14,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [15,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [16,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [17,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [18,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [19,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [20,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [21,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [22,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [23,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [24,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [25,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [26,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [27,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [28,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [29,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [30,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [31,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [32,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [33,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [34,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [35,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [36,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [37,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [38,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [39,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [40,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [41,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [42,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [43,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [44,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [45,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [46,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [47,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [48,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [49,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [50,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [51,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [52,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [53,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [54,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [55,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [56,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [57,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [58,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [59,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [60,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [61,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [62,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [63,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [64,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [65,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [66,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [67,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [68,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [69,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [70,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [71,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [72,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [73,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [74,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [75,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [76,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [77,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [78,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [79,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [80,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [81,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [82,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [83,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [84,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [85,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [86,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [87,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [88,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [89,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [90,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [91,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [92,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [93,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [94,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [95,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [96,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [97,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [98,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [99,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[100,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[101,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[102,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[103,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[104,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[105,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[106,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[107,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[108,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[109,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[110,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[111,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[112,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[113,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[114,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[115,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[116,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[117,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[118,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[119,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[120,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[121,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[122,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[123,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[124,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[125,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[126,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[127,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[128,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
       [,49] [,50] [,51] [,52] [,53] [,54] [,55] [,56] [,57] [,58] [,59] [,60]
  [1,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  [2,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  [3,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  [4,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  [5,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  [6,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  [7,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  [8,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
  [9,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [10,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [11,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [12,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [13,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [14,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [15,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [16,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [17,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [18,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [19,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [20,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [21,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [22,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [23,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [24,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [25,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [26,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [27,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [28,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [29,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [30,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [31,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [32,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [33,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [34,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [35,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [36,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [37,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [38,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [39,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [40,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [41,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [42,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [43,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [44,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [45,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [46,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [47,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [48,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [49,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [50,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [51,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [52,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [53,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [54,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [55,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [56,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [57,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [58,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [59,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [60,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [61,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [62,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [63,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [64,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [65,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [66,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [67,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [68,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [69,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [70,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [71,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [72,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [73,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [74,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [75,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [76,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [77,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [78,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [79,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [80,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [81,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [82,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [83,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [84,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [85,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [86,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [87,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [88,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [89,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [90,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [91,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [92,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [93,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [94,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [95,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [96,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [97,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [98,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [99,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[100,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[101,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[102,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[103,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[104,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[105,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[106,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[107,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[108,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[109,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[110,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[111,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[112,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[113,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[114,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[115,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[116,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[117,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[118,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[119,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[120,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[121,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[122,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[123,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[124,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[125,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[126,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[127,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[128,] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
       [,61] [,62] [,63] [,64]
  [1,] FALSE FALSE FALSE FALSE
  [2,] FALSE FALSE FALSE FALSE
  [3,] FALSE FALSE FALSE FALSE
  [4,] FALSE FALSE FALSE FALSE
  [5,] FALSE FALSE FALSE FALSE
  [6,] FALSE FALSE FALSE FALSE
  [7,] FALSE FALSE FALSE FALSE
  [8,] FALSE FALSE FALSE FALSE
  [9,] FALSE FALSE FALSE FALSE
 [10,] FALSE FALSE FALSE FALSE
 [11,] FALSE FALSE FALSE FALSE
 [12,] FALSE FALSE FALSE FALSE
 [13,] FALSE FALSE FALSE FALSE
 [14,] FALSE FALSE FALSE FALSE
 [15,] FALSE FALSE FALSE FALSE
 [16,] FALSE FALSE FALSE FALSE
 [17,] FALSE FALSE FALSE FALSE
 [18,] FALSE FALSE FALSE FALSE
 [19,] FALSE FALSE FALSE FALSE
 [20,] FALSE FALSE FALSE FALSE
 [21,] FALSE FALSE FALSE FALSE
 [22,] FALSE FALSE FALSE FALSE
 [23,] FALSE FALSE FALSE FALSE
 [24,] FALSE FALSE FALSE FALSE
 [25,] FALSE FALSE FALSE FALSE
 [26,] FALSE FALSE FALSE FALSE
 [27,] FALSE FALSE FALSE FALSE
 [28,] FALSE FALSE FALSE FALSE
 [29,] FALSE FALSE FALSE FALSE
 [30,] FALSE FALSE FALSE FALSE
 [31,] FALSE FALSE FALSE FALSE
 [32,] FALSE FALSE FALSE FALSE
 [33,] FALSE FALSE FALSE FALSE
 [34,] FALSE FALSE FALSE FALSE
 [35,] FALSE FALSE FALSE FALSE
 [36,] FALSE FALSE FALSE FALSE
 [37,] FALSE FALSE FALSE FALSE
 [38,] FALSE FALSE FALSE FALSE
 [39,] FALSE FALSE FALSE FALSE
 [40,] FALSE FALSE FALSE FALSE
 [41,] FALSE FALSE FALSE FALSE
 [42,] FALSE FALSE FALSE FALSE
 [43,] FALSE FALSE FALSE FALSE
 [44,] FALSE FALSE FALSE FALSE
 [45,] FALSE FALSE FALSE FALSE
 [46,] FALSE FALSE FALSE FALSE
 [47,] FALSE FALSE FALSE FALSE
 [48,] FALSE FALSE FALSE FALSE
 [49,] FALSE FALSE FALSE FALSE
 [50,] FALSE FALSE FALSE FALSE
 [51,] FALSE FALSE FALSE FALSE
 [52,] FALSE FALSE FALSE FALSE
 [53,] FALSE FALSE FALSE FALSE
 [54,] FALSE FALSE FALSE FALSE
 [55,] FALSE FALSE FALSE FALSE
 [56,] FALSE FALSE FALSE FALSE
 [57,] FALSE FALSE FALSE FALSE
 [58,] FALSE FALSE FALSE FALSE
 [59,] FALSE FALSE FALSE FALSE
 [60,] FALSE FALSE FALSE FALSE
 [61,] FALSE FALSE FALSE FALSE
 [62,] FALSE FALSE FALSE FALSE
 [63,] FALSE FALSE FALSE FALSE
 [64,] FALSE FALSE FALSE FALSE
 [65,] FALSE FALSE FALSE FALSE
 [66,] FALSE FALSE FALSE FALSE
 [67,] FALSE FALSE FALSE FALSE
 [68,] FALSE FALSE FALSE FALSE
 [69,] FALSE FALSE FALSE FALSE
 [70,] FALSE FALSE FALSE FALSE
 [71,] FALSE FALSE FALSE FALSE
 [72,] FALSE FALSE FALSE FALSE
 [73,] FALSE FALSE FALSE FALSE
 [74,] FALSE FALSE FALSE FALSE
 [75,] FALSE FALSE FALSE FALSE
 [76,] FALSE FALSE FALSE FALSE
 [77,] FALSE FALSE FALSE FALSE
 [78,] FALSE FALSE FALSE FALSE
 [79,] FALSE FALSE FALSE FALSE
 [80,] FALSE FALSE FALSE FALSE
 [81,] FALSE FALSE FALSE FALSE
 [82,] FALSE FALSE FALSE FALSE
 [83,] FALSE FALSE FALSE FALSE
 [84,] FALSE FALSE FALSE FALSE
 [85,] FALSE FALSE FALSE FALSE
 [86,] FALSE FALSE FALSE FALSE
 [87,] FALSE FALSE FALSE FALSE
 [88,] FALSE FALSE FALSE FALSE
 [89,] FALSE FALSE FALSE FALSE
 [90,] FALSE FALSE FALSE FALSE
 [91,] FALSE FALSE FALSE FALSE
 [92,] FALSE FALSE FALSE FALSE
 [93,] FALSE FALSE FALSE FALSE
 [94,] FALSE FALSE FALSE FALSE
 [95,] FALSE FALSE FALSE FALSE
 [96,] FALSE FALSE FALSE FALSE
 [97,] FALSE FALSE FALSE FALSE
 [98,] FALSE FALSE FALSE FALSE
 [99,] FALSE FALSE FALSE FALSE
[100,] FALSE FALSE FALSE FALSE
[101,] FALSE FALSE FALSE FALSE
[102,] FALSE FALSE FALSE FALSE
[103,] FALSE FALSE FALSE FALSE
[104,] FALSE FALSE FALSE FALSE
[105,] FALSE FALSE FALSE FALSE
[106,] FALSE FALSE FALSE FALSE
[107,] FALSE FALSE FALSE FALSE
[108,] FALSE FALSE FALSE FALSE
[109,] FALSE FALSE FALSE FALSE
[110,] FALSE FALSE FALSE FALSE
[111,] FALSE FALSE FALSE FALSE
[112,] FALSE FALSE FALSE FALSE
[113,] FALSE FALSE FALSE FALSE
[114,] FALSE FALSE FALSE FALSE
[115,] FALSE FALSE FALSE FALSE
[116,] FALSE FALSE FALSE FALSE
[117,] FALSE FALSE FALSE FALSE
[118,] FALSE FALSE FALSE FALSE
[119,] FALSE FALSE FALSE FALSE
[120,] FALSE FALSE FALSE FALSE
[121,] FALSE FALSE FALSE FALSE
[122,] FALSE FALSE FALSE FALSE
[123,] FALSE FALSE FALSE FALSE
[124,] FALSE FALSE FALSE FALSE
[125,] FALSE FALSE FALSE FALSE
[126,] FALSE FALSE FALSE FALSE
[127,] FALSE FALSE FALSE FALSE
[128,] FALSE FALSE FALSE FALSE
Browse[1]> str(data.all)
 num [1:128, 1:64, 1:1680] NA NA NA NA NA NA NA NA NA NA ...
Browse[1]> image.rotated(data.all[,,1])
Loading required package: plotrix
Browse[1]> image.rotated(data.all[,,100])
Browse[1]> file.name
[1] "pr_OImon_CanESM2_esmFdbk1_r1i1p1_185001-198912.nc"
Browse[1]> apply(data.all, 3, function(x)sum(is.na(x))/length(x))
   [1] 0.8814697 0.8870850 0.8829346 0.8718262 0.8634033 0.8572998 0.8581543
   [8] 0.8668213 0.8663330 0.8563232 0.8553467 0.8610840 0.8760986 0.8828125
  [15] 0.8781738 0.8660889 0.8596191 0.8538818 0.8568115 0.8680420 0.8702393
  [22] 0.8592529 0.8546143 0.8588867 0.8713379 0.8813477 0.8780518 0.8688965
  [29] 0.8594971 0.8529053 0.8532715 0.8627930 0.8669434 0.8552246 0.8503418
  [36] 0.8557129 0.8737793 0.8802490 0.8778076 0.8657227 0.8554688 0.8524170
  [43] 0.8552246 0.8742676 0.8851318 0.8685303 0.8547363 0.8640137 0.8674316
  [50] 0.8779297 0.8763428 0.8643799 0.8555908 0.8522949 0.8558350 0.8669434
  [57] 0.8688965 0.8541260 0.8581543 0.8684082 0.8776855 0.8846436 0.8792725
  [64] 0.8699951 0.8612061 0.8568115 0.8580322 0.8602295 0.8659668 0.8568115
  [71] 0.8564453 0.8638916 0.8701172 0.8789062 0.8750000 0.8647461 0.8566895
  [78] 0.8543701 0.8566895 0.8603516 0.8586426 0.8538818 0.8532715 0.8583984
  [85] 0.8728027 0.8833008 0.8798828 0.8701172 0.8608398 0.8563232 0.8571777
  [92] 0.8592529 0.8619385 0.8531494 0.8538818 0.8621826 0.8735352 0.8828125
  [99] 0.8797607 0.8676758 0.8596191 0.8574219 0.8569336 0.8619385 0.8641357
 [106] 0.8566895 0.8522949 0.8626709 0.8778076 0.8879395 0.8825684 0.8726807
 [113] 0.8605957 0.8546143 0.8566895 0.8621826 0.8626709 0.8570557 0.8576660
 [120] 0.8656006 0.8779297 0.8837891 0.8817139 0.8728027 0.8631592 0.8574219
 [127] 0.8586426 0.8751221 0.8775635 0.8651123 0.8555908 0.8574219 0.8752441
 [134] 0.8820801 0.8798828 0.8693848 0.8588867 0.8509521 0.8541260 0.8630371
 [141] 0.8656006 0.8516846 0.8509521 0.8603516 0.8773193 0.8837891 0.8796387
 [148] 0.8646240 0.8580322 0.8514404 0.8531494 0.8652344 0.8728027 0.8552246
 [155] 0.8536377 0.8625488 0.8756104 0.8824463 0.8809814 0.8697510 0.8627930
 [162] 0.8542480 0.8594971 0.8688965 0.8743896 0.8645020 0.8563232 0.8618164
 [169] 0.8740234 0.8823242 0.8758545 0.8663330 0.8592529 0.8544922 0.8572998
 [176] 0.8679199 0.8721924 0.8621826 0.8596191 0.8688965 0.8824463 0.8884277
 [183] 0.8851318 0.8769531 0.8660889 0.8566895 0.8620605 0.8684082 0.8708496
 [190] 0.8598633 0.8551025 0.8660889 0.8803711 0.8874512 0.8837891 0.8752441
 [197] 0.8660889 0.8585205 0.8565674 0.8646240 0.8717041 0.8673096 0.8592529
 [204] 0.8669434 0.8789062 0.8881836 0.8841553 0.8729248 0.8649902 0.8583984
 [211] 0.8647461 0.8718262 0.8737793 0.8635254 0.8603516 0.8693848 0.8779297
 [218] 0.8862305 0.8834229 0.8713379 0.8646240 0.8598633 0.8621826 0.8666992
 [225] 0.8710938 0.8592529 0.8574219 0.8652344 0.8780518 0.8872070 0.8830566
 [232] 0.8719482 0.8637695 0.8585205 0.8605957 0.8656006 0.8691406 0.8593750
 [239] 0.8604736 0.8647461 0.8786621 0.8881836 0.8825684 0.8707275 0.8615723
 [246] 0.8560791 0.8605957 0.8652344 0.8676758 0.8593750 0.8588867 0.8698730
 [253] 0.8857422 0.8922119 0.8894043 0.8768311 0.8675537 0.8587646 0.8601074
 [260] 0.8676758 0.8736572 0.8593750 0.8570557 0.8632812 0.8797607 0.8881836
 [267] 0.8835449 0.8741455 0.8637695 0.8569336 0.8612061 0.8686523 0.8751221
 [274] 0.8666992 0.8614502 0.8660889 0.8785400 0.8880615 0.8831787 0.8720703
 [281] 0.8621826 0.8588867 0.8634033 0.8721924 0.8868408 0.8653564 0.8586426
 [288] 0.8692627 0.8795166 0.8848877 0.8813477 0.8723145 0.8648682 0.8572998
 [295] 0.8604736 0.8743896 0.8773193 0.8696289 0.8605957 0.8686523 0.8822021
 [302] 0.8879395 0.8862305 0.8776855 0.8673096 0.8593750 0.8601074 0.8745117
 [309] 0.8771973 0.8638916 0.8605957 0.8656006 0.8818359 0.8901367 0.8875732
 [316] 0.8776855 0.8691406 0.8603516 0.8607178 0.8670654 0.8734131 0.8635254
 [323] 0.8624268 0.8701172 0.8834229 0.8922119 0.8867188 0.8747559 0.8701172
 [330] 0.8641357 0.8641357 0.8706055 0.8756104 0.8652344 0.8610840 0.8681641
 [337] 0.8856201 0.8928223 0.8891602 0.8786621 0.8707275 0.8609619 0.8636475
 [344] 0.8688965 0.8745117 0.8680420 0.8688965 0.8718262 0.8875732 0.8913574
 [351] 0.8890381 0.8798828 0.8691406 0.8634033 0.8648682 0.8859863 0.8966064
 [358] 0.8869629 0.8657227 0.8723145 0.8852539 0.8911133 0.8878174 0.8796387
 [365] 0.8684082 0.8646240 0.8668213 0.8774414 0.8819580 0.8677979 0.8603516
 [372] 0.8684082 0.8837891 0.8918457 0.8869629 0.8781738 0.8691406 0.8635254
 [379] 0.8647461 0.8714600 0.8767090 0.8671875 0.8624268 0.8691406 0.8836670
 [386] 0.8908691 0.8884277 0.8779297 0.8690186 0.8592529 0.8619385 0.8774414
 [393] 0.8836670 0.8713379 0.8625488 0.8712158 0.8837891 0.8911133 0.8880615
 [400] 0.8767090 0.8660889 0.8603516 0.8619385 0.8739014 0.8808594 0.8720703
 [407] 0.8623047 0.8686523 0.8850098 0.8935547 0.8925781 0.8808594 0.8699951
 [414] 0.8632812 0.8674316 0.8846436 0.8986816 0.8763428 0.8698730 0.8730469
 [421] 0.8884277 0.8968506 0.8925781 0.8824463 0.8721924 0.8638916 0.8699951
 [428] 0.8936768 0.9094238 0.8934326 0.8752441 0.8760986 0.8870850 0.8948975
 [435] 0.8900146 0.8797607 0.8687744 0.8670654 0.8674316 0.8829346 0.8947754
 [442] 0.8746338 0.8671875 0.8759766 0.8894043 0.8978271 0.8917236 0.8843994
 [449] 0.8731689 0.8669434 0.8707275 0.8804932 0.8933105 0.8758545 0.8668213
 [456] 0.8745117 0.8889160 0.8951416 0.8898926 0.8806152 0.8719482 0.8652344
 [463] 0.8682861 0.8756104 0.8785400 0.8708496 0.8675537 0.8737793 0.8857422
 [470] 0.8942871 0.8916016 0.8834229 0.8702393 0.8642578 0.8685303 0.8823242
 [477] 0.8952637 0.8803711 0.8658447 0.8742676 0.8833008 0.8914795 0.8887939
 [484] 0.8774414 0.8659668 0.8605957 0.8647461 0.8748779 0.8835449 0.8745117
 [491] 0.8651123 0.8771973 0.8886719 0.8955078 0.8929443 0.8831787 0.8742676
 [498] 0.8685303 0.8688965 0.8813477 0.8829346 0.8767090 0.8619385 0.8687744
 [505] 0.8854980 0.8931885 0.8885498 0.8795166 0.8718262 0.8668213 0.8648682
 [512] 0.8784180 0.8911133 0.8688965 0.8640137 0.8693848 0.8797607 0.8885498
 [519] 0.8831787 0.8741455 0.8630371 0.8582764 0.8646240 0.8748779 0.8778076
 [526] 0.8675537 0.8651123 0.8721924 0.8839111 0.8909912 0.8891602 0.8813477
 [533] 0.8701172 0.8636475 0.8658447 0.8807373 0.9029541 0.8822021 0.8647461
 [540] 0.8709717 0.8834229 0.8914795 0.8885498 0.8773193 0.8676758 0.8627930
 [547] 0.8669434 0.8841553 0.9190674 0.8780518 0.8701172 0.8741455 0.8833008
 [554] 0.8895264 0.8865967 0.8759766 0.8675537 0.8594971 0.8669434 0.8905029
 [561] 0.9007568 0.8879395 0.8669434 0.8702393 0.8835449 0.8909912 0.8863525
 [568] 0.8760986 0.8675537 0.8619385 0.8660889 0.8854980 0.9063721 0.8820801
 [575] 0.8721924 0.8735352 0.8898926 0.8946533 0.8903809 0.8814697 0.8724365
 [582] 0.8631592 0.8657227 0.8771973 0.8861084 0.8726807 0.8646240 0.8713379
 [589] 0.8865967 0.8913574 0.8890381 0.8786621 0.8659668 0.8593750 0.8630371
 [596] 0.8974609 0.9227295 0.8966064 0.8643799 0.8674316 0.8835449 0.8933105
 [603] 0.8907471 0.8779297 0.8687744 0.8623047 0.8676758 0.8759766 0.8840332
 [610] 0.8724365 0.8656006 0.8745117 0.8894043 0.8962402 0.8903809 0.8807373
 [617] 0.8699951 0.8643799 0.8664551 0.8797607 0.8815918 0.8763428 0.8750000
 [624] 0.8780518 0.8930664 0.8991699 0.8969727 0.8891602 0.8752441 0.8668213
 [631] 0.8725586 0.8898926 0.9068604 0.8869629 0.8736572 0.8734131 0.8903809
 [638] 0.8951416 0.8923340 0.8826904 0.8712158 0.8642578 0.8666992 0.8790283
 [645] 0.8819580 0.8735352 0.8688965 0.8769531 0.8919678 0.8962402 0.8935547
 [652] 0.8839111 0.8710938 0.8648682 0.8697510 0.8868408 0.8990479 0.8874512
 [659] 0.8702393 0.8756104 0.8851318 0.8920898 0.8890381 0.8793945 0.8687744
 [666] 0.8623047 0.8691406 0.8806152 0.8929443 0.8767090 0.8693848 0.8752441
 [673] 0.8891602 0.8963623 0.8931885 0.8818359 0.8714600 0.8651123 0.8684082
 [680] 0.8840332 0.8973389 0.8834229 0.8670654 0.8697510 0.8818359 0.8896484
 [687] 0.8853760 0.8737793 0.8645020 0.8583984 0.8618164 0.8743896 0.8797607
 [694] 0.8666992 0.8641357 0.8731689 0.8856201 0.8901367 0.8886719 0.8793945
 [701] 0.8696289 0.8627930 0.8664551 0.8841553 0.8895264 0.8762207 0.8645020
 [708] 0.8736572 0.8892822 0.8970947 0.8925781 0.8842773 0.8719482 0.8671875
 [715] 0.8726807 0.8958740 0.9189453 0.8917236 0.8748779 0.8771973 0.8896484
 [722] 0.8958740 0.8942871 0.8823242 0.8708496 0.8648682 0.8719482 0.8840332
 [729] 0.9011230 0.8864746 0.8713379 0.8725586 0.8911133 0.8996582 0.8963623
 [736] 0.8897705 0.8775635 0.8690186 0.8724365 0.8989258 0.9185791 0.9018555
 [743] 0.8709717 0.8767090 0.8906250 0.8957520 0.8924561 0.8813477 0.8720703
 [750] 0.8666992 0.8768311 0.9008789 0.9272461 0.9001465 0.8793945 0.8742676
 [757] 0.8890381 0.8941650 0.8941650 0.8858643 0.8743896 0.8707275 0.8770752
 [764] 0.9062500 0.9289551 0.9144287 0.8901367 0.8792725 0.8896484 0.8984375
 [771] 0.8939209 0.8819580 0.8734131 0.8675537 0.8719482 0.9062500 0.9322510
 [778] 0.8990479 0.8767090 0.8780518 0.8920898 0.8991699 0.8970947 0.8876953
 [785] 0.8773193 0.8753662 0.8757324 0.8894043 0.9244385 0.9012451 0.8704834
 [792] 0.8740234 0.8872070 0.8937988 0.8907471 0.8801270 0.8706055 0.8640137
 [799] 0.8713379 0.9019775 0.9216309 0.9060059 0.8710938 0.8695068 0.8850098
 [806] 0.8950195 0.8911133 0.8790283 0.8681641 0.8653564 0.8688965 0.8767090
 [813] 0.8999023 0.8825684 0.8780518 0.8797607 0.8902588 0.8972168 0.8936768
 [820] 0.8865967 0.8790283 0.8758545 0.8737793 0.8890381 0.9022217 0.8845215
 [827] 0.8728027 0.8822021 0.8937988 0.9019775 0.8994141 0.8879395 0.8765869
 [834] 0.8712158 0.8771973 0.8984375 0.9118652 0.8953857 0.8748779 0.8804932
 [841] 0.8934326 0.9012451 0.8957520 0.8879395 0.8781738 0.8729248 0.8719482
 [848] 0.9033203 0.9324951 0.9138184 0.8747559 0.8806152 0.8968506 0.9027100
 [855] 0.8989258 0.8891602 0.8785400 0.8752441 0.8804932 0.8996582 0.9133301
 [862] 0.8911133 0.8790283 0.8814697 0.8920898 0.9000244 0.8966064 0.8878174
 [869] 0.8782959 0.8729248 0.8718262 0.8829346 0.9049072 0.8906250 0.8699951
 [876] 0.8754883 0.8905029 0.8973389 0.8925781 0.8824463 0.8721924 0.8690186
 [883] 0.8732910 0.8859863 0.8959961 0.8851318 0.8695068 0.8779297 0.8914795
 [890] 0.9003906 0.8953857 0.8857422 0.8756104 0.8699951 0.8748779 0.8886719
 [897] 0.9034424 0.8901367 0.8784180 0.8808594 0.8947754 0.9007568 0.8985596
 [904] 0.8891602 0.8780518 0.8731689 0.8801270 0.9010010 0.9234619 0.9025879
 [911] 0.8883057 0.8823242 0.8902588 0.8985596 0.8959961 0.8879395 0.8789062
 [918] 0.8747559 0.8784180 0.9003906 0.9161377 0.9005127 0.8887939 0.8787842
 [925] 0.8884277 0.8985596 0.8958740 0.8857422 0.8753662 0.8718262 0.8773193
 [932] 0.9044189 0.9278564 0.9003906 0.8851318 0.8798828 0.8940430 0.9017334
 [939] 0.8983154 0.8887939 0.8793945 0.8736572 0.8819580 0.9019775 0.9346924
 [946] 0.9141846 0.8889160 0.8853760 0.8944092 0.9020996 0.8994141 0.8898926
 [953] 0.8793945 0.8734131 0.8773193 0.9124756 0.9238281 0.9178467 0.8961182
 [960] 0.8782959 0.8931885 0.8986816 0.8962402 0.8857422 0.8753662 0.8737793
 [967] 0.8768311 0.8961182 0.9157715 0.8964844 0.8789062 0.8807373 0.8957520
 [974] 0.9035645 0.9000244 0.8907471 0.8776855 0.8746338 0.8787842 0.8905029
 [981] 0.9040527 0.8879395 0.8767090 0.8798828 0.8929443 0.8974609 0.8958740
 [988] 0.8891602 0.8769531 0.8736572 0.8774414 0.9240723 0.9354248 0.9346924
 [995] 0.8854980 0.8781738 0.8917236 0.8988037 0.8951416 0.8841553 0.8756104
[1002] 0.8724365 0.8836670 0.9180908 0.9301758 0.9161377 0.8890381 0.8850098
[1009] 0.9019775 0.9069824 0.9045410 0.8964844 0.8845215 0.8824463 0.8856201
[1016] 0.9282227 0.9366455 0.9345703 0.8864746 0.8865967 0.8966064 0.9045410
[1023] 0.9007568 0.8942871 0.8818359 0.8798828 0.8880615 0.9106445 0.9351807
[1030] 0.9096680 0.8835449 0.8852539 0.8959961 0.9000244 0.8984375 0.8887939
[1037] 0.8803711 0.8801270 0.8870850 0.9276123 0.9371338 0.9351807 0.8959961
[1044] 0.8868408 0.8999023 0.9041748 0.9003906 0.8896484 0.8806152 0.8828125
[1051] 0.8946533 0.9248047 0.9354248 0.9316406 0.9224854 0.8892822 0.8966064
[1058] 0.9016113 0.9008789 0.8927002 0.8850098 0.8793945 0.8890381 0.9349365
[1065] 0.9377441 0.9348145 0.9171143 0.8856201 0.8978271 0.9027100 0.9003906
[1072] 0.8911133 0.8824463 0.8803711 0.8950195 0.9296875 0.9356689 0.9382324
[1079] 0.9100342 0.8956299 0.9040527 0.9077148 0.9024658 0.8950195 0.8826904
[1086] 0.8807373 0.8913574 0.9393311 0.9375000 0.9362793 0.8934326 0.8895264
[1093] 0.8999023 0.9052734 0.9025879 0.8939209 0.8851318 0.8807373 0.8908691
[1100] 0.9382324 0.9376221 0.9364014 0.9139404 0.8879395 0.8981934 0.9040527
[1107] 0.9003906 0.8894043 0.8817139 0.8769531 0.8834229 0.9177246 0.9366455
[1114] 0.9361572 0.8917236 0.8896484 0.9002686 0.9049072 0.9029541 0.8937988
[1121] 0.8811035 0.8762207 0.8858643 0.9201660 0.9339600 0.9243164 0.9062500
[1128] 0.8878174 0.9002686 0.9040527 0.9007568 0.8909912 0.8814697 0.8784180
[1135] 0.8862305 0.9381104 0.9378662 0.9394531 0.9031982 0.8854980 0.8974609
[1142] 0.9036865 0.9022217 0.8946533 0.8833008 0.8767090 0.8883057 0.9122314
[1149] 0.9300537 0.9133301 0.8969727 0.8917236 0.9028320 0.9083252 0.9033203
[1156] 0.8950195 0.8833008 0.8809814 0.8969727 0.9322510 0.9393311 0.9437256
[1163] 0.9151611 0.8936768 0.9041748 0.9107666 0.9083252 0.8956299 0.8829346
[1170] 0.8803711 0.8900146 0.9343262 0.9392090 0.9384766 0.9119873 0.8944092
[1177] 0.9020996 0.9072266 0.9044189 0.8955078 0.8846436 0.8781738 0.8906250
[1184] 0.9295654 0.9406738 0.9389648 0.8985596 0.8890381 0.8953857 0.9046631
[1191] 0.9006348 0.8913574 0.8825684 0.8809814 0.8937988 0.9293213 0.9400635
[1198] 0.9350586 0.9027100 0.8874512 0.8966064 0.9060059 0.9016113 0.8906250
[1205] 0.8800049 0.8787842 0.8906250 0.9212646 0.9311523 0.9222412 0.9132080
[1212] 0.8885498 0.8951416 0.9044189 0.9020996 0.8924561 0.8850098 0.8787842
[1219] 0.8854980 0.9162598 0.9394531 0.9311523 0.8917236 0.8852539 0.9028320
[1226] 0.9058838 0.9040527 0.8962402 0.8850098 0.8812256 0.8869629 0.9307861
[1233] 0.9375000 0.9385986 0.9218750 0.8928223 0.9064941 0.9111328 0.9061279
[1240] 0.8979492 0.8861084 0.8819580 0.8958740 0.9287109 0.9426270 0.9428711
[1247] 0.9244385 0.8979492 0.9041748 0.9078369 0.9061279 0.8952637 0.8870850
[1254] 0.8836670 0.8859863 0.9261475 0.9396973 0.9405518 0.9157715 0.8939209
[1261] 0.9002686 0.9082031 0.9051514 0.8958740 0.8861084 0.8813477 0.8945312
[1268] 0.9207764 0.9306641 0.9182129 0.9031982 0.8916016 0.9017334 0.9072266
[1275] 0.9038086 0.8969727 0.8853760 0.8809814 0.8969727 0.9343262 0.9400635
[1282] 0.9353027 0.9276123 0.8997803 0.9011230 0.9057617 0.9025879 0.8945312
[1289] 0.8823242 0.8840332 0.8913574 0.9316406 0.9409180 0.9399414 0.9327393
[1296] 0.8967285 0.8997803 0.9052734 0.9027100 0.8959961 0.8857422 0.8823242
[1303] 0.8913574 0.9418945 0.9415283 0.9378662 0.9215088 0.8919678 0.8988037
[1310] 0.9031982 0.9010010 0.8908691 0.8814697 0.8791504 0.8880615 0.9340820
[1317] 0.9392090 0.9393311 0.8937988 0.8861084 0.9012451 0.9090576 0.9042969
[1324] 0.8963623 0.8862305 0.8867188 0.8992920 0.9403076 0.9403076 0.9382324
[1331] 0.9171143 0.8996582 0.9095459 0.9112549 0.9075928 0.8992920 0.8909912
[1338] 0.8859863 0.8978271 0.9431152 0.9407959 0.9392090 0.9254150 0.8933105
[1345] 0.9061279 0.9097900 0.9055176 0.8952637 0.8886719 0.8865967 0.8944092
[1352] 0.9412842 0.9405518 0.9414062 0.9335938 0.9028320 0.9080811 0.9105225
[1359] 0.9050293 0.8952637 0.8851318 0.8833008 0.9078369 0.9383545 0.9414062
[1366] 0.9400635 0.9365234 0.9034424 0.9101562 0.9133301 0.9089355 0.9010010
[1373] 0.8927002 0.8883057 0.9045410 0.9340820 0.9445801 0.9448242 0.9176025
[1380] 0.8962402 0.9069824 0.9125977 0.9068604 0.8988037 0.8912354 0.8858643
[1387] 0.9050293 0.9389648 0.9426270 0.9404297 0.9338379 0.9154053 0.9080811
[1394] 0.9134521 0.9097900 0.9013672 0.8935547 0.8875732 0.9033203 0.9473877
[1401] 0.9445801 0.9479980 0.9392090 0.9152832 0.9074707 0.9119873 0.9086914
[1408] 0.9006348 0.8925781 0.8874512 0.9119873 0.9447021 0.9428711 0.9453125
[1415] 0.9456787 0.9074707 0.9051514 0.9083252 0.9035645 0.8972168 0.8881836
[1422] 0.8861084 0.9007568 0.9444580 0.9420166 0.9442139 0.9312744 0.9017334
[1429] 0.9039307 0.9095459 0.9060059 0.8962402 0.8859863 0.8868408 0.9001465
[1436] 0.9384766 0.9416504 0.9400635 0.9327393 0.9138184 0.9094238 0.9144287
[1443] 0.9094238 0.9007568 0.8889160 0.8892822 0.9141846 0.9454346 0.9415283
[1450] 0.9433594 0.9483643 0.9273682 0.9062500 0.9116211 0.9084473 0.8984375
[1457] 0.8874512 0.8875732 0.9123535 0.9448242 0.9417725 0.9421387 0.9390869
[1464] 0.9093018 0.9049072 0.9127197 0.9097900 0.9025879 0.8902588 0.8876953
[1471] 0.9034424 0.9455566 0.9423828 0.9444580 0.9472656 0.9127197 0.9105225
[1478] 0.9091797 0.9061279 0.8968506 0.8883057 0.8873291 0.9089355 0.9458008
[1485] 0.9437256 0.9451904 0.9500732 0.9188232 0.9100342 0.9129639 0.9090576
[1492] 0.9018555 0.8931885 0.8931885 0.9073486 0.9483643 0.9458008 0.9445801
[1499] 0.9368896 0.9139404 0.9075928 0.9107666 0.9089355 0.9017334 0.8909912
[1506] 0.8886719 0.9086914 0.9459229 0.9445801 0.9449463 0.9458008 0.9201660
[1513] 0.9127197 0.9141846 0.9116211 0.9049072 0.8969727 0.8916016 0.9045410
[1520] 0.9465332 0.9432373 0.9425049 0.9381104 0.9041748 0.9094238 0.9127197
[1527] 0.9082031 0.9007568 0.8909912 0.8941650 0.9061279 0.9462891 0.9453125
[1534] 0.9448242 0.9460449 0.9248047 0.9141846 0.9162598 0.9132080 0.9066162
[1541] 0.8958740 0.8957520 0.9145508 0.9475098 0.9467773 0.9472656 0.9495850
[1548] 0.9058838 0.9134521 0.9158936 0.9119873 0.9024658 0.8925781 0.8934326
[1555] 0.9091797 0.9487305 0.9467773 0.9448242 0.9475098 0.9338379 0.9199219
[1562] 0.9182129 0.9162598 0.9084473 0.8997803 0.8981934 0.9210205 0.9511719
[1569] 0.9493408 0.9500732 0.9559326 0.9370117 0.9135742 0.9156494 0.9130859
[1576] 0.9049072 0.8953857 0.8964844 0.9160156 0.9483643 0.9462891 0.9484863
[1583] 0.9554443 0.9279785 0.9143066 0.9154053 0.9117432 0.9040527 0.8956299
[1590] 0.8957520 0.9208984 0.9522705 0.9509277 0.9530029 0.9547119 0.9338379
[1597] 0.9158936 0.9152832 0.9118652 0.9051514 0.8977051 0.8973389 0.9338379
[1604] 0.9487305 0.9458008 0.9475098 0.9517822 0.9399414 0.9176025 0.9141846
[1611] 0.9121094 0.9052734 0.8952637 0.8950195 0.9163818 0.9490967 0.9468994
[1618] 0.9471436 0.9506836 0.9333496 0.9183350 0.9169922 0.9127197 0.9055176
[1625] 0.8969727 0.9005127 0.9437256 0.9479980 0.9455566 0.9470215 0.9495850
[1632] 0.9522705 0.9245605 0.9177246 0.9135742 0.9066162 0.8969727 0.8957520
[1639] 0.9266357 0.9483643 0.9467773 0.9489746 0.9532471 0.9411621 0.9174805
[1646] 0.9156494 0.9105225 0.9041748 0.8947754 0.8980713 0.9099121 0.9478760
[1653] 0.9444580 0.9434814 0.9500732 0.9329834 0.9184570 0.9150391 0.9102783
[1660] 0.9023438 0.8928223 0.8937988 0.9140625 0.9466553 0.9436035 0.9454346
[1667] 0.9497070 0.9371338 0.9249268 0.9207764 0.9154053 0.9078369 0.8980713
[1674] 0.9019775 0.9425049 0.9501953 0.9460449 0.9456787 0.9549561 0.9561768
Browse[1]> which(!is.na(data.all[,,1]), arr.ind = TRUE)
       row col
  [1,]  64   5
  [2,]  65   5
  [3,]  66   5
  [4,]  67   5
  [5,]  68   5
  [6,]  69   5
  [7,]  70   5
  [8,]  71   5
  [9,]  72   5
 [10,]  73   5
 [11,]  74   5
 [12,] 114   5
 [13,] 115   5
 [14,] 116   5
 [15,] 117   5
 [16,]  62   6
 [17,]  63   6
 [18,]  64   6
 [19,]  65   6
 [20,]  66   6
 [21,]  67   6
 [22,]  70   6
 [23,]  71   6
 [24,]  72   6
 [25,]  73   6
 [26,]  74   6
 [27,]  75   6
 [28,]  76   6
 [29,]  77   6
 [30,]  78   6
 [31,]  79   6
 [32,]  88   6
 [33,] 108   6
 [34,] 109   6
 [35,] 110   6
 [36,] 111   6
 [37,] 112   6
 [38,] 113   6
 [39,] 114   6
 [40,] 115   6
 [41,] 116   6
 [42,] 117   6
 [43,] 118   6
 [44,] 119   6
 [45,] 120   6
 [46,]  62   7
 [47,]  63   7
 [48,]  64   7
 [49,]  65   7
 [50,]  88   7
 [51,]  89   7
 [52,]  96   7
 [53,]  97   7
 [54,]  98   7
 [55,]  99   7
 [56,] 100   7
 [57,] 101   7
 [58,] 108   7
 [59,] 109   7
 [60,] 110   7
 [61,] 111   7
 [62,] 112   7
 [63,] 113   7
 [64,] 114   7
 [65,] 115   7
 [66,] 116   7
 [67,] 117   7
 [68,] 118   7
 [69,] 119   7
 [70,] 120   7
 [71,] 121   7
 [72,] 122   7
 [73,] 123   7
 [74,] 124   7
 [75,]   1   8
 [76,]   2   8
 [77,]   3   8
 [78,]   4   8
 [79,]   5   8
 [80,]   6   8
 [81,]   7   8
 [82,]   8   8
 [83,]   9   8
 [84,]  10   8
 [85,]  11   8
 [86,]  12   8
 [87,]  13   8
 [88,]  26   8
 [89,]  27   8
 [90,]  56   8
 [91,]  57   8
 [92,]  58   8
 [93,]  59   8
 [94,]  60   8
 [95,]  61   8
 [96,]  62   8
 [97,]  63   8
 [98,] 102   8
 [99,] 103   8
[100,] 108   8
[101,] 109   8
[102,] 110   8
[103,] 111   8
[104,] 112   8
[105,] 113   8
[106,] 114   8
[107,] 115   8
[108,] 116   8
[109,] 117   8
[110,] 118   8
[111,] 119   8
[112,] 120   8
[113,] 121   8
[114,] 122   8
[115,] 123   8
[116,] 124   8
[117,] 125   8
[118,] 126   8
[119,] 127   8
[120,] 128   8
[121,]   1   9
[122,]   2   9
[123,]   3   9
[124,]   4   9
[125,]   5   9
[126,]   6   9
[127,]   7   9
[128,]   8   9
[129,]   9   9
[130,]  10   9
[131,]  11   9
[132,]  12   9
[133,]  13   9
[134,]  14   9
[135,]  15   9
[136,]  16   9
[137,]  17   9
[138,]  18   9
[139,]  19   9
[140,]  20   9
[141,]  21   9
[142,]  22   9
[143,]  23   9
[144,]  24   9
[145,]  25   9
[146,]  26   9
[147,]  27   9
[148,]  28   9
[149,]  29   9
[150,]  30   9
[151,]  31   9
[152,]  32   9
[153,]  33   9
[154,]  34   9
[155,]  36   9
[156,]  37   9
[157,] 119   9
[158,] 120   9
[159,] 121   9
[160,] 122   9
[161,] 123   9
[162,] 124   9
[163,] 125   9
[164,] 126   9
[165,] 127   9
[166,] 128   9
[167,]  14  10
[168,]  15  10
[169,]  16  10
[170,] 123  10
[171,] 124  10
[172,] 125  10
[173,] 126  10
[174,]  57  50
[175,]  58  50
[176,]  53  51
[177,]  56  51
[178,]  58  51
[179,]  59  51
[180,] 110  51
[181,]  51  52
[182,]  52  52
[183,]  53  52
[184,]  54  52
[185,]  59  52
[186,]  60  52
[187,] 100  52
[188,] 101  52
[189,] 109  52
[190,] 110  52
[191,]  51  53
[192,]  52  53
[193,]  59  53
[194,]  60  53
[195,]  61  53
[196,]  96  53
[197,]  97  53
[198,]  98  53
[199,]  99  53
[200,] 100  53
[201,] 101  53
[202,] 108  53
[203,] 109  53
[204,] 110  53
[205,] 111  53
[206,] 112  53
[207,]  61  54
[208,]  62  54
[209,]  63  54
[210,]  64  54
[211,]  65  54
[212,]  96  54
[213,]  97  54
[214,]  98  54
[215,]  99  54
[216,] 100  54
[217,] 101  54
[218,] 105  54
[219,] 106  54
[220,] 107  54
[221,] 108  54
[222,] 109  54
[223,] 110  54
[224,] 111  54
[225,] 112  54
[226,] 113  54
[227,] 114  54
[228,]  65  55
[229,]  66  55
[230,]  97  55
[231,]  98  55
[232,]  99  55
[233,] 100  55
[234,] 101  55
[235,] 102  55
[236,] 105  55
[237,] 106  55
[238,] 107  55
[239,] 108  55
[240,] 109  55
[241,] 110  55
[242,] 115  55
[243,] 116  55
[244,]   9  56
[245,]  69  56
[246,] 100  56
[247,] 101  56
[248,] 102  56
[249,] 107  56
[250,] 108  56
[251,] 109  56
[252,] 117  56
[253,] 120  56
[254,] 121  56
[255,]  15  57
[256,]  16  57
[257,]  17  57
[258,]  18  57
[259,]  66  57
[260,]  67  57
[261,]  68  57
[262,]  69  57
[263,]  70  57
[264,]  98  57
[265,] 100  57
[266,] 101  57
[267,] 106  57
[268,] 107  57
[269,] 108  57
[270,] 109  57
[271,] 120  57
[272,] 121  57
[273,] 122  57
[274,] 123  57
[275,] 124  57
[276,] 125  57
[277,] 126  57
[278,]  12  58
[279,]  13  58
[280,]  14  58
[281,]  15  58
[282,]  16  58
[283,]  17  58
[284,]  18  58
[285,]  19  58
[286,]  22  58
[287,]  23  58
[288,]  24  58
[289,]  57  58
[290,]  58  58
[291,]  59  58
[292,]  60  58
[293,]  61  58
[294,]  62  58
[295,]  63  58
[296,]  64  58
[297,]  65  58
[298,]  66  58
[299,]  67  58
[300,]  68  58
[301,]  69  58
[302,]  70  58
[303,]  71  58
[304,]  72  58
[305,]  74  58
[306,]  75  58
[307,]  76  58
[308,]  77  58
[309,]  78  58
[310,]  79  58
[311,]  80  58
[312,]  81  58
[313,]  82  58
[314,]  83  58
[315,]  84  58
[316,]  85  58
[317,]  86  58
[318,]  93  58
[319,]  94  58
[320,]  97  58
[321,] 103  58
[322,] 104  58
[323,] 105  58
[324,] 106  58
[325,] 107  58
[326,] 108  58
[327,] 109  58
[328,] 122  58
[329,] 123  58
[330,] 124  58
[331,] 125  58
[332,] 126  58
[333,] 127  58
[334,] 128  58
[335,]   1  59
[336,]   2  59
[337,]  12  59
[338,]  13  59
[339,]  14  59
[340,]  15  59
[341,]  16  59
[342,]  17  59
[343,]  18  59
[344,]  19  59
[345,]  20  59
[346,]  22  59
[347,]  23  59
[348,]  24  59
[349,]  25  59
[350,]  26  59
[351,]  27  59
[352,]  28  59
[353,]  29  59
[354,]  30  59
[355,]  42  59
[356,]  43  59
[357,]  44  59
[358,]  45  59
[359,]  46  59
[360,]  47  59
[361,]  48  59
[362,]  49  59
[363,]  50  59
[364,]  52  59
[365,]  53  59
[366,]  54  59
[367,]  55  59
[368,]  56  59
[369,]  57  59
[370,]  58  59
[371,]  59  59
[372,]  60  59
[373,]  61  59
[374,]  62  59
[375,]  63  59
[376,]  64  59
[377,]  65  59
[378,]  66  59
[379,]  67  59
[380,]  68  59
[381,]  69  59
[382,]  70  59
[383,]  71  59
[384,]  72  59
[385,]  73  59
[386,]  74  59
[387,]  75  59
[388,]  76  59
[389,]  77  59
[390,]  78  59
[391,]  79  59
[392,]  80  59
[393,]  81  59
[394,]  82  59
[395,]  83  59
[396,]  84  59
[397,]  89  59
[398,]  90  59
[399,]  92  59
[400,]  93  59
[401,] 102  59
[402,] 103  59
[403,] 104  59
[404,] 105  59
[405,] 106  59
[406,] 107  59
[407,] 108  59
[408,] 123  59
[409,] 124  59
[410,] 125  59
[411,] 126  59
[412,] 127  59
[413,] 128  59
[414,]   1  60
[415,]   2  60
[416,]   9  60
[417,]  10  60
[418,]  11  60
[419,]  12  60
[420,]  13  60
[421,]  14  60
[422,]  15  60
[423,]  16  60
[424,]  17  60
[425,]  18  60
[426,]  19  60
[427,]  20  60
[428,]  21  60
[429,]  22  60
[430,]  23  60
[431,]  24  60
[432,]  25  60
[433,]  26  60
[434,]  27  60
[435,]  28  60
[436,]  29  60
[437,]  30  60
[438,]  31  60
[439,]  32  60
[440,]  33  60
[441,]  34  60
[442,]  42  60
[443,]  43  60
[444,]  44  60
[445,]  45  60
[446,]  46  60
[447,]  47  60
[448,]  48  60
[449,]  49  60
[450,]  50  60
[451,]  51  60
[452,]  52  60
[453,]  53  60
[454,]  54  60
[455,]  55  60
[456,]  56  60
[457,]  57  60
[458,]  58  60
[459,]  59  60
[460,]  60  60
[461,]  61  60
[462,]  62  60
[463,]  63  60
[464,]  64  60
[465,]  65  60
[466,]  66  60
[467,]  67  60
[468,]  68  60
[469,]  69  60
[470,]  70  60
[471,]  71  60
[472,]  72  60
[473,]  73  60
[474,]  74  60
[475,]  75  60
[476,]  76  60
[477,]  77  60
[478,]  78  60
[479,]  79  60
[480,]  80  60
[481,]  81  60
[482,]  82  60
[483,]  83  60
[484,]  84  60
[485,]  85  60
[486,]  86  60
[487,]  91  60
[488,]  92  60
[489,] 123  60
[490,] 124  60
[491,] 125  60
[492,] 126  60
[493,] 127  60
[494,] 128  60
[495,]   1  61
[496,]   2  61
[497,]   3  61
[498,]   4  61
[499,]  10  61
[500,]  11  61
[501,]  12  61
[502,]  13  61
[503,]  14  61
[504,]  15  61
[505,]  16  61
[506,]  17  61
[507,]  18  61
[508,]  19  61
[509,]  20  61
[510,]  21  61
[511,]  22  61
[512,]  23  61
[513,]  24  61
[514,]  25  61
[515,]  26  61
[516,]  27  61
[517,]  28  61
[518,]  29  61
[519,]  30  61
[520,]  31  61
[521,]  32  61
[522,]  33  61
[523,]  34  61
[524,]  37  61
[525,]  38  61
[526,]  39  61
[527,]  40  61
[528,]  41  61
[529,]  42  61
[530,]  43  61
[531,]  44  61
[532,]  45  61
[533,]  46  61
[534,]  47  61
[535,]  48  61
[536,]  49  61
[537,]  50  61
[538,]  51  61
[539,]  52  61
[540,]  53  61
[541,]  54  61
[542,]  55  61
[543,]  56  61
[544,]  57  61
[545,]  58  61
[546,]  59  61
[547,]  60  61
[548,]  61  61
[549,]  62  61
[550,]  63  61
[551,]  64  61
[552,]  65  61
[553,]  66  61
[554,]  67  61
[555,]  68  61
[556,]  69  61
[557,]  70  61
[558,]  71  61
[559,]  72  61
[560,]  73  61
[561,]  74  61
[562,]  75  61
[563,]  76  61
[564,]  77  61
[565,]  78  61
[566,]  79  61
[567,]  80  61
[568,]  81  61
[569,]  82  61
[570,]  83  61
[571,]  84  61
[572,]  85  61
[573,]  86  61
[574,]  87  61
[575,]  88  61
[576,]  89  61
[577,]  90  61
[578,]  91  61
[579,]  92  61
[580,]  93  61
[581,]  94  61
[582,] 123  61
[583,] 124  61
[584,] 125  61
[585,] 126  61
[586,] 127  61
[587,] 128  61
[588,]   1  62
[589,]   2  62
[590,]   3  62
[591,]   4  62
[592,]   5  62
[593,]   6  62
[594,]   7  62
[595,]   8  62
[596,]   9  62
[597,]  10  62
[598,]  11  62
[599,]  12  62
[600,]  13  62
[601,]  14  62
[602,]  15  62
[603,]  16  62
[604,]  17  62
[605,]  18  62
[606,]  19  62
[607,]  20  62
[608,]  21  62
[609,]  22  62
[610,]  23  62
[611,]  24  62
[612,]  25  62
[613,]  26  62
[614,]  27  62
[615,]  28  62
[616,]  29  62
[617,]  30  62
[618,]  31  62
[619,]  32  62
[620,]  33  62
[621,]  34  62
[622,]  35  62
[623,]  36  62
[624,]  37  62
[625,]  38  62
[626,]  39  62
[627,]  40  62
[628,]  41  62
[629,]  42  62
[630,]  43  62
[631,]  44  62
[632,]  45  62
[633,]  46  62
[634,]  47  62
[635,]  48  62
[636,]  49  62
[637,]  50  62
[638,]  51  62
[639,]  52  62
[640,]  53  62
[641,]  54  62
[642,]  55  62
[643,]  56  62
[644,]  57  62
[645,]  58  62
[646,]  59  62
[647,]  60  62
[648,]  61  62
[649,]  62  62
[650,]  63  62
[651,]  64  62
[652,]  65  62
[653,]  66  62
[654,]  67  62
[655,]  68  62
[656,]  69  62
[657,]  70  62
[658,]  71  62
[659,]  72  62
[660,]  73  62
[661,]  74  62
[662,]  75  62
[663,]  76  62
[664,]  77  62
[665,]  78  62
[666,]  79  62
[667,]  80  62
[668,]  81  62
[669,]  82  62
[670,]  83  62
[671,]  84  62
[672,]  85  62
[673,]  86  62
[674,]  87  62
[675,]  88  62
[676,]  89  62
[677,]  90  62
[678,]  91  62
[679,]  92  62
[680,]  93  62
[681,]  94  62
[682,]  95  62
[683,]  96  62
[684,]  97  62
[685,]  98  62
[686,]  99  62
[687,] 100  62
[688,] 101  62
[689,] 102  62
[690,] 103  62
[691,] 104  62
[692,] 105  62
[693,] 106  62
[694,] 107  62
[695,] 108  62
[696,] 109  62
[697,] 110  62
[698,] 111  62
[699,] 112  62
[700,] 113  62
[701,] 114  62
[702,] 115  62
[703,] 116  62
[704,] 117  62
[705,] 118  62
[706,] 119  62
[707,] 120  62
[708,] 121  62
[709,] 122  62
[710,] 123  62
[711,] 124  62
[712,] 125  62
[713,] 126  62
[714,] 127  62
[715,] 128  62
[716,]   1  63
[717,]   2  63
[718,]   3  63
[719,]   4  63
[720,]   5  63
[721,]   6  63
[722,]   7  63
[723,]   8  63
[724,]   9  63
[725,]  10  63
[726,]  11  63
[727,]  12  63
[728,]  13  63
[729,]  14  63
[730,]  15  63
[731,]  16  63
[732,]  17  63
[733,]  18  63
[734,]  19  63
[735,]  20  63
[736,]  21  63
[737,]  22  63
[738,]  23  63
[739,]  24  63
[740,]  25  63
[741,]  26  63
[742,]  27  63
[743,]  28  63
[744,]  29  63
[745,]  30  63
[746,]  31  63
[747,]  32  63
[748,]  33  63
[749,]  34  63
[750,]  35  63
[751,]  36  63
[752,]  37  63
[753,]  38  63
[754,]  39  63
[755,]  40  63
[756,]  41  63
[757,]  42  63
[758,]  43  63
[759,]  44  63
[760,]  45  63
[761,]  46  63
[762,]  47  63
[763,]  48  63
[764,]  49  63
[765,]  50  63
[766,]  51  63
[767,]  52  63
[768,]  53  63
[769,]  54  63
[770,]  55  63
[771,]  56  63
[772,]  57  63
[773,]  58  63
[774,]  59  63
[775,]  60  63
[776,]  61  63
[777,]  62  63
[778,]  63  63
[779,]  64  63
[780,]  65  63
[781,]  66  63
[782,]  67  63
[783,]  68  63
[784,]  69  63
[785,]  70  63
[786,]  71  63
[787,]  72  63
[788,]  73  63
[789,]  74  63
[790,]  75  63
[791,]  76  63
[792,]  77  63
[793,]  78  63
[794,]  79  63
[795,]  80  63
[796,]  81  63
[797,]  82  63
[798,]  83  63
[799,]  84  63
[800,]  85  63
[801,]  86  63
[802,]  87  63
[803,]  88  63
[804,]  89  63
[805,]  90  63
[806,]  91  63
[807,]  92  63
[808,]  93  63
[809,]  94  63
[810,]  95  63
[811,]  96  63
[812,]  97  63
[813,]  98  63
[814,]  99  63
[815,] 100  63
[816,] 101  63
[817,] 102  63
[818,] 103  63
[819,] 104  63
[820,] 105  63
[821,] 106  63
[822,] 107  63
[823,] 108  63
[824,] 109  63
[825,] 110  63
[826,] 111  63
[827,] 112  63
[828,] 113  63
[829,] 114  63
[830,] 115  63
[831,] 116  63
[832,] 117  63
[833,] 118  63
[834,] 119  63
[835,] 120  63
[836,] 121  63
[837,] 122  63
[838,] 123  63
[839,] 124  63
[840,] 125  63
[841,] 126  63
[842,] 127  63
[843,] 128  63
[844,]   1  64
[845,]   2  64
[846,]   3  64
[847,]   4  64
[848,]   5  64
[849,]   6  64
[850,]   7  64
[851,]   8  64
[852,]   9  64
[853,]  10  64
[854,]  11  64
[855,]  12  64
[856,]  13  64
[857,]  14  64
[858,]  15  64
[859,]  16  64
[860,]  17  64
[861,]  18  64
[862,]  19  64
[863,]  20  64
[864,]  21  64
[865,]  22  64
[866,]  23  64
[867,]  24  64
[868,]  25  64
[869,]  26  64
[870,]  27  64
[871,]  28  64
[872,]  29  64
[873,]  30  64
[874,]  31  64
[875,]  32  64
[876,]  33  64
[877,]  34  64
[878,]  35  64
[879,]  36  64
[880,]  37  64
[881,]  38  64
[882,]  39  64
[883,]  40  64
[884,]  41  64
[885,]  42  64
[886,]  43  64
[887,]  44  64
[888,]  45  64
[889,]  46  64
[890,]  47  64
[891,]  48  64
[892,]  49  64
[893,]  50  64
[894,]  51  64
[895,]  52  64
[896,]  53  64
[897,]  54  64
[898,]  55  64
[899,]  56  64
[900,]  57  64
[901,]  58  64
[902,]  59  64
[903,]  60  64
[904,]  61  64
[905,]  62  64
[906,]  63  64
[907,]  64  64
[908,]  65  64
[909,]  66  64
[910,]  67  64
[911,]  68  64
[912,]  69  64
[913,]  70  64
[914,]  71  64
[915,]  72  64
[916,]  73  64
[917,]  74  64
[918,]  75  64
[919,]  76  64
[920,]  77  64
[921,]  78  64
[922,]  79  64
[923,]  80  64
[924,]  81  64
[925,]  82  64
[926,]  83  64
[927,]  84  64
[928,]  85  64
[929,]  86  64
[930,]  87  64
[931,]  88  64
[932,]  89  64
[933,]  90  64
[934,]  91  64
[935,]  92  64
[936,]  93  64
[937,]  94  64
[938,]  95  64
[939,]  96  64
[940,]  97  64
[941,]  98  64
[942,]  99  64
[943,] 100  64
[944,] 101  64
[945,] 102  64
[946,] 103  64
[947,] 104  64
[948,] 105  64
[949,] 106  64
[950,] 107  64
[951,] 108  64
[952,] 109  64
[953,] 110  64
[954,] 111  64
[955,] 112  64
[956,] 113  64
[957,] 114  64
[958,] 115  64
[959,] 116  64
[960,] 117  64
[961,] 118  64
[962,] 119  64
[963,] 120  64
[964,] 121  64
[965,] 122  64
[966,] 123  64
[967,] 124  64
[968,] 125  64
[969,] 126  64
[970,] 127  64
[971,] 128  64
Browse[1]> data.all[128,64,]
   [1] 8.272405e-07 3.639408e-06 1.921804e-06 3.309380e-07 8.474202e-06
   [6] 6.534309e-06 1.030768e-05 8.076018e-06 1.275320e-05 8.127667e-06
  [11] 6.882216e-06 4.463945e-06 1.077232e-06 6.891673e-06 4.105982e-06
  [16] 8.062801e-06 1.007809e-05 7.304955e-06 8.154580e-06 9.603151e-06
  [21] 1.929620e-05 9.566711e-06 9.705791e-06 2.591875e-06 4.294577e-06
  [26] 5.439551e-06 1.138177e-05 2.562603e-06 7.632975e-06 9.182072e-06
  [31] 8.000088e-06 7.828719e-06 1.752770e-05 1.437828e-05 7.665476e-06
  [36] 3.766414e-06 7.800161e-06 1.655033e-06 7.147488e-07 1.097532e-05
  [41] 8.162797e-06 6.429983e-06 1.076465e-05 9.119573e-06 1.281412e-05
  [46] 1.688756e-05 1.476912e-05 1.027484e-05 5.167203e-06 3.375422e-06
  [51] 2.298456e-06 7.764367e-06 1.207916e-05 1.138234e-05 6.677333e-06
  [56] 1.231814e-05 2.056977e-05 9.823413e-06 4.560242e-06 1.728775e-05
  [61] 2.528784e-06 5.417714e-06 3.445376e-06 3.002694e-06 5.156025e-06
  [66] 7.801735e-06 1.237889e-05 1.990766e-05 2.132150e-05 1.280623e-05
  [71] 7.668628e-06 2.710463e-06 2.040350e-06 1.242279e-06 2.844919e-06
  [76] 2.237315e-06 5.712055e-06 5.122625e-06 6.038692e-06 6.543801e-06
  [81] 1.105478e-05 5.098789e-06 1.166070e-05 9.466969e-06 5.280210e-06
  [86] 4.125500e-06 8.739053e-06 5.759056e-06 9.871082e-06 4.901661e-06
  [91] 2.073958e-05 1.732225e-05 1.248086e-05 2.687125e-06 4.798764e-06
  [96] 7.746024e-06 4.734678e-06 3.254482e-06 9.741539e-06 1.100279e-05
 [101] 1.025119e-05 8.462143e-06 1.064681e-05 7.117486e-06 1.129455e-05
 [106] 1.147102e-05 9.156370e-06 2.055639e-06 2.721019e-06 2.879340e-06
 [111] 1.942667e-06 3.053738e-06 7.435901e-06 1.046448e-05 4.979137e-06
 [116] 9.412709e-06 1.759938e-05 9.598410e-06 6.270451e-06 1.225614e-05
 [121] 2.750797e-06 3.960046e-06 8.164673e-07 2.035715e-06 1.280284e-05
 [126] 1.448992e-05 7.904052e-06 1.009988e-05 1.446220e-05 3.655833e-06
 [131] 2.274171e-06 2.575016e-06 2.977116e-06 6.106825e-06 1.049745e-05
 [136] 2.894300e-06 4.193987e-06 2.112907e-05 9.369083e-06 1.954367e-05
 [141] 8.697232e-06 6.087548e-06 6.454884e-06 5.338698e-06 5.659249e-06
 [146] 4.666456e-06 2.428060e-06 1.693195e-06 4.301310e-06 4.259127e-06
 [151] 9.831641e-06 1.266458e-05 1.146807e-05 5.431165e-06 2.686701e-06
 [156] 3.431349e-06 5.224518e-06 3.525969e-06 1.655742e-06 4.191470e-06
 [161] 9.561734e-06 9.863624e-06 1.828492e-05 1.451888e-05 1.675122e-05
 [166] 1.290016e-05 3.719629e-06 1.468372e-06 3.370737e-07 3.611457e-06
 [171] 1.211250e-05 1.971960e-06 5.160959e-06 1.267690e-05 9.793808e-06
 [176] 1.444692e-05 1.020415e-05 6.071277e-06 2.061112e-06 8.024391e-06
 [181] 3.763460e-06 3.633956e-06 1.117570e-06 8.776759e-07 7.158792e-06
 [186] 7.244641e-06 7.023452e-06 1.049788e-05 1.069495e-05 1.788831e-05
 [191] 3.912824e-06 2.241690e-06 1.380410e-06 5.766802e-07 9.748126e-07
 [196] 3.126937e-06 5.110560e-06 1.223859e-05 7.919561e-06 6.526734e-06
 [201] 1.123113e-05 4.983731e-06 5.609070e-06 2.250554e-06 1.853975e-05
 [206] 9.036545e-06 3.693700e-06 7.422826e-06 1.773862e-06 6.746538e-06
 [211] 1.778694e-05 1.883613e-05 3.847704e-06 1.026121e-05 4.343007e-06
 [216] 6.728819e-06 3.937047e-06 1.776238e-06 2.948227e-06 3.949212e-06
 [221] 7.349523e-06 5.031418e-06 5.641855e-06 1.145220e-05 9.738453e-06
 [226] 1.299276e-05 5.083422e-06 3.574103e-06 3.033703e-06 4.028247e-06
 [231] 2.246406e-06 4.336428e-06 8.795942e-06 5.263056e-06 7.648760e-06
 [236] 9.455938e-06 1.276901e-05 8.138681e-06 9.901956e-06 3.699613e-06
 [241] 3.957827e-06 4.424689e-06 1.042994e-06 3.396498e-06 4.722712e-06
 [246] 1.304154e-05 1.843393e-05 1.235934e-05 1.550987e-05 1.019626e-05
 [251] 3.476828e-06 5.672775e-06 1.132665e-06 8.239470e-06 2.954959e-06
 [256] 4.036021e-06 9.368379e-06 7.393719e-06 1.051065e-05 1.141062e-05
 [261] 1.312054e-05 8.632728e-06 1.259181e-05 5.123474e-06 5.112257e-06
 [266] 1.136645e-06 2.105754e-06 3.899097e-06 5.593984e-06 4.458768e-06
 [271] 4.721854e-06 1.574730e-05 7.867891e-06 2.158562e-05 5.470005e-06
 [276] 5.567636e-06 2.005832e-06 4.310016e-06 3.088225e-06 7.592870e-06
 [281] 9.871723e-06 1.814249e-05 6.980399e-06 1.120465e-05 1.534659e-05
 [286] 1.576527e-05 6.295892e-06 6.060148e-06 1.492369e-06 3.598930e-06
 [291] 4.879833e-06 4.557233e-06 6.244301e-06 5.777653e-06 1.312793e-05
 [296] 1.138831e-05 1.175175e-05 6.346828e-06 7.250586e-06 8.215916e-06
 [301] 8.900250e-06 1.787350e-06 2.707384e-06 5.486787e-06 7.198869e-06
 [306] 6.478345e-06 1.857079e-05 7.703075e-06 6.604359e-06 5.263408e-06
 [311] 3.358874e-06 1.554716e-06 5.213345e-06 3.571663e-06 2.222819e-06
 [316] 1.354466e-05 1.383303e-05 3.983500e-06 1.277836e-05 1.357567e-05
 [321] 1.967496e-05 7.927294e-06 3.833258e-06 7.428986e-06 1.947794e-06
 [326] 3.938053e-06 7.747227e-06 4.042499e-06 1.138807e-05 9.476656e-06
 [331] 1.818872e-05 1.420906e-05 1.009776e-05 9.958691e-06 3.503759e-06
 [336] 4.947897e-06 3.575460e-06 2.473258e-06 7.904110e-06 8.757465e-06
 [341] 3.685008e-06 1.397217e-05 9.109458e-06 1.880453e-05 1.141725e-05
 [346] 7.304187e-06 8.356722e-06 1.921582e-05 2.997226e-06 5.869407e-06
 [351] 6.933846e-06 1.591909e-05 5.415437e-06 1.151065e-05 1.149182e-05
 [356] 1.193972e-05           NA 2.450373e-05 9.052323e-06 4.636719e-06
 [361] 6.209631e-06 9.977411e-06 2.868584e-06 1.176426e-05 3.230683e-06
 [366] 9.002003e-06 7.452053e-06           NA           NA 1.135594e-05
 [371] 2.898859e-06 7.321683e-06 3.930269e-06 4.281955e-06 6.861488e-06
 [376] 3.894785e-06 6.754615e-06 9.161600e-06 8.961154e-06 1.599656e-05
 [381] 1.180074e-05 1.468593e-05 1.261994e-05 6.795194e-06 3.970547e-06
 [386] 6.487526e-06 1.096475e-05 1.703051e-06 8.018047e-06 6.793253e-06
 [391] 4.140321e-06 1.016402e-05 2.128638e-05 1.559633e-05 4.535720e-06
 [396] 2.805265e-06 4.580185e-06 1.537460e-06 6.235135e-07 3.341600e-06
 [401] 4.676849e-06 3.778780e-06 1.867860e-05 7.856976e-06 1.230414e-05
 [406] 9.804401e-06 8.224602e-06 1.356054e-05 4.940894e-06 2.987525e-06
 [411] 3.046125e-06 2.660697e-06 5.052440e-06 9.911152e-06 4.318892e-06
 [416] 1.483657e-06           NA 1.111516e-05 5.355379e-06 9.382076e-06
 [421] 4.181148e-06 7.085284e-06 1.346685e-05 7.146174e-06 1.274328e-05
 [426] 1.209356e-05 1.193875e-05 1.975740e-05 8.130790e-06 9.761708e-06
 [431] 7.866214e-06 2.704530e-06 3.743378e-06 5.696110e-06 3.515201e-06
 [436] 1.018001e-05 4.166939e-06 2.121033e-06 4.211661e-06 1.100783e-05
 [441] 1.869680e-05 1.009981e-05 1.504093e-05 1.594754e-05 4.866174e-06
 [446] 5.535891e-06 2.850275e-06 5.510867e-06 7.061383e-06 7.605213e-06
 [451] 1.276178e-05 2.195730e-05 1.864653e-05 5.081664e-06 3.471787e-06
 [456] 2.396177e-06 1.175980e-05 2.745235e-06 1.639623e-06 9.373190e-06
 [461] 4.218580e-06 8.736506e-06 1.778345e-05 9.409615e-06 1.425603e-05
 [466] 1.334636e-05 9.821174e-06 2.740664e-06 3.678086e-06 1.044927e-06
 [471] 5.828356e-06 5.861210e-06 3.667509e-06 9.216925e-06 1.171436e-05
 [476] 1.963298e-05 1.552509e-05 6.796340e-06 5.458020e-06 4.497862e-06
 [481] 9.474413e-06 2.231182e-06 5.968057e-06 5.588370e-06 5.832477e-06
 [486] 1.275526e-05 6.067572e-06 2.225389e-05 2.661218e-05 8.408087e-06
 [491] 1.800228e-05 3.765079e-06 9.579596e-07 1.578528e-06 7.902633e-06
 [496] 9.733449e-06 1.393820e-05 3.456441e-06 7.623527e-06 8.142350e-06
 [501] 1.578243e-05 1.506141e-05 5.936525e-06 6.036870e-06 1.333614e-05
 [506] 3.987852e-06 6.001484e-06 6.754297e-06 4.391764e-06 1.165759e-05
 [511] 6.424310e-06           NA           NA 1.428903e-05 5.088952e-06
 [516] 2.896275e-06 2.998404e-06 2.693287e-06 1.372050e-05 5.036956e-06
 [521] 2.906050e-06 9.729909e-06 7.868081e-06 1.921583e-05 1.869545e-05
 [526] 8.235690e-06 7.215317e-06 4.614345e-06 3.420089e-06 6.183057e-06
 [531] 4.450248e-06 5.323796e-06 4.395264e-06 1.066179e-05 8.849715e-06
 [536] 1.322225e-05           NA 1.181816e-05 6.966868e-06 7.532698e-06
 [541] 2.121543e-06 8.714222e-06 8.403292e-06 3.042013e-06 6.353574e-06
 [546] 1.072605e-05 1.531450e-05 2.336759e-05           NA 1.003469e-05
 [551] 5.258980e-06 4.684563e-06 1.407432e-06 5.793142e-06 1.874054e-06
 [556] 3.129214e-06 7.372833e-06 5.590002e-06 4.618264e-06 1.386046e-05
 [561] 1.437649e-05 8.514964e-06 1.833836e-06 6.126158e-06 2.851089e-06
 [566] 5.293929e-06 2.828869e-06 1.141680e-06 7.447830e-06 7.386391e-06
 [571] 1.005505e-05 2.027025e-05 1.832896e-05 1.147447e-05 9.831284e-06
 [576] 7.091393e-06 4.830261e-06 2.904101e-06 2.897354e-06 2.007657e-06
 [581] 5.878064e-06 1.715806e-05 6.776982e-06 2.612934e-05 1.783629e-05
 [586] 8.291745e-06 1.070692e-05 3.334986e-06 1.572634e-06 8.340338e-06
 [591] 4.635881e-06 7.285626e-06 7.456302e-06 1.244034e-05 1.103690e-05
 [596] 1.304903e-05           NA 8.909872e-06 6.349316e-06 2.479235e-06
 [601] 2.216783e-06 1.883518e-06 2.191330e-06 3.323054e-06 5.026639e-06
 [606] 3.929232e-06 1.536083e-05 3.342093e-05 8.009744e-06 1.002707e-05
 [611] 6.881100e-06 2.356109e-06 3.144796e-06 1.093695e-06 4.960369e-06
 [616] 2.637465e-06 7.306005e-06 7.717850e-06 1.040496e-05 1.482552e-05
 [621] 1.674050e-05 1.461331e-05 7.086789e-06 2.246363e-06 6.618911e-06
 [626] 3.233529e-06 2.012184e-06 8.478223e-06 5.323654e-06 9.413669e-06
 [631] 4.763975e-06 2.647249e-05 1.328343e-05 1.171430e-05 5.716295e-06
 [636] 2.155968e-06 4.642546e-06 2.873246e-06 5.005211e-06 6.140924e-06
 [641] 8.013964e-06 7.689344e-06 5.820069e-06 1.948530e-05 1.161628e-05
 [646] 1.073256e-05 7.895709e-06 8.624931e-06 2.109539e-06 1.930104e-06
 [651] 3.451685e-06 6.054198e-06 9.968518e-06 8.039443e-06 8.909527e-06
 [656] 8.889276e-06 7.832259e-06 1.256786e-05 3.010467e-06 3.700028e-06
 [661] 3.934515e-06 4.962200e-06 2.311611e-06 4.792034e-06 5.456744e-06
 [666] 4.223420e-06 1.047672e-05 9.835244e-06 1.501647e-05 9.819856e-06
 [671] 1.587344e-05 2.635781e-06 6.929367e-06 3.290733e-06 4.391598e-06
 [676] 4.839029e-06 5.317034e-06 5.373464e-06 1.564677e-05 1.984655e-05
 [681] 5.284530e-06 2.473465e-05 6.528455e-06 4.412303e-06 1.147969e-06
 [686] 2.541420e-06 4.399760e-06 2.303821e-06 3.606610e-06 9.659843e-06
 [691] 2.401802e-05 1.327630e-05 1.257091e-05 1.154198e-05 3.929281e-06
 [696] 2.285522e-06 2.439974e-06 7.888194e-06 6.032432e-06 1.858388e-06
 [701] 4.916302e-06 4.387359e-06 8.357090e-06 2.023093e-05 2.910587e-05
 [706] 8.882807e-06 1.125249e-05 1.581388e-06 6.779522e-06 6.786639e-06
 [711] 1.752849e-06 7.525338e-06 1.067863e-05 1.922286e-05 5.706735e-06
 [716] 1.431836e-05 8.968222e-06 1.066900e-05 4.760206e-06 4.597098e-06
 [721] 7.037300e-06 4.112298e-06 9.990530e-07 6.996044e-06 1.300178e-05
 [726] 6.634804e-06 8.485673e-06 1.028592e-05 1.642552e-05 2.040404e-05
 [731] 9.112661e-06 7.780392e-06 5.568924e-06 2.360990e-06 9.323801e-06
 [736] 7.913989e-06 1.254911e-05 1.358796e-05 1.943999e-05 1.543168e-05
 [741]           NA 4.128535e-06 7.790092e-06 1.946187e-06 7.522759e-06
 [746] 9.426258e-06 8.416877e-06 6.872606e-06 1.205919e-05 1.028988e-05
 [751] 1.977540e-05           NA           NA           NA 1.704427e-05
 [756] 6.500733e-06 6.014465e-06 3.683763e-06 9.656969e-06 1.786385e-06
 [761] 7.609033e-06 4.616198e-06 1.112962e-05 2.097255e-05           NA
 [766]           NA 1.269664e-05 1.201755e-05 3.203500e-06 8.818223e-06
 [771] 9.530830e-06 1.074255e-05 7.761184e-06 1.315885e-05 1.122290e-05
 [776] 8.912508e-06           NA 1.111737e-05 6.537420e-06 5.929385e-06
 [781] 7.325681e-06 9.739679e-06 5.929456e-06 1.090244e-06 8.075832e-06
 [786] 7.629198e-06 1.244602e-05 1.007780e-05           NA           NA
 [791] 4.064457e-06 3.530684e-06 9.266528e-06 2.528798e-06 5.323659e-06
 [796] 5.470860e-06 6.543442e-06 2.455612e-05 1.984529e-05 2.194122e-05
 [801] 2.629873e-06           NA 5.887642e-06 6.551488e-06 5.740635e-06
 [806] 1.928057e-06 9.394871e-06 1.229395e-05 3.405693e-06 8.176600e-06
 [811] 1.676564e-05 7.817984e-06           NA 1.283048e-05 1.410824e-05
 [816] 3.259606e-06 4.722789e-06 3.862093e-06 3.782456e-06 8.392434e-06
 [821] 6.373434e-06 5.966770e-06 1.576326e-05 3.855624e-06           NA
 [826] 1.492505e-05 8.146768e-06 5.454263e-06 4.156007e-06 7.838413e-06
 [831] 9.990149e-06 2.740138e-06 4.178497e-06 1.168604e-05 8.378082e-06
 [836] 2.197886e-05           NA 4.220019e-06 9.703568e-06 2.857347e-06
 [841] 8.426108e-06 3.353051e-06 5.658918e-06 1.625196e-06 3.010437e-06
 [846] 1.654782e-05 8.045493e-06 5.517301e-06           NA 9.261588e-08
 [851] 1.097468e-05 7.353462e-06 7.268909e-06 5.174976e-06 1.475178e-06
 [856] 3.178295e-06 5.484248e-06 7.225162e-06 6.607975e-06 1.413249e-05
 [861]           NA 2.164352e-05 3.851774e-06 2.833440e-06 1.456151e-05
 [866] 3.592324e-06 4.941724e-06 3.718405e-06 4.706535e-06 9.184402e-06
 [871] 3.214087e-05 9.236765e-06 8.520698e-06 4.926342e-06 7.425704e-06
 [876] 8.335916e-06 1.966672e-06 1.804238e-06 2.898237e-06 7.027589e-06
 [881] 8.286508e-06 4.975213e-06 8.264008e-06 1.229736e-05 1.491246e-05
 [886] 6.962042e-06 6.751869e-06 6.659319e-06 4.879201e-06 4.427373e-06
 [891] 7.323124e-06 6.279764e-06 7.156400e-06 7.190823e-06 1.299752e-05
 [896] 1.752751e-05 1.370950e-05 1.131417e-05 2.017024e-05 1.719335e-06
 [901] 3.444973e-06 6.424506e-06 3.645206e-06 8.058931e-06 6.554335e-06
 [906] 1.544966e-05 8.012496e-06 1.237372e-05           NA           NA
 [911] 4.985432e-06 1.103700e-05 2.838897e-06 4.431983e-06 2.230983e-06
 [916] 9.760066e-07 6.988703e-06 7.015939e-06 1.490806e-05 1.531854e-05
 [921] 2.672651e-05 1.174348e-05 1.994320e-05 9.389633e-06 3.331523e-06
 [926] 7.302474e-06 2.201653e-06 2.923262e-06 1.211890e-05 5.888767e-06
 [931] 8.712498e-06           NA           NA 4.801858e-06 9.772452e-06
 [936] 5.372251e-06 5.110134e-06 4.501570e-06 2.817881e-06 6.467907e-06
 [941] 5.829053e-06 6.421468e-06 2.550037e-05 1.165386e-05           NA
 [946] 2.807896e-05 8.187794e-06 8.182496e-06 4.048273e-06 1.963344e-06
 [951] 1.661556e-06 2.374837e-06 9.698084e-06 1.344935e-05 1.865447e-05
 [956] 2.990288e-05 1.091269e-05 3.630149e-05 9.086541e-06 5.843054e-06
 [961] 4.797208e-06 3.345754e-06 6.024136e-06 5.546563e-06 4.066536e-06
 [966] 6.428014e-06 3.187426e-05           NA           NA 2.492983e-05
 [971] 7.644619e-06 4.645579e-06 3.895485e-06 5.829381e-06 9.880365e-06
 [976] 5.382005e-06 6.415759e-06 3.920738e-06 2.132828e-05 8.795663e-06
 [981] 2.240139e-05 1.270821e-05 3.090958e-06 7.164429e-06 7.616591e-06
 [986] 9.702589e-06 3.107082e-06 3.361855e-06 1.010593e-05 8.414885e-06
 [991] 1.455468e-05           NA           NA           NA 5.390240e-06
 [996] 1.617694e-05 6.575227e-06 2.456448e-06 5.820686e-06 3.290271e-06
[1001] 1.208002e-05 1.749566e-05 7.265214e-06           NA           NA
[1006]           NA 8.311011e-06 1.374566e-05 2.630338e-07 1.810209e-05
[1011] 3.131084e-06 1.097715e-05 1.474598e-05 1.268935e-05 1.751753e-06
[1016]           NA           NA           NA 7.017509e-06 1.870380e-05
[1021] 8.885865e-07 7.174424e-06 1.292651e-05 7.356073e-06 9.161576e-06
[1026] 8.991691e-06 1.695566e-05           NA           NA           NA
[1031] 8.821056e-06 4.121878e-06 4.577720e-06 3.911272e-06 3.262060e-06
[1036] 5.130722e-06 5.250057e-06 1.530687e-05 5.453396e-06           NA
[1041]           NA           NA           NA 1.568454e-05 9.129983e-06
[1046] 7.502102e-06 9.394393e-06 1.215988e-05 1.060428e-05 1.258846e-05
[1051] 3.138894e-05           NA           NA           NA           NA
[1056] 8.455809e-06 4.718148e-06 1.194560e-05 7.569211e-06 2.754002e-06
[1061] 5.089718e-06 1.119461e-05 2.083926e-05           NA           NA
[1066]           NA 1.283729e-06 4.533030e-06 2.838437e-06 8.997683e-06
[1071] 4.268094e-06 4.705280e-06 9.766946e-06 5.859018e-06 6.274081e-06
[1076]           NA           NA           NA 6.813247e-07 1.546344e-05
[1081] 3.851311e-06 7.165980e-06 1.318579e-05 2.838902e-06 1.887216e-05
[1086] 8.508524e-06 6.624609e-06           NA           NA           NA
[1091] 8.469759e-06 3.102726e-06 1.755601e-06 8.778905e-06 9.007430e-06
[1096] 6.522126e-06 1.275284e-05 1.134903e-05 1.639556e-05           NA
[1101]           NA           NA 3.583479e-06 8.351711e-06 2.725482e-06
[1106] 1.985068e-05 3.095485e-06 1.708365e-05 8.729332e-06 7.944741e-06
[1111] 1.296779e-05 3.232240e-06           NA           NA 8.011720e-06
[1116] 8.763029e-06 3.877605e-06 2.368789e-06 2.226350e-06 5.814971e-06
[1121] 1.353716e-05 1.219786e-05 1.630360e-05 3.978379e-05           NA
[1126]           NA 7.771632e-06 1.926480e-05 8.236442e-06 1.505659e-06
[1131] 6.650595e-06 5.038864e-06 6.008654e-06 8.501387e-06 1.059093e-05
[1136]           NA           NA           NA 1.501740e-05 7.702327e-06
[1141] 4.561065e-06 2.722455e-06 1.017310e-05 1.129154e-05 8.849149e-06
[1146] 4.961325e-06 3.856740e-06           NA           NA           NA
[1151] 1.845814e-05 3.328239e-06 8.494180e-06 1.421683e-05 2.047089e-06
[1156] 5.661465e-06 5.689742e-06 9.495676e-06 3.592229e-06           NA
[1161]           NA           NA 4.312386e-06 3.917964e-06 1.253441e-06
[1166] 1.525315e-05 2.408771e-06 5.107077e-06 9.357725e-06 1.054848e-05
[1171] 1.550861e-05           NA           NA           NA 5.867884e-06
[1176] 1.182687e-05 2.678205e-06 1.107293e-05 2.052837e-06 7.662352e-06
[1181] 5.487077e-06 1.137114e-05 3.978305e-06 6.071164e-06           NA
[1186] 6.537216e-06 5.210512e-06 6.472135e-06 7.606025e-06 9.088602e-06
[1191] 1.340146e-05 6.719894e-06 6.455207e-06 1.680069e-05 1.513707e-05
[1196]           NA           NA           NA 1.180454e-05 7.412886e-06
[1201] 9.865691e-06 3.672063e-06 1.658055e-06 5.138324e-06 4.062778e-06
[1206] 1.572602e-05 4.912401e-06 4.491063e-05           NA           NA
[1211] 6.717405e-06 7.797621e-06 8.620705e-06 1.521559e-06 6.003665e-06
[1216] 7.050648e-06 7.304385e-06 1.083418e-05 6.743596e-06           NA
[1221]           NA           NA 8.907691e-06 9.527628e-06 4.410484e-06
[1226] 7.256772e-06 1.092869e-05 3.345819e-06 3.983227e-06 1.391189e-05
[1231] 1.240930e-05           NA           NA           NA           NA
[1236] 2.965605e-06 3.336548e-06 6.449550e-06 1.709589e-06 4.143759e-06
[1241] 4.047842e-06 1.037146e-05 1.456690e-06           NA           NA
[1246]           NA           NA 1.116607e-05 9.104290e-06 5.206486e-06
[1251] 4.810639e-06 4.703130e-06 7.009689e-06 1.451255e-05 1.967740e-05
[1256]           NA           NA           NA           NA 9.830216e-06
[1261] 4.461029e-06 5.135963e-06 3.653016e-06 7.039161e-06 7.007736e-06
[1266] 1.110367e-05 6.911769e-06           NA           NA           NA
[1271] 9.071600e-06 1.296062e-05 9.502645e-06 5.492362e-06 5.335234e-06
[1276] 7.633975e-06 4.944332e-06 6.961611e-06 1.426640e-05 8.241973e-06
[1281]           NA           NA 1.178803e-05 1.198265e-05 6.796294e-06
[1286] 2.058078e-06 7.976223e-06 1.624636e-06 4.192022e-06 9.738316e-06
[1291] 4.853166e-06           NA           NA           NA           NA
[1296] 1.154609e-05 4.726424e-06 5.767060e-06 8.069015e-06 6.163169e-06
[1301] 2.857895e-06 9.337204e-06 1.860805e-05           NA           NA
[1306]           NA           NA 1.486175e-05 7.143326e-06 6.341042e-06
[1311] 1.990013e-05 7.798735e-06 6.744072e-06 1.467531e-05 1.220479e-05
[1316]           NA           NA           NA 3.648014e-06 9.296028e-06
[1321] 2.655781e-06 4.064547e-06 9.416704e-06 9.993602e-06 1.631653e-05
[1326] 1.847419e-05 2.191700e-06           NA           NA           NA
[1331]           NA 7.478553e-06 9.079074e-06 5.339205e-06 5.878333e-06
[1336] 3.768652e-06 4.136461e-06 8.185994e-06 1.246134e-05           NA
[1341]           NA           NA           NA 1.180069e-05 7.226748e-06
[1346] 1.078809e-05 3.583284e-06 1.234440e-05 6.737442e-06 1.062576e-05
[1351] 1.648122e-05           NA           NA           NA 6.893028e-06
[1356] 7.171547e-06 6.295809e-06 6.415172e-06 3.480036e-06 3.248400e-06
[1361] 1.164214e-05 1.175985e-05           NA           NA           NA
[1366]           NA           NA 1.255870e-05 1.233981e-05 7.190650e-06
[1371] 7.881195e-06 7.414969e-06 5.774662e-06 5.855140e-06           NA
[1376]           NA           NA           NA           NA 1.609531e-05
[1381] 5.310727e-06 5.626946e-06 3.375709e-06 9.277194e-06 9.224059e-06
[1386] 7.840901e-06 1.191860e-05           NA           NA           NA
[1391]           NA 1.525163e-05 6.459222e-06 6.185507e-06 7.131953e-06
[1396] 1.284409e-05 4.305626e-06 4.853470e-06 1.103861e-05           NA
[1401]           NA           NA           NA 1.560576e-05 1.134592e-05
[1406] 2.072180e-06 5.478395e-06 5.204315e-06 6.587314e-06 6.631213e-06
[1411] 1.527097e-05           NA           NA           NA           NA
[1416] 1.375824e-05 5.118631e-06 7.271035e-06 1.710998e-05 9.230728e-06
[1421] 1.497799e-05 1.343126e-05 1.341915e-06           NA           NA
[1426]           NA           NA 1.824022e-05 3.269836e-06 5.528882e-06
[1431] 5.003707e-06 9.044889e-06 1.334331e-05 9.303347e-06 1.590507e-05
[1436]           NA           NA           NA           NA 2.122015e-05
[1441] 1.295320e-05 6.033565e-06 5.263154e-06 4.120225e-06 6.684567e-06
[1446] 4.778745e-06 1.944096e-05           NA           NA           NA
[1451]           NA           NA 6.447749e-06 5.669213e-06 4.782318e-06
[1456] 1.361375e-05 1.226369e-05 3.539599e-06 6.838169e-06           NA
[1461]           NA           NA           NA 3.461585e-06 7.683549e-06
[1466] 1.823088e-06 6.757325e-06 8.134602e-06 5.288353e-06 9.867621e-06
[1471] 8.279996e-06           NA           NA           NA           NA
[1476] 1.052332e-05 6.698354e-06 1.034253e-05 4.463136e-06 9.973020e-06
[1481] 6.328092e-06 5.115036e-06 1.961017e-05           NA           NA
[1486]           NA           NA 4.982328e-06 9.777865e-06 6.838286e-06
[1491] 6.538159e-06 4.103431e-06 8.745858e-06 1.093945e-05 5.944083e-06
[1496]           NA           NA           NA           NA 6.960958e-06
[1501] 7.137980e-06 3.419960e-06 9.561147e-06 7.377360e-06 6.708555e-06
[1506] 6.390913e-06 7.413474e-06           NA           NA           NA
[1511]           NA 4.349152e-05 9.135251e-06 6.101177e-06 1.413517e-05
[1516] 9.622590e-06 7.021591e-06 1.126192e-05 3.172656e-05           NA
[1521]           NA           NA           NA 7.950598e-06 6.669919e-06
[1526] 8.772176e-06 6.642003e-06 4.351404e-06 4.336800e-06 1.352126e-05
[1531] 1.814016e-05           NA           NA           NA           NA
[1536] 1.443245e-05 1.280692e-05 1.107241e-05 5.552018e-06 1.628540e-05
[1541] 8.323243e-06 6.345226e-06           NA           NA           NA
[1546]           NA           NA 5.101454e-06 7.455541e-06 1.082989e-06
[1551] 6.438520e-06 9.109470e-06 7.893854e-06 3.327855e-06 1.791841e-05
[1556]           NA           NA           NA           NA 1.230006e-05
[1561] 6.018059e-06 1.494269e-05 5.753458e-06 6.667315e-06 1.070624e-05
[1566] 9.298510e-06 6.305294e-06           NA           NA           NA
[1571]           NA           NA 1.230794e-05 8.482870e-06 1.368882e-05
[1576] 3.897577e-06 5.894885e-06 1.036171e-05           NA           NA
[1581]           NA           NA           NA 9.807077e-06 4.515057e-06
[1586] 4.760146e-06 3.151973e-06 5.391560e-06 5.266169e-06 8.047273e-06
[1591] 4.446963e-06           NA           NA           NA           NA
[1596]           NA 6.524480e-06 2.870815e-06 1.542130e-05 4.336638e-06
[1601] 8.774675e-06 1.473164e-05           NA           NA           NA
[1606]           NA           NA           NA 8.639694e-06 1.332561e-05
[1611] 8.056633e-06 6.531970e-06 2.348772e-06 1.590584e-05           NA
[1616]           NA           NA           NA           NA 5.696110e-07
[1621] 2.104289e-05 1.391211e-05 8.333047e-06 3.473845e-06 7.525079e-06
[1626] 7.663023e-06           NA           NA           NA           NA
[1631]           NA           NA 1.067722e-05 7.006824e-06 8.850083e-06
[1636] 8.619197e-06 4.961807e-06 1.025806e-05           NA           NA
[1641]           NA           NA           NA           NA 9.440613e-06
[1646] 5.584087e-06 6.782861e-07 4.364108e-06 5.914252e-06 5.007159e-06
[1651] 8.698827e-06           NA           NA           NA           NA
[1656] 1.345571e-05 8.832433e-06 4.363582e-06 5.703974e-06 5.863669e-06
[1661] 7.568098e-06 1.114897e-05           NA           NA           NA
[1666]           NA           NA 1.573900e-05 7.177410e-06 8.216541e-06
[1671] 1.136578e-05 1.163525e-05 1.159235e-05 1.894555e-05           NA
[1676]           NA           NA           NA           NA           NA
Browse[1]> plot(data.all[128,64,])
Browse[1]> Q
> rm(list=ls())
> load('/Net/Groups/C-Side/MDI/tmp/jbuttlar/Cluster_jobs_debugging/_data/DataStructureMDI/workingData/CMIP5/Data/CanESM2/co2mass/error_debug_co2mass_Amon_CanESM2_esmFdbk1_r1i1p1_185001-198912.nc.rda')
> ls()
[1] "//Net/Groups/C-Side/MDI/tmp/jbuttlar/Cluster_jobs_debugging/_data/DataStructureMDI/workingData/CMIP5/Data/CanESM2/co2mass/error_debug_co2mass_Amon_CanESM2_esmFdbk1_r1i1p1_185001-198912.nc"
> debugger(get(ls()))
Message:  Error in apply(data.all, MAR = dims.cycle.id, fun.na) : 
  dims [product 1] do not match the length of object [1680]
Calls: source ... withVisible -> eval -> eval -> do.call -> DecomposeNcdf -> apply
Available environments had calls:
1: source("Skripte/Utils/Specdecomp/2_calculation.R", local = TRUE)
2: withVisible(eval(ei, envir))
3: eval(ei, envir)
4: eval(expr, envir, enclos)
5: do.call(paste(algorithm.type, "Ncdf", sep = ""), call.args)
6: DecomposeNcdf(borders.wl = list(c = c(361, Inf), a = c(11, 13), b = c(13, 3
7: apply(data.all, MAR = dims.cycle.id, fun.na)
8: dump.frames.mod(file.name = file.name, file.results = file.results)

Enter an environment number, or 0 to exit  Selection: 6
Browsing in the environment with call:
   DecomposeNcdf(borders.wl = list(c = c(361, Inf), a = c(11, 13), b = c(13, 3
Called from: debugger.look(ind)
Browse[1]> Available environments had calls:
1: source("Skripte/Utils/Specdecomp/2_calculation.R", local = TRUE)
2: withVisible(eval(ei, envir))
3: eval(ei, envir)
4: eval(expr, envir, enclos)
5: do.call(paste(algorithm.type, "Ncdf", sep = ""), call.args)
6: DecomposeNcdf(borders.wl = list(c = c(361, Inf), a = c(11, 13), b = c(13, 3
7: apply(data.all, MAR = dims.cycle.id, fun.na)
8: dump.frames.mod(file.name = file.name, file.results = file.results)

Enter an environment number, or 0 to exit  Selection: 
Selection: 6
Browsing in the environment with call:
   DecomposeNcdf(borders.wl = list(c = c(361, Inf), a = c(11, 13), b = c(13, 3
Called from: debugger.look(ind)
Browse[1]>     amnt.na                     <- apply(data.all, MAR = dims.cycle.id, fun.na)
Error in apply(data.all, MAR = dims.cycle.id, fun.na) : 
  dims [product 1] do not match the length of object [1680]
Error during wrapup: promise already under evaluation: recursive default argument reference or earlier problems?
Browse[1]> str(data.all)
 num [1:1680(1d)] 2.21e+15 2.22e+15 2.22e+15 2.22e+15 2.22e+15 ...
Browse[1]> file.name
[1] "co2mass_Amon_CanESM2_esmFdbk1_r1i1p1_185001-198912.nc"
Browse[1]> setwd('/Net/Groups/C-Side/MDI/_data/DataStructureMDI/workingData/CMIP5/Data/CanESM2/co2mass')
Browse[1]> con = open.nc(file.name)
Error: could not find function "open.nc"
Error during wrapup: promise already under evaluation: recursive default argument reference or earlier problems?
Browse[1]> library(RNetCDF)
Browse[1]> con = open.nc(file.name)
Browse[1]> ncdf.get.varinfo(con)
  id      name                unit n.dims      type n.values range 1.dim 2.dim
3  2   co2mass                  kg      1  NC_FLOAT        0        time  <NA>
1  0      time days since 1850-1-1      1 NC_DOUBLE        0        time  <NA>
2  1 time_bnds                          2 NC_DOUBLE        0        time  bnds
  dim.id.1 dim.id.2
3        0       NA
1        0       NA
2        1        0
Browse[1]> ncdf.get.diminfo(con)
  id name length      min      max    step
1  0 time   1680 18500116 19891112 2627970
2  1 bnds      2       NA       NA      NA
Browse[1]> str(data.all)
 num [1:1680(1d)] 2.21e+15 2.22e+15 2.22e+15 2.22e+15 2.22e+15 ...
Browse[1]> data.test <- array(data.all, dims=c(1,1680))
Error in array(data.all, dims = c(1, 1680)) : 
  unused argument(s) (dims = c(1, 1680))
Error during wrapup: promise already under evaluation: recursive default argument reference or earlier problems?
Browse[1]> data.test <- array(data.all, dim=c(1,1680))
Browse[1]> str(data.test)
 num [1, 1:1680] 2.21e+15 2.22e+15 2.22e+15 2.22e+15 2.22e+15 ...
Browse[1]> dims.cycle.id
integer(0)
Browse[1]> dims.cycle.id = 1
Browse[1]>     amnt.na                     <- apply(data.all, MAR = dims.cycle.id, fun.na)
Browse[1]> amnt.na
   [1] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
  [38] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
  [75] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 [112] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 [149] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 [186] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 [223] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 [260] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 [297] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 [334] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 [371] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 [408] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 [445] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 [482] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 [519] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 [556] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 [593] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 [630] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 [667] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 [704] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 [741] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 [778] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 [815] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 [852] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 [889] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 [926] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 [963] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
[1000] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
[1037] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
[1074] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
[1111] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
[1148] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
[1185] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
[1222] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
[1259] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
[1296] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
[1333] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
[1370] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
[1407] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
[1444] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
[1481] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
[1518] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
[1555] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
[1592] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
[1629] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
[1666] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
Browse[1] 
> [1] "time"
Browse[1] 
> [1] 1
Browse[1]> dims.cycle.id = 1
Browse[1]> dims.process.id = 2
Browse[1]> dims.cycle.n = 1
Browse[1] 
> + [1] 1680
Browse[1] 
> character(0)
Browse[1]>     fun.na <- function(x){sum(is.na(x)) / n.timesteps}
Browse[1]>     amnt.na                     <- apply(data.all, MAR = dims.cycle.id, fun.na)
Browse[1]>     slices.empty                <- amnt.na == 1
Browse[1]>     slices.valid                <- amnt.na == 0
Browse[1]>     slices.gappy                <- !slices.empty & !slices.valid
Browse[1]>     fun.zero <- function(x){
+       if (sum(is.na(x)) == length(x)) {
+         return(FALSE)
+       } else {
+         return(sum(abs(x) <  tresh.const, na.rm = TRUE) >= (1 - ratio.const)*length(na.omit(x)))
+       }
+     }
Browse[1]>     slices.zero                 <- as.vector(apply(data.all, MAR = dims.cycle.id, fun.zero))
Browse[1]>     slices.zero[is.na(slices.zero) & slices.empty] <- FALSE
Browse[1]>     fun.constant <- function(x){
+       if (sum(is.na(x)) == length(x)) {
+         return(FALSE)
+       } else {
+         return(diff(range(x, na.rm = TRUE)) == 0)
+       }  
+     }
Browse[1]>     slices.constant               <- apply(data.all, MAR = dims.cycle.id, fun.constant)
Browse[1]>     slices.constant[slices.gappy] <- FALSE
Browse[1]>     slices.zero[slices.gappy]     <- FALSE
Browse[1]> slices.constant
   [1] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
  [15] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
  [29] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
  [43] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
  [57] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
  [71] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
  [85] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
  [99] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [113] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [127] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [141] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [155] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [169] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [183] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [197] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [211] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [225] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [239] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [253] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [267] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [281] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [295] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [309] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [323] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [337] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [351] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [365] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [379] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [393] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [407] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [421] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [435] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [449] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [463] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [477] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [491] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [505] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [519] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [533] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [547] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [561] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [575] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [589] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [603] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [617] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [631] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [645] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [659] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [673] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [687] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [701] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [715] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [729] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [743] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [757] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [771] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [785] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [799] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [813] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [827] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [841] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [855] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [869] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [883] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [897] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [911] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [925] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [939] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [953] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [967] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [981] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
 [995] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
[1009] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
[1023] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
[1037] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
[1051] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
[1065] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
[1079] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
[1093] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
[1107] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
[1121] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
[1135] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
[1149] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
[1163] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
[1177] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
[1191] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
[1205] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
[1219] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
[1233] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
[1247] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
[1261] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
[1275] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
[1289] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
[1303] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
[1317] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
[1331] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
[1345] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
[1359] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
[1373] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
[1387] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
[1401] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
[1415] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
[1429] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
[1443] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
[1457] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
[1471] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
[1485] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
[1499] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
[1513] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
[1527] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
[1541] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
[1555] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
[1569] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
[1583] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
[1597] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
[1611] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
[1625] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
[1639] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
[1653] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
[1667] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
Browse[1] 
>    [1] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
  [38] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
  [75] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 [112] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 [149] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 [186] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 [223] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 [260] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 [297] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 [334] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 [371] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 [408] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 [445] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 [482] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 [519] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 [556] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 [593] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 [630] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 [667] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 [704] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 [741] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 [778] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 [815] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 [852] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 [889] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 [926] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 [963] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
[1000] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
[1037] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
[1074] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
[1111] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
[1148] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
[1185] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
[1222] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
[1259] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
[1296] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
[1333] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
[1370] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
[1407] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
[1444] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
[1481] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
[1518] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
[1555] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
[1592] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
[1629] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
[1666] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
Browse[1] 
> [1] 1
Browse[1]> dims.process.id
[1] 2
Browse[1]> dims.cycle.id
[1] 1
Browse[1]> str(data.all)
 num [1:1680(1d)] 2.21e+15 2.22e+15 2.22e+15 2.22e+15 2.22e+15 ...
Browse[1]> data.all = data.test
Browse[1]>     fun.na <- function(x){sum(is.na(x)) / n.timesteps}
Browse[1]>     amnt.na                     <- apply(data.all, MAR = dims.cycle.id, fun.na)
Browse[1]> amnt.na
[1] 0
Browse[1] 
> Browse[1]> Browse[1]> Browse[1]> Browse[1]> + ... + Browse[1]> Browse[1]> Browse[1]> + ... + Browse[1]> Browse[1]> Browse[1]> Browse[1] 
> + + Browse[1]> + + Browse[1]> + + Browse[1]> Browse[1]> Browse[1]> + + + Browse[1] 
> Browse[1]> + Error in 1:dims.cycle.length[i] : NA/NaN argument
Error during wrapup: promise already under evaluation: recursive default argument reference or earlier problems?
Browse[1]> Browse[1]> Browse[1]> Browse[1]> Browse[1]> Browse[1]> Error in `colnames<-`(`*tmp*`, value = "iter.nr") : 
  length of 'dimnames' [2] not equal to array extent
Error during wrapup: promise already under evaluation: recursive default argument reference or earlier problems?
Browse[1]> Error in iter.grid[, "iter.nr"] <- 1:n.iters : 
  no 'dimnames' attribute for array
Error during wrapup: promise already under evaluation: recursive default argument reference or earlier problems?
Browse[1]> Error: (subscript) logical subscript too long
Error during wrapup: promise already under evaluation: recursive default argument reference or earlier problems?
Browse[1]> Browse[1]> + Browse[1]> Browse[1]> Browse[1]> + ... + Browse[1]>     args.expand.grid       <- alist()
Browse[1]>     for (i in 1:dims.cycle.n)
+         args.expand.grid[[i]] <- 1:dims.cycle.length[i]
Error in 1:dims.cycle.length[i] : NA/NaN argument
Error during wrapup: promise already under evaluation: recursive default argument reference or earlier problems?
Browse[1]> slices.process
[1] TRUE
Browse[1] 
> integer(0)
Browse[1] 
> [1] 1
Browse[1]> dims.cycle.length
integer(0)
Browse[1]> dims.cycle.length=1
Browse[1] 
> + Browse[1]>     iter.grid.all          <- as.matrix(do.call("expand.grid", args.expand.grid))
Browse[1]>     n.slices               <- dim(iter.grid.all)[1]
Browse[1]>     n.iters                <- sum(slices.process)
Browse[1]>     max.cores              <- min(c(max.cores, n.iters))
Browse[1]>     iter.grid              <- matrix(1, nrow = n.iters, ncol = length(dims.cycle.id) + 1)
Browse[1]>     colnames(iter.grid)    <- c('iter.nr', dims.cycle.name)
Error in `colnames<-`(`*tmp*`, value = "iter.nr") : 
  length of 'dimnames' [2] not equal to array extent
Error during wrapup: promise already under evaluation: recursive default argument reference or earlier problems?
Browse[1] 
>      [,1] [,2]
[1,]    1    1
Browse[1]>     colnames(iter.grid)    <- c('iter.nr', dims.cycle.name)
Error in `colnames<-`(`*tmp*`, value = "iter.nr") : 
  length of 'dimnames' [2] not equal to array extent
Error during wrapup: promise already under evaluation: recursive default argument reference or earlier problems?
Browse[1] 
> character(0)
Browse[1]> dims.cycle.name = 'Kalle'
Browse[1]>     colnames(iter.grid)    <- c('iter.nr', dims.cycle.name)
Browse[1]>     iter.grid[,'iter.nr']  <- 1:n.iters
Browse[1]>     iter.grid[, dims.cycle.id + 1] <- iter.grid.all[slices.process, ]
Browse[1]>     iters.per.cyc          <- rep(floor(n.iters/max.cores), times = max.cores)
Browse[1]>     if (!(n.iters %% max.cores) == 0)
+         iters.per.cyc[1:((n.iters %% max.cores))] <- floor(n.iters / max.cores) + 1
Browse[1]>     iter.gridind           <- matrix(NA, ncol = 2, nrow = max.cores)
Browse[1]>     colnames(iter.gridind) <- c('first.iter','last.iter')
Browse[1]>     if (max.cores > 1)  {
+         iter.gridind[, 1]  <- (cumsum(iters.per.cyc) + 1) - iters.per.cyc
+         iter.gridind[, 2]  <- cumsum(iters.per.cyc)
+     } else {
+         iter.gridind[1, ]  <- c(1, n.iters)
+     }
Browse[1] 
>      first.iter last.iter
[1,]          1         1
Browse[1] 
> + ... + Browse[1]>     abind.mod=function(...)abind(..., along=3)
Browse[1]>         RegisterParallel(package.parallel, max.cores)
foreach: simple, scalable parallel programming from Revolution Analytics
Use Revolution R for scalability, fault tolerance and more.
http://www.revolutionanalytics.com

Attaching package: ‘multicore’

The following object(s) are masked from ‘package:tools’:

    SIGCHLD, SIGSTOP, SIGUSR1, SIGUSR2

Registering 1 cores.
Browse[1] 
> + + 2012-11-30 19:33:34 : Starting calculation: Decomposing 1 timeseries of length 1680. 
Browse[1] 
> + ... + 2012-11-30 19:33:42 : Finished ~100%. 
Error in structure(function (series, borders.wl, M = rep(floor(length(series)/3),  : 
  Only numeric objects are allowed for series (e.g. no ts, zoo, etc ... objects )!
[1] "Error occoured at iteration 1 and loop 1!"
No traceback available 
[1] "Saving workspace to file workspace_error_co2mass_Amon_CanESM2_esmFdbk1_r1i1p1_185001-198912.nc_1_1.rda"
Browse[1]> series
Error: object 'series' not found
Error during wrapup: promise already under evaluation: recursive default argument reference or earlier problems?
Browse[1]> Q
> load('workspace_error_co2mass_Amon_CanESM2_esmFdbk1_r1i1p1_185001-198912.nc_1_1.rda')
> ls()
[1] "//Net/Groups/C-Side/MDI/tmp/jbuttlar/Cluster_jobs_debugging/_data/DataStructureMDI/workingData/CMIP5/Data/CanESM2/co2mass/error_debug_co2mass_Amon_CanESM2_esmFdbk1_r1i1p1_185001-198912.nc"
[2] "w"                                                                                                                                                                                          
[3] "workspace_error_co2mass_Amon_CanESM2_esmFdbk1_r1i1p1_185001-198912.nc_1_1"                                                                                                                  
> debugger(get(ls()[3])
+ )
Message:  Error in structure(function (series, borders.wl, M = rep(floor(length(series)/3),  : 
  Only numeric objects are allowed for series (e.g. no ts, zoo, etc ... objects )!
Available environments had calls:
1: debugger(get(ls()))
2: debugger.look(ind)
3: foreach(i = 1:max.cores, .combine = abind.mod, .multicombine = TRUE) %dopar
4: e$fun(obj, substitute(ex), parent.frame(), e$data)
5: mclapply(argsList, FUN, mc.preschedule = preschedule, mc.set.seed = set.see
6: lapply(X, FUN, ...)
7: FUN(X[[1]], ...)
8: tryCatch(eval(c.expr, envir = args, enclos = envir), error = function(e) e)
9: tryCatchList(expr, classes, parentenv, handlers)
10: tryCatchOne(expr, names, parentenv, handlers[[1]])
11: doTryCatch(return(expr), name, parentenv, handler)
12: eval(c.expr, envir = args, enclos = envir)
13: eval(expr, envir, enclos)
14: calcs.iter(iter.nr = i, file.name = file.name, n.timesteps = n.timesteps, n

Enter an environment number, or 0 to exit  Selection: 14
Browsing in the environment with call:
   calcs.iter(iter.nr = i, file.name = file.name, n.timesteps = n.timesteps, n
Called from: debugger.look(ind)
Browse[1]> Available environments had calls:
1: debugger(get(ls()))
2: debugger.look(ind)
3: foreach(i = 1:max.cores, .combine = abind.mod, .multicombine = TRUE) %dopar
4: e$fun(obj, substitute(ex), parent.frame(), e$data)
5: mclapply(argsList, FUN, mc.preschedule = preschedule, mc.set.seed = set.see
6: lapply(X, FUN, ...)
7: FUN(X[[1]], ...)
8: tryCatch(eval(c.expr, envir = args, enclos = envir), error = function(e) e)
9: tryCatchList(expr, classes, parentenv, handlers)
10: tryCatchOne(expr, names, parentenv, handlers[[1]])
11: doTryCatch(return(expr), name, parentenv, handler)
12: eval(c.expr, envir = args, enclos = envir)
13: eval(expr, envir, enclos)
14: calcs.iter(iter.nr = i, file.name = file.name, n.timesteps = n.timesteps, n

Enter an environment number, or 0 to exit  Selection: 
Selection: 14
Browsing in the environment with call:
   calcs.iter(iter.nr = i, file.name = file.name, n.timesteps = n.timesteps, n
Called from: debugger.look(ind)
Browse[1]> ls()
 [1] "args.call"           "args.call.t"         "data.all.t"         
 [4] "data.results.iter"   "data.results.iter.t" "dim.process.id"     
 [7] "dims.cycle.id"       "dims.cycle.n"        "error.from.calc"    
[10] "file.con.t"          "file.name"           "file.name.t"        
[13] "i"                   "ind.extract"         "ind.total"          
[16] "iter.grid"           "iter.ind"            "iter.nr"            
[19] "j"                   "n.bands"             "n.timesteps"        
[22] "system.info"         "trace.save"          "var.name"           
Browse[1]> args.call
$borders.wl
$borders.wl$c
[1] 361 Inf

$borders.wl$a
[1] 11 13

$borders.wl$b
[1]  13 360

$borders.wl$d
[1]  0 11


$M
[1] 600 144 144  72

$harmonics
[1] 0 4 0 0

$n.comp
[1] 20 30 20 20

$pad.series
[1] 0 0

$print.stat
[1] FALSE

$plot.spectra
[1] FALSE

$center.series
[1] TRUE

$repeat.extr
[1] 2 1 1 1

$debugging
[1] TRUE

Browse[1]> args.call.t
$borders.wl
$borders.wl$c
[1] 361 Inf

$borders.wl$a
[1] 11 13

$borders.wl$b
[1]  13 360

$borders.wl$d
[1]  0 11


$M
[1] 600 144 144  72

$harmonics
[1] 0 4 0 0

$n.comp
[1] 20 30 20 20

$pad.series
[1] 0 0

$print.stat
[1] FALSE

$plot.spectra
[1] FALSE

$center.series
[1] TRUE

$repeat.extr
[1] 2 1 1 1

$debugging
[1] TRUE

$series
   [1] 2.214055e+15 2.215836e+15 2.217619e+15 2.219464e+15 2.221310e+15
   [6] 2.223158e+15 2.225007e+15 2.226888e+15 2.228740e+15 2.230594e+15
  [11] 2.232449e+15 2.234306e+15 2.236195e+15 2.237994e+15 2.239795e+15
  [16] 2.241658e+15 2.243523e+15 2.245390e+15 2.247257e+15 2.249157e+15
  [21] 2.251028e+15 2.252900e+15 2.254774e+15 2.256649e+15 2.258557e+15
  [26] 2.260374e+15 2.262193e+15 2.264075e+15 2.265958e+15 2.267843e+15
  [31] 2.269730e+15 2.271649e+15 2.273538e+15 2.275429e+15 2.277322e+15
  [36] 2.279216e+15 2.281143e+15 2.282978e+15 2.284815e+15 2.286715e+15
  [41] 2.288618e+15 2.290522e+15 2.292427e+15 2.294365e+15 2.296273e+15
  [46] 2.298183e+15 2.300095e+15 2.302008e+15 2.303954e+15 2.305808e+15
  [51] 2.307663e+15 2.309583e+15 2.311504e+15 2.313427e+15 2.315351e+15
  [56] 2.317309e+15 2.319236e+15 2.321165e+15 2.323096e+15 2.325028e+15
  [61] 2.326993e+15 2.328865e+15 2.330740e+15 2.332679e+15 2.334619e+15
  [66] 2.336561e+15 2.338505e+15 2.340482e+15 2.342429e+15 2.344377e+15
  [71] 2.346327e+15 2.348278e+15 2.350264e+15 2.352154e+15 2.354047e+15
  [76] 2.356005e+15 2.357965e+15 2.359927e+15 2.361890e+15 2.363887e+15
  [81] 2.365853e+15 2.367821e+15 2.369790e+15 2.371761e+15 2.373766e+15
  [86] 2.375676e+15 2.377587e+15 2.379565e+15 2.381545e+15 2.383526e+15
  [91] 2.385509e+15 2.387526e+15 2.389511e+15 2.391499e+15 2.393488e+15
  [96] 2.395479e+15 2.397504e+15 2.399433e+15 2.401363e+15 2.403361e+15
 [101] 2.405360e+15 2.407361e+15 2.409364e+15 2.411401e+15 2.413407e+15
 [106] 2.415414e+15 2.417423e+15 2.419434e+15 2.421479e+15 2.423427e+15
 [111] 2.425377e+15 2.427395e+15 2.429414e+15 2.431435e+15 2.433458e+15
 [116] 2.435515e+15 2.437541e+15 2.439568e+15 2.441597e+15 2.443628e+15
 [121] 2.445694e+15 2.447662e+15 2.449631e+15 2.451669e+15 2.453708e+15
 [126] 2.455750e+15 2.457792e+15 2.459870e+15 2.461916e+15 2.463963e+15
 [131] 2.466013e+15 2.468064e+15 2.470151e+15 2.472138e+15 2.474127e+15
 [136] 2.476186e+15 2.478246e+15 2.480307e+15 2.482370e+15 2.484469e+15
 [141] 2.486535e+15 2.488603e+15 2.490674e+15 2.492745e+15 2.494853e+15
 [146] 2.496859e+15 2.498868e+15 2.500947e+15 2.503028e+15 2.505110e+15
 [151] 2.507194e+15 2.509313e+15 2.511401e+15 2.513489e+15 2.515580e+15
 [156] 2.517673e+15 2.519801e+15 2.521828e+15 2.523857e+15 2.525957e+15
 [161] 2.528058e+15 2.530161e+15 2.532265e+15 2.534407e+15 2.536514e+15
 [166] 2.538624e+15 2.540736e+15 2.542849e+15 2.544999e+15 2.547047e+15
 [171] 2.549096e+15 2.551216e+15 2.553338e+15 2.555463e+15 2.557588e+15
 [176] 2.559751e+15 2.561880e+15 2.564011e+15 2.566143e+15 2.568277e+15
 [181] 2.570449e+15 2.572517e+15 2.574586e+15 2.576729e+15 2.578872e+15
 [186] 2.581017e+15 2.583164e+15 2.585348e+15 2.587498e+15 2.589651e+15
 [191] 2.591804e+15 2.593961e+15 2.596153e+15 2.598242e+15 2.600333e+15
 [196] 2.602496e+15 2.604661e+15 2.606827e+15 2.608996e+15 2.611202e+15
 [201] 2.613374e+15 2.615547e+15 2.617723e+15 2.619900e+15 2.622115e+15
 [206] 2.624224e+15 2.626335e+15 2.628521e+15 2.630707e+15 2.632896e+15
 [211] 2.635086e+15 2.637314e+15 2.639507e+15 2.641703e+15 2.643900e+15
 [216] 2.646099e+15 2.648336e+15 2.650467e+15 2.652599e+15 2.654806e+15
 [221] 2.657015e+15 2.659225e+15 2.661437e+15 2.663687e+15 2.665902e+15
 [226] 2.668120e+15 2.670339e+15 2.672560e+15 2.674819e+15 2.676971e+15
 [231] 2.679125e+15 2.681354e+15 2.683585e+15 2.685817e+15 2.688051e+15
 [236] 2.690323e+15 2.692561e+15 2.694800e+15 2.697042e+15 2.699286e+15
 [241] 2.701568e+15 2.703741e+15 2.705917e+15 2.708167e+15 2.710421e+15
 [246] 2.712675e+15 2.714932e+15 2.717227e+15 2.719487e+15 2.721749e+15
 [251] 2.724013e+15 2.726278e+15 2.728583e+15 2.730779e+15 2.732976e+15
 [256] 2.735249e+15 2.737525e+15 2.739802e+15 2.742081e+15 2.744399e+15
 [261] 2.746682e+15 2.748967e+15 2.751253e+15 2.753541e+15 2.755869e+15
 [266] 2.758086e+15 2.760305e+15 2.762602e+15 2.764900e+15 2.767200e+15
 [271] 2.769501e+15 2.771843e+15 2.774149e+15 2.776456e+15 2.778765e+15
 [276] 2.781076e+15 2.783428e+15 2.785667e+15 2.787908e+15 2.790228e+15
 [281] 2.792549e+15 2.794872e+15 2.797197e+15 2.799562e+15 2.801890e+15
 [286] 2.804221e+15 2.806553e+15 2.808887e+15 2.811262e+15 2.813524e+15
 [291] 2.815787e+15 2.818130e+15 2.820474e+15 2.822821e+15 2.825169e+15
 [296] 2.827557e+15 2.829909e+15 2.832262e+15 2.834619e+15 2.836976e+15
 [301] 2.839375e+15 2.841659e+15 2.843946e+15 2.846312e+15 2.848679e+15
 [306] 2.851049e+15 2.853420e+15 2.855833e+15 2.858208e+15 2.860586e+15
 [311] 2.862965e+15 2.865346e+15 2.867768e+15 2.870075e+15 2.872385e+15
 [316] 2.874774e+15 2.877166e+15 2.879559e+15 2.881955e+15 2.884391e+15
 [321] 2.886790e+15 2.889191e+15 2.891595e+15 2.894000e+15 2.896446e+15
 [326] 2.898776e+15 2.901109e+15 2.903522e+15 2.905938e+15 2.908355e+15
 [331] 2.910774e+15 2.913235e+15 2.915658e+15 2.918083e+15 2.920510e+15
 [336] 2.922939e+15 2.925411e+15 2.927764e+15 2.930119e+15 2.932557e+15
 [341] 2.934997e+15 2.937439e+15 2.939882e+15 2.942367e+15 2.944815e+15
 [346] 2.947264e+15 2.949715e+15 2.952169e+15 2.954665e+15 2.957042e+15
 [351] 2.959421e+15 2.961883e+15 2.964347e+15 2.966813e+15 2.969281e+15
 [356] 2.971791e+15 2.974263e+15 2.976737e+15 2.979213e+15 2.981691e+15
 [361] 2.984212e+15 2.986612e+15 2.989015e+15 2.991502e+15 2.993990e+15
 [366] 2.996481e+15 2.998974e+15 3.001509e+15 3.004005e+15 3.006504e+15
 [371] 3.009005e+15 3.011507e+15 3.014054e+15 3.016478e+15 3.018905e+15
 [376] 3.021417e+15 3.023930e+15 3.026446e+15 3.028963e+15 3.031524e+15
 [381] 3.034045e+15 3.036569e+15 3.039095e+15 3.041623e+15 3.044194e+15
 [386] 3.046643e+15 3.049094e+15 3.051631e+15 3.054170e+15 3.056710e+15
 [391] 3.059253e+15 3.061840e+15 3.064386e+15 3.066935e+15 3.069485e+15
 [396] 3.072039e+15 3.074637e+15 3.077109e+15 3.079585e+15 3.082147e+15
 [401] 3.084712e+15 3.087277e+15 3.089845e+15 3.092458e+15 3.095030e+15
 [406] 3.097604e+15 3.100181e+15 3.102760e+15 3.105382e+15 3.107881e+15
 [411] 3.110381e+15 3.112969e+15 3.115559e+15 3.118150e+15 3.120744e+15
 [416] 3.123382e+15 3.125980e+15 3.128580e+15 3.131183e+15 3.133787e+15
 [421] 3.136436e+15 3.138959e+15 3.141485e+15 3.144098e+15 3.146715e+15
 [426] 3.149332e+15 3.151951e+15 3.154616e+15 3.157240e+15 3.159866e+15
 [431] 3.162494e+15 3.165125e+15 3.167801e+15 3.170349e+15 3.172900e+15
 [436] 3.175539e+15 3.178181e+15 3.180825e+15 3.183471e+15 3.186162e+15
 [441] 3.188812e+15 3.191465e+15 3.194119e+15 3.196776e+15 3.199479e+15
 [446] 3.202052e+15 3.204628e+15 3.207295e+15 3.209963e+15 3.212633e+15
 [451] 3.215305e+15 3.218024e+15 3.220700e+15 3.223379e+15 3.226061e+15
 [456] 3.228744e+15 3.231474e+15 3.234073e+15 3.236675e+15 3.239368e+15
 [461] 3.242063e+15 3.244760e+15 3.247459e+15 3.250204e+15 3.252907e+15
 [466] 3.255613e+15 3.258320e+15 3.261031e+15 3.263788e+15 3.266414e+15
 [471] 3.269041e+15 3.271761e+15 3.274483e+15 3.277207e+15 3.279933e+15
 [476] 3.282706e+15 3.285437e+15 3.288169e+15 3.290904e+15 3.293642e+15
 [481] 3.296425e+15 3.299078e+15 3.301732e+15 3.304479e+15 3.307228e+15
 [486] 3.309979e+15 3.312733e+15 3.315533e+15 3.318291e+15 3.321051e+15
 [491] 3.323813e+15 3.326578e+15 3.329391e+15 3.332069e+15 3.334750e+15
 [496] 3.337524e+15 3.340301e+15 3.343079e+15 3.345860e+15 3.348689e+15
 [501] 3.351474e+15 3.354261e+15 3.357051e+15 3.359843e+15 3.362684e+15
 [506] 3.365389e+15 3.368097e+15 3.370900e+15 3.373703e+15 3.376510e+15
 [511] 3.379318e+15 3.382175e+15 3.384989e+15 3.387804e+15 3.390622e+15
 [516] 3.393443e+15 3.396311e+15 3.399043e+15 3.401778e+15 3.404608e+15
 [521] 3.407440e+15 3.410275e+15 3.413111e+15 3.415997e+15 3.418839e+15
 [526] 3.421682e+15 3.424528e+15 3.427377e+15 3.430274e+15 3.433034e+15
 [531] 3.435796e+15 3.438654e+15 3.441515e+15 3.444378e+15 3.447243e+15
 [536] 3.450157e+15 3.453027e+15 3.455899e+15 3.458773e+15 3.461650e+15
 [541] 3.464577e+15 3.467364e+15 3.470154e+15 3.473041e+15 3.475930e+15
 [546] 3.478822e+15 3.481715e+15 3.484659e+15 3.487557e+15 3.490458e+15
 [551] 3.493361e+15 3.496267e+15 3.499223e+15 3.502038e+15 3.504855e+15
 [556] 3.507771e+15 3.510690e+15 3.513609e+15 3.516532e+15 3.519505e+15
 [561] 3.522432e+15 3.525363e+15 3.528295e+15 3.531230e+15 3.534215e+15
 [566] 3.537059e+15 3.539904e+15 3.542849e+15 3.545796e+15 3.548746e+15
 [571] 3.551698e+15 3.554700e+15 3.557657e+15 3.560616e+15 3.563578e+15
 [576] 3.566542e+15 3.569557e+15 3.572429e+15 3.575303e+15 3.578277e+15
 [581] 3.581254e+15 3.584233e+15 3.587215e+15 3.590248e+15 3.593234e+15
 [586] 3.596222e+15 3.599213e+15 3.602207e+15 3.605253e+15 3.608153e+15
 [591] 3.611056e+15 3.614060e+15 3.617067e+15 3.620076e+15 3.623087e+15
 [596] 3.626150e+15 3.629166e+15 3.632184e+15 3.635206e+15 3.638229e+15
 [601] 3.641305e+15 3.644234e+15 3.647167e+15 3.650201e+15 3.653237e+15
 [606] 3.656277e+15 3.659318e+15 3.662412e+15 3.665458e+15 3.668506e+15
 [611] 3.671558e+15 3.674612e+15 3.677718e+15 3.680676e+15 3.683639e+15
 [616] 3.686702e+15 3.689770e+15 3.692839e+15 3.695911e+15 3.699036e+15
 [621] 3.702112e+15 3.705191e+15 3.708273e+15 3.711357e+15 3.714496e+15
 [626] 3.717484e+15 3.720475e+15 3.723570e+15 3.726667e+15 3.729767e+15
 [631] 3.732870e+15 3.736026e+15 3.739133e+15 3.742243e+15 3.745356e+15
 [636] 3.748471e+15 3.751641e+15 3.754659e+15 3.757680e+15 3.760806e+15
 [641] 3.763935e+15 3.767065e+15 3.770199e+15 3.773386e+15 3.776525e+15
 [646] 3.779666e+15 3.782810e+15 3.785956e+15 3.789157e+15 3.792205e+15
 [651] 3.795256e+15 3.798414e+15 3.801574e+15 3.804736e+15 3.807901e+15
 [656] 3.811120e+15 3.814290e+15 3.817463e+15 3.820638e+15 3.823815e+15
 [661] 3.827049e+15 3.830127e+15 3.833209e+15 3.836398e+15 3.839589e+15
 [666] 3.842783e+15 3.845979e+15 3.849231e+15 3.852433e+15 3.855637e+15
 [671] 3.858844e+15 3.862054e+15 3.865319e+15 3.868429e+15 3.871541e+15
 [676] 3.874761e+15 3.877985e+15 3.881211e+15 3.884440e+15 3.887724e+15
 [681] 3.890957e+15 3.894194e+15 3.897433e+15 3.900674e+15 3.903972e+15
 [686] 3.907112e+15 3.910256e+15 3.913510e+15 3.916765e+15 3.920023e+15
 [691] 3.923284e+15 3.926601e+15 3.929867e+15 3.933135e+15 3.936407e+15
 [696] 3.939681e+15 3.943012e+15 3.946183e+15 3.949359e+15 3.952645e+15
 [701] 3.955932e+15 3.959224e+15 3.962516e+15 3.965867e+15 3.969166e+15
 [706] 3.972467e+15 3.975772e+15 3.979077e+15 3.982441e+15 3.985645e+15
 [711] 3.988853e+15 3.992171e+15 3.995492e+15 3.998816e+15 4.002142e+15
 [716] 4.005525e+15 4.008857e+15 4.012191e+15 4.015528e+15 4.018869e+15
 [721] 4.022266e+15 4.025502e+15 4.028741e+15 4.032093e+15 4.035447e+15
 [726] 4.038804e+15 4.042163e+15 4.045581e+15 4.048946e+15 4.052314e+15
 [731] 4.055684e+15 4.059058e+15 4.062489e+15 4.065757e+15 4.069028e+15
 [736] 4.072413e+15 4.075802e+15 4.079192e+15 4.082585e+15 4.086037e+15
 [741] 4.089435e+15 4.092836e+15 4.096241e+15 4.099649e+15 4.103113e+15
 [746] 4.106415e+15 4.109718e+15 4.113138e+15 4.116560e+15 4.119983e+15
 [751] 4.123410e+15 4.126897e+15 4.130330e+15 4.133765e+15 4.137203e+15
 [756] 4.140645e+15 4.144145e+15 4.147479e+15 4.150816e+15 4.154269e+15
 [761] 4.157725e+15 4.161184e+15 4.164645e+15 4.168166e+15 4.171633e+15
 [766] 4.175103e+15 4.178575e+15 4.182050e+15 4.185586e+15 4.188954e+15
 [771] 4.192324e+15 4.195811e+15 4.199302e+15 4.202795e+15 4.206292e+15
 [776] 4.209847e+15 4.213349e+15 4.216854e+15 4.220360e+15 4.223872e+15
 [781] 4.227442e+15 4.230843e+15 4.234247e+15 4.237770e+15 4.241296e+15
 [786] 4.244823e+15 4.248354e+15 4.251946e+15 4.255483e+15 4.259022e+15
 [791] 4.262564e+15 4.266110e+15 4.269716e+15 4.273152e+15 4.276589e+15
 [796] 4.280148e+15 4.283709e+15 4.287272e+15 4.290838e+15 4.294466e+15
 [801] 4.298037e+15 4.301612e+15 4.305190e+15 4.308771e+15 4.312414e+15
 [806] 4.315883e+15 4.319355e+15 4.322949e+15 4.326545e+15 4.330144e+15
 [811] 4.333746e+15 4.337410e+15 4.341018e+15 4.344629e+15 4.348243e+15
 [816] 4.351859e+15 4.355538e+15 4.359043e+15 4.362549e+15 4.366178e+15
 [821] 4.369811e+15 4.373446e+15 4.377083e+15 4.380784e+15 4.384428e+15
 [826] 4.388075e+15 4.391725e+15 4.395377e+15 4.399094e+15 4.402632e+15
 [831] 4.406174e+15 4.409840e+15 4.413509e+15 4.417180e+15 4.420854e+15
 [836] 4.424592e+15 4.428272e+15 4.431956e+15 4.435642e+15 4.439332e+15
 [841] 4.443085e+15 4.446659e+15 4.450236e+15 4.453938e+15 4.457644e+15
 [846] 4.461352e+15 4.465063e+15 4.468838e+15 4.472555e+15 4.476275e+15
 [851] 4.479998e+15 4.483724e+15 4.487515e+15 4.491125e+15 4.494739e+15
 [856] 4.498478e+15 4.502220e+15 4.505965e+15 4.509714e+15 4.513526e+15
 [861] 4.517281e+15 4.521038e+15 4.524799e+15 4.528563e+15 4.532391e+15
 [866] 4.536037e+15 4.539686e+15 4.543463e+15 4.547242e+15 4.551025e+15
 [871] 4.554811e+15 4.558662e+15 4.562453e+15 4.566248e+15 4.570046e+15
 [876] 4.573848e+15 4.577714e+15 4.581397e+15 4.585083e+15 4.588898e+15
 [881] 4.592715e+15 4.596536e+15 4.600359e+15 4.604248e+15 4.608078e+15
 [886] 4.611911e+15 4.615747e+15 4.619586e+15 4.623491e+15 4.627210e+15
 [891] 4.630933e+15 4.634786e+15 4.638642e+15 4.642501e+15 4.646362e+15
 [896] 4.650290e+15 4.654159e+15 4.658029e+15 4.661904e+15 4.665782e+15
 [901] 4.669727e+15 4.673483e+15 4.677244e+15 4.681134e+15 4.685029e+15
 [906] 4.688926e+15 4.692826e+15 4.696794e+15 4.700700e+15 4.704610e+15
 [911] 4.708523e+15 4.712440e+15 4.716424e+15 4.720218e+15 4.724016e+15
 [916] 4.727946e+15 4.731879e+15 4.735816e+15 4.739755e+15 4.743762e+15
 [921] 4.747707e+15 4.751656e+15 4.755608e+15 4.759564e+15 4.763588e+15
 [926] 4.767420e+15 4.771256e+15 4.775225e+15 4.779197e+15 4.783173e+15
 [931] 4.787152e+15 4.791199e+15 4.795184e+15 4.799173e+15 4.803164e+15
 [936] 4.807160e+15 4.811225e+15 4.815095e+15 4.818969e+15 4.822977e+15
 [941] 4.826990e+15 4.831006e+15 4.835023e+15 4.839111e+15 4.843137e+15
 [946] 4.847164e+15 4.851196e+15 4.855231e+15 4.859336e+15 4.863245e+15
 [951] 4.867158e+15 4.871207e+15 4.875259e+15 4.879315e+15 4.883374e+15
 [956] 4.887503e+15 4.891568e+15 4.895636e+15 4.899708e+15 4.903784e+15
 [961] 4.907930e+15 4.911877e+15 4.915830e+15 4.919919e+15 4.924012e+15
 [966] 4.928108e+15 4.932208e+15 4.936378e+15 4.940483e+15 4.944592e+15
 [971] 4.948705e+15 4.952821e+15 4.957008e+15 4.960995e+15 4.964988e+15
 [976] 4.969119e+15 4.973252e+15 4.977389e+15 4.981530e+15 4.985741e+15
 [981] 4.989888e+15 4.994039e+15 4.998192e+15 5.002349e+15 5.006579e+15
 [986] 5.010607e+15 5.014637e+15 5.018810e+15 5.022984e+15 5.027164e+15
 [991] 5.031345e+15 5.035598e+15 5.039787e+15 5.043978e+15 5.048174e+15
 [996] 5.052372e+15 5.056644e+15 5.060712e+15 5.064784e+15 5.068997e+15
[1001] 5.073215e+15 5.077435e+15 5.081658e+15 5.085954e+15 5.090184e+15
[1006] 5.094419e+15 5.098656e+15 5.102897e+15 5.107210e+15 5.111319e+15
[1011] 5.115432e+15 5.119687e+15 5.123947e+15 5.128209e+15 5.132475e+15
[1016] 5.136814e+15 5.141087e+15 5.145363e+15 5.149643e+15 5.153925e+15
[1021] 5.158284e+15 5.162433e+15 5.166586e+15 5.170885e+15 5.175186e+15
[1026] 5.179491e+15 5.183800e+15 5.188182e+15 5.192497e+15 5.196816e+15
[1031] 5.201139e+15 5.205464e+15 5.209865e+15 5.214057e+15 5.218253e+15
[1036] 5.222593e+15 5.226938e+15 5.231287e+15 5.235638e+15 5.240064e+15
[1041] 5.244423e+15 5.248785e+15 5.253150e+15 5.257520e+15 5.261965e+15
[1046] 5.266198e+15 5.270435e+15 5.274820e+15 5.279208e+15 5.283600e+15
[1051] 5.287994e+15 5.292465e+15 5.296867e+15 5.301272e+15 5.305682e+15
[1056] 5.310095e+15 5.314584e+15 5.318860e+15 5.323139e+15 5.327567e+15
[1061] 5.331999e+15 5.336435e+15 5.340874e+15 5.345390e+15 5.349835e+15
[1066] 5.354286e+15 5.358739e+15 5.363196e+15 5.367731e+15 5.372050e+15
[1071] 5.376371e+15 5.380843e+15 5.385320e+15 5.389799e+15 5.394282e+15
[1076] 5.398843e+15 5.403334e+15 5.407828e+15 5.412326e+15 5.416828e+15
[1081] 5.421408e+15 5.425768e+15 5.430134e+15 5.434652e+15 5.439173e+15
[1086] 5.443698e+15 5.448226e+15 5.452832e+15 5.457367e+15 5.461906e+15
[1091] 5.466449e+15 5.470997e+15 5.475622e+15 5.480026e+15 5.484435e+15
[1096] 5.488999e+15 5.493564e+15 5.498134e+15 5.502708e+15 5.507360e+15
[1101] 5.511941e+15 5.516526e+15 5.521113e+15 5.525707e+15 5.530379e+15
[1106] 5.534827e+15 5.539280e+15 5.543888e+15 5.548500e+15 5.553116e+15
[1111] 5.557735e+15 5.562434e+15 5.567060e+15 5.571691e+15 5.576326e+15
[1116] 5.580964e+15 5.585682e+15 5.590176e+15 5.594673e+15 5.599327e+15
[1121] 5.603985e+15 5.608647e+15 5.613312e+15 5.618058e+15 5.622731e+15
[1126] 5.627408e+15 5.632089e+15 5.636772e+15 5.641538e+15 5.646078e+15
[1131] 5.650619e+15 5.655321e+15 5.660025e+15 5.664734e+15 5.669444e+15
[1136] 5.674238e+15 5.678958e+15 5.683682e+15 5.688408e+15 5.693140e+15
[1141] 5.697954e+15 5.702537e+15 5.707125e+15 5.711873e+15 5.716625e+15
[1146] 5.721381e+15 5.726140e+15 5.730981e+15 5.735748e+15 5.740519e+15
[1151] 5.745293e+15 5.750071e+15 5.754934e+15 5.759563e+15 5.764197e+15
[1156] 5.768992e+15 5.773791e+15 5.778594e+15 5.783401e+15 5.788290e+15
[1161] 5.793105e+15 5.797924e+15 5.802746e+15 5.807573e+15 5.812483e+15
[1166] 5.817158e+15 5.821838e+15 5.826683e+15 5.831529e+15 5.836381e+15
[1171] 5.841236e+15 5.846174e+15 5.851036e+15 5.855903e+15 5.860774e+15
[1176] 5.865648e+15 5.870608e+15 5.875329e+15 5.880058e+15 5.884950e+15
[1181] 5.889845e+15 5.894744e+15 5.899648e+15 5.904636e+15 5.909546e+15
[1186] 5.914462e+15 5.919381e+15 5.924305e+15 5.929315e+15 5.934083e+15
[1191] 5.938857e+15 5.943799e+15 5.948743e+15 5.953692e+15 5.958644e+15
[1196] 5.963682e+15 5.968642e+15 5.973606e+15 5.978575e+15 5.983548e+15
[1201] 5.988607e+15 5.993423e+15 5.998246e+15 6.003236e+15 6.008231e+15
[1206] 6.013229e+15 6.018230e+15 6.023319e+15 6.028329e+15 6.033342e+15
[1211] 6.038360e+15 6.043384e+15 6.048493e+15 6.053358e+15 6.058228e+15
[1216] 6.063269e+15 6.068313e+15 6.073361e+15 6.078413e+15 6.083552e+15
[1221] 6.088612e+15 6.093676e+15 6.098745e+15 6.103817e+15 6.108978e+15
[1226] 6.113893e+15 6.118811e+15 6.123902e+15 6.128997e+15 6.134095e+15
[1231] 6.139197e+15 6.144387e+15 6.149498e+15 6.154613e+15 6.159731e+15
[1236] 6.164855e+15 6.170067e+15 6.175031e+15 6.180000e+15 6.185141e+15
[1241] 6.190286e+15 6.195435e+15 6.200589e+15 6.205832e+15 6.210992e+15
[1246] 6.216159e+15 6.221329e+15 6.226503e+15 6.231769e+15 6.236782e+15
[1251] 6.241799e+15 6.246991e+15 6.252189e+15 6.257390e+15 6.262594e+15
[1256] 6.267890e+15 6.273103e+15 6.278321e+15 6.283542e+15 6.288770e+15
[1261] 6.294086e+15 6.299150e+15 6.304218e+15 6.309462e+15 6.314711e+15
[1266] 6.319963e+15 6.325220e+15 6.330569e+15 6.335833e+15 6.341104e+15
[1271] 6.346378e+15 6.351657e+15 6.357027e+15 6.362141e+15 6.367260e+15
[1276] 6.372557e+15 6.377858e+15 6.383163e+15 6.388474e+15 6.393874e+15
[1281] 6.399192e+15 6.404515e+15 6.409842e+15 6.415174e+15 6.420597e+15
[1286] 6.425763e+15 6.430932e+15 6.436282e+15 6.441637e+15 6.446995e+15
[1291] 6.452357e+15 6.457813e+15 6.463184e+15 6.468560e+15 6.473940e+15
[1296] 6.479324e+15 6.484804e+15 6.490021e+15 6.495241e+15 6.500645e+15
[1301] 6.506054e+15 6.511465e+15 6.516881e+15 6.522391e+15 6.527816e+15
[1306] 6.533245e+15 6.538680e+15 6.544118e+15 6.549651e+15 6.554919e+15
[1311] 6.560194e+15 6.565652e+15 6.571113e+15 6.576580e+15 6.582050e+15
[1316] 6.587614e+15 6.593094e+15 6.598578e+15 6.604067e+15 6.609560e+15
[1321] 6.615147e+15 6.620470e+15 6.625795e+15 6.631309e+15 6.636825e+15
[1326] 6.642346e+15 6.647870e+15 6.653491e+15 6.659025e+15 6.664564e+15
[1331] 6.670107e+15 6.675655e+15 6.681298e+15 6.686675e+15 6.692054e+15
[1336] 6.697621e+15 6.703194e+15 6.708770e+15 6.714349e+15 6.720026e+15
[1341] 6.725615e+15 6.731209e+15 6.736808e+15 6.742412e+15 6.748114e+15
[1346] 6.753542e+15 6.758974e+15 6.764597e+15 6.770225e+15 6.775857e+15
[1351] 6.781492e+15 6.787226e+15 6.792871e+15 6.798521e+15 6.804176e+15
[1356] 6.809836e+15 6.815594e+15 6.821076e+15 6.826565e+15 6.832243e+15
[1361] 6.837928e+15 6.843615e+15 6.849308e+15 6.855099e+15 6.860800e+15
[1366] 6.866506e+15 6.872217e+15 6.877935e+15 6.883749e+15 6.889286e+15
[1371] 6.894829e+15 6.900566e+15 6.906307e+15 6.912051e+15 6.917801e+15
[1376] 6.923649e+15 6.929408e+15 6.935172e+15 6.940940e+15 6.946713e+15
[1381] 6.952586e+15 6.958180e+15 6.963777e+15 6.969571e+15 6.975369e+15
[1386] 6.981172e+15 6.986978e+15 6.992886e+15 6.998702e+15 7.004524e+15
[1391] 7.010350e+15 7.016182e+15 7.022112e+15 7.027762e+15 7.033416e+15
[1396] 7.039267e+15 7.045123e+15 7.050983e+15 7.056849e+15 7.062814e+15
[1401] 7.068689e+15 7.074568e+15 7.080453e+15 7.086343e+15 7.092334e+15
[1406] 7.098040e+15 7.103750e+15 7.109659e+15 7.115574e+15 7.121494e+15
[1411] 7.127418e+15 7.133442e+15 7.139376e+15 7.145314e+15 7.151258e+15
[1416] 7.157207e+15 7.163257e+15 7.169020e+15 7.174787e+15 7.180756e+15
[1421] 7.186731e+15 7.192708e+15 7.198692e+15 7.204778e+15 7.210771e+15
[1426] 7.216768e+15 7.222770e+15 7.228778e+15 7.234891e+15 7.240709e+15
[1431] 7.246535e+15 7.252564e+15 7.258598e+15 7.264635e+15 7.270678e+15
[1436] 7.276825e+15 7.282877e+15 7.288935e+15 7.294998e+15 7.301067e+15
[1441] 7.307238e+15 7.313117e+15 7.319001e+15 7.325090e+15 7.331184e+15
[1446] 7.337282e+15 7.343385e+15 7.349594e+15 7.355707e+15 7.361824e+15
[1451] 7.367948e+15 7.374077e+15 7.380312e+15 7.386248e+15 7.392191e+15
[1456] 7.398340e+15 7.404496e+15 7.410655e+15 7.416819e+15 7.423090e+15
[1461] 7.429264e+15 7.435443e+15 7.441628e+15 7.447817e+15 7.454114e+15
[1466] 7.460111e+15 7.466113e+15 7.472324e+15 7.478540e+15 7.484761e+15
[1471] 7.490987e+15 7.497321e+15 7.503557e+15 7.509798e+15 7.516044e+15
[1476] 7.522296e+15 7.528656e+15 7.534711e+15 7.540774e+15 7.547048e+15
[1481] 7.553327e+15 7.559609e+15 7.565897e+15 7.572293e+15 7.578592e+15
[1486] 7.584895e+15 7.591204e+15 7.597519e+15 7.603942e+15 7.610058e+15
[1491] 7.616183e+15 7.622518e+15 7.628860e+15 7.635205e+15 7.641557e+15
[1496] 7.648017e+15 7.654377e+15 7.660745e+15 7.667117e+15 7.673495e+15
[1501] 7.679981e+15 7.686160e+15 7.692343e+15 7.698743e+15 7.705148e+15
[1506] 7.711556e+15 7.717971e+15 7.724498e+15 7.730922e+15 7.737352e+15
[1511] 7.743787e+15 7.750230e+15 7.756782e+15 7.763021e+15 7.769267e+15
[1516] 7.775731e+15 7.782199e+15 7.788672e+15 7.795152e+15 7.801742e+15
[1521] 7.808230e+15 7.814726e+15 7.821226e+15 7.827730e+15 7.834349e+15
[1526] 7.840650e+15 7.846959e+15 7.853488e+15 7.860022e+15 7.866560e+15
[1531] 7.873102e+15 7.879759e+15 7.886313e+15 7.892873e+15 7.899437e+15
[1536] 7.906009e+15 7.912692e+15 7.919057e+15 7.925430e+15 7.932023e+15
[1541] 7.938621e+15 7.945225e+15 7.951834e+15 7.958557e+15 7.965177e+15
[1546] 7.971801e+15 7.978431e+15 7.985069e+15 7.991819e+15 7.998247e+15
[1551] 8.004685e+15 8.011342e+15 8.018008e+15 8.024678e+15 8.031352e+15
[1556] 8.038142e+15 8.044828e+15 8.051519e+15 8.058217e+15 8.064919e+15
[1561] 8.071738e+15 8.078232e+15 8.084730e+15 8.091456e+15 8.098188e+15
[1566] 8.104924e+15 8.111665e+15 8.118524e+15 8.125276e+15 8.132035e+15
[1571] 8.138798e+15 8.145568e+15 8.152456e+15 8.159014e+15 8.165577e+15
[1576] 8.172371e+15 8.179170e+15 8.185974e+15 8.192783e+15 8.199709e+15
[1581] 8.206529e+15 8.213355e+15 8.220186e+15 8.227024e+15 8.233981e+15
[1586] 8.240603e+15 8.247233e+15 8.254094e+15 8.260962e+15 8.267834e+15
[1591] 8.274710e+15 8.281706e+15 8.288595e+15 8.295489e+15 8.302388e+15
[1596] 8.309294e+15 8.316320e+15 8.323010e+15 8.329704e+15 8.336635e+15
[1601] 8.343571e+15 8.350512e+15 8.357457e+15 8.364523e+15 8.371481e+15
[1606] 8.378443e+15 8.385411e+15 8.392388e+15 8.399482e+15 8.406238e+15
[1611] 8.413002e+15 8.420002e+15 8.427007e+15 8.434017e+15 8.441032e+15
[1616] 8.448168e+15 8.455195e+15 8.462227e+15 8.469266e+15 8.476313e+15
[1621] 8.483477e+15 8.490302e+15 8.497133e+15 8.504201e+15 8.511276e+15
[1626] 8.518356e+15 8.525442e+15 8.532650e+15 8.539747e+15 8.546851e+15
[1631] 8.553959e+15 8.561074e+15 8.568313e+15 8.575206e+15 8.582104e+15
[1636] 8.589244e+15 8.596389e+15 8.603541e+15 8.610696e+15 8.617977e+15
[1641] 8.625145e+15 8.632318e+15 8.639500e+15 8.646685e+15 8.653996e+15
[1646] 8.660957e+15 8.667926e+15 8.675136e+15 8.682354e+15 8.689576e+15
[1651] 8.696804e+15 8.704157e+15 8.711396e+15 8.718642e+15 8.725893e+15
[1656] 8.733152e+15 8.740536e+15 8.747568e+15 8.754606e+15 8.761888e+15
[1661] 8.769177e+15 8.776471e+15 8.783770e+15 8.791197e+15 8.798509e+15
[1666] 8.805828e+15 8.813152e+15 8.820484e+15 8.827940e+15 8.835043e+15
[1671] 8.842151e+15 8.849508e+15 8.856869e+15 8.864235e+15 8.871609e+15
[1676] 8.879109e+15 8.886495e+15 8.893886e+15 8.901284e+15 8.908688e+15

Browse[1]> str(args.call.t)
List of 11
 $ borders.wl   :List of 4
  ..$ c: num [1:2] 361 Inf
  ..$ a: num [1:2] 11 13
  ..$ b: num [1:2] 13 360
  ..$ d: num [1:2] 0 11
 $ M            : num [1:4] 600 144 144 72
 $ harmonics    : num [1:4] 0 4 0 0
 $ n.comp       : num [1:4] 20 30 20 20
 $ pad.series   : num [1:2] 0 0
 $ print.stat   : logi FALSE
 $ plot.spectra : logi FALSE
 $ center.series: logi TRUE
 $ repeat.extr  : num [1:4] 2 1 1 1
 $ debugging    : logi TRUE
 $ series       : num [1:1680(1d)] 2.21e+15 2.22e+15 2.22e+15 2.22e+15 2.22e+15 ...
Browse[1]>                         series.decomp           <- do.call(FilterTSeriesSSA, args.call.t)
Error in function (series, borders.wl, M = rep(floor(length(series)/3),  : 
  Only numeric objects are allowed for series (e.g. no ts, zoo, etc ... objects )!
Error during wrapup: promise already under evaluation: recursive default argument reference or earlier problems?
Browse[1]> args.call.t<<- args.call.t
Browse[1]> Q
> library(spectral.methods)
>                         series.decomp           <- do.call(FilterTSeriesSSA, args.call.t)
Error in function (series, borders.wl, M = rep(floor(length(series)/3),  : 
  Only numeric objects are allowed for series (e.g. no ts, zoo, etc ... objects )!
Error during wrapup: promise already under evaluation: recursive default argument reference or earlier problems?
> library(debug)
> mtrace(FilterTseriesSSA)
Error in mtrace(FilterTseriesSSA) : Can't find FilterTseriesSSA
Error during wrapup: promise already under evaluation: recursive default argument reference or earlier problems?
> mtrace(FilterTSeriesSSA)
Loading required package: parser
>                         series.decomp           <- do.call(FilterTSeriesSSA, args.call.t)

D(2)> 
[1] FALSE

D(2)> 
[1] FALSE

D(2)> 
[1] FALSE

D(2)> 
[1] FALSE

D(2)> 
[1] FALSE

D(2)> 
[1] FALSE

D(2)> 
[1] FALSE

D(2)> 
[1] FALSE

D(2)> 
[1] FALSE

D(2)> 
[1] FALSE

D(2)> 
[1] FALSE

D(2)> 
[1] FALSE

D(2)> 
[1] FALSE

D(2)> 
                 c1  c2  a1  a2  b1  b2  d1  d2                                 
  0   4   0   0 361 Inf  11  13  13 360   0  11 600 144 144  72  20  30  20  20 
                        
  0   4   0   0   0   0 

D(2)> 
                 c1  a1  a2  b1  b2  d1  d2                                     
  0   4   0   0 361  11  13  13 360   0  11 600 144 144  72  20  30  20  20   0 
                    
  4   0   0   0   0 

D(2)> 
[1] FALSE

D(2)> 
[1] FALSE

D(2)> 
[1] FALSE

D(2)> 
[1] 0

D(2)> 
[1] TRUE

D(2)> 
Error in eval(expr, envir, enclos) : 
  Only numeric objects are allowed for series (e.g. no ts, zoo, etc ... objects )!

D(2)> class(series)
[1] "array"

D(2)> str(series)
 num [1:1680(1d)] 2.21e+15 2.22e+15 2.22e+15 2.22e+15 2.22e+15 ...
NULL

D(2)> series[1
Error in parse(text = command, srcfile = NULL) : 
  2:0: unexpected end of input
1: series[1
  ^

D(2)> series[1]
[1] 2.214055e+15

D(2)> series[1:100]
  [1] 2.214055e+15 2.215836e+15 2.217619e+15 2.219464e+15 2.221310e+15
  [6] 2.223158e+15 2.225007e+15 2.226888e+15 2.228740e+15 2.230594e+15
 [11] 2.232449e+15 2.234306e+15 2.236195e+15 2.237994e+15 2.239795e+15
 [16] 2.241658e+15 2.243523e+15 2.245390e+15 2.247257e+15 2.249157e+15
 [21] 2.251028e+15 2.252900e+15 2.254774e+15 2.256649e+15 2.258557e+15
 [26] 2.260374e+15 2.262193e+15 2.264075e+15 2.265958e+15 2.267843e+15
 [31] 2.269730e+15 2.271649e+15 2.273538e+15 2.275429e+15 2.277322e+15
 [36] 2.279216e+15 2.281143e+15 2.282978e+15 2.284815e+15 2.286715e+15
 [41] 2.288618e+15 2.290522e+15 2.292427e+15 2.294365e+15 2.296273e+15
 [46] 2.298183e+15 2.300095e+15 2.302008e+15 2.303954e+15 2.305808e+15
 [51] 2.307663e+15 2.309583e+15 2.311504e+15 2.313427e+15 2.315351e+15
 [56] 2.317309e+15 2.319236e+15 2.321165e+15 2.323096e+15 2.325028e+15
 [61] 2.326993e+15 2.328865e+15 2.330740e+15 2.332679e+15 2.334619e+15
 [66] 2.336561e+15 2.338505e+15 2.340482e+15 2.342429e+15 2.344377e+15
 [71] 2.346327e+15 2.348278e+15 2.350264e+15 2.352154e+15 2.354047e+15
 [76] 2.356005e+15 2.357965e+15 2.359927e+15 2.361890e+15 2.363887e+15
 [81] 2.365853e+15 2.367821e+15 2.369790e+15 2.371761e+15 2.373766e+15
 [86] 2.375676e+15 2.377587e+15 2.379565e+15 2.381545e+15 2.383526e+15
 [91] 2.385509e+15 2.387526e+15 2.389511e+15 2.391499e+15 2.393488e+15
 [96] 2.395479e+15 2.397504e+15 2.399433e+15 2.401363e+15 2.403361e+15

D(2)> qqq()
NULL
No Error: merely quitting mvb's debugger
Error during wrapup: promise already under evaluation: recursive default argument reference or earlier problems?
> ls()
[1] "args.call.t"                                                                                                                                                                                
[2] "//Net/Groups/C-Side/MDI/tmp/jbuttlar/Cluster_jobs_debugging/_data/DataStructureMDI/workingData/CMIP5/Data/CanESM2/co2mass/error_debug_co2mass_Amon_CanESM2_esmFdbk1_r1i1p1_185001-198912.nc"
[3] "w"                                                                                                                                                                                          
[4] "workspace_error_co2mass_Amon_CanESM2_esmFdbk1_r1i1p1_185001-198912.nc_1_1"                                                                                                                  
> debugger(get(ls()[4])
+ )
Message:  Error in structure(function (series, borders.wl, M = rep(floor(length(series)/3),  : 
  Only numeric objects are allowed for series (e.g. no ts, zoo, etc ... objects )!
Available environments had calls:
1: debugger(get(ls()))
2: debugger.look(ind)
3: foreach(i = 1:max.cores, .combine = abind.mod, .multicombine = TRUE) %dopar
4: e$fun(obj, substitute(ex), parent.frame(), e$data)
5: mclapply(argsList, FUN, mc.preschedule = preschedule, mc.set.seed = set.see
6: lapply(X, FUN, ...)
7: FUN(X[[1]], ...)
8: tryCatch(eval(c.expr, envir = args, enclos = envir), error = function(e) e)
9: tryCatchList(expr, classes, parentenv, handlers)
10: tryCatchOne(expr, names, parentenv, handlers[[1]])
11: doTryCatch(return(expr), name, parentenv, handler)
12: eval(c.expr, envir = args, enclos = envir)
13: eval(expr, envir, enclos)
14: calcs.iter(iter.nr = i, file.name = file.name, n.timesteps = n.timesteps, n

Enter an environment number, or 0 to exit  Selection: 14
Browsing in the environment with call:
   calcs.iter(iter.nr = i, file.name = file.name, n.timesteps = n.timesteps, n
Called from: debugger.look(ind)
Browse[1]> Available environments had calls:
1: debugger(get(ls()))
2: debugger.look(ind)
3: foreach(i = 1:max.cores, .combine = abind.mod, .multicombine = TRUE) %dopar
4: e$fun(obj, substitute(ex), parent.frame(), e$data)
5: mclapply(argsList, FUN, mc.preschedule = preschedule, mc.set.seed = set.see
6: lapply(X, FUN, ...)
7: FUN(X[[1]], ...)
8: tryCatch(eval(c.expr, envir = args, enclos = envir), error = function(e) e)
9: tryCatchList(expr, classes, parentenv, handlers)
10: tryCatchOne(expr, names, parentenv, handlers[[1]])
11: doTryCatch(return(expr), name, parentenv, handler)
12: eval(c.expr, envir = args, enclos = envir)
13: eval(expr, envir, enclos)
14: calcs.iter(iter.nr = i, file.name = file.name, n.timesteps = n.timesteps, n

Enter an environment number, or 0 to exit  Selection: 
Selection: 14
Browsing in the environment with call:
   calcs.iter(iter.nr = i, file.name = file.name, n.timesteps = n.timesteps, n
Called from: debugger.look(ind)
Browse[1]>                         args.call.t             <- args.call
Browse[1]>                         args.call.t[['series']] <- as.numeric(do.call('[', ind.extract))
Browse[1]> str(args.call.t)
List of 11
 $ borders.wl   :List of 4
  ..$ c: num [1:2] 361 Inf
  ..$ a: num [1:2] 11 13
  ..$ b: num [1:2] 13 360
  ..$ d: num [1:2] 0 11
 $ M            : num [1:4] 600 144 144 72
 $ harmonics    : num [1:4] 0 4 0 0
 $ n.comp       : num [1:4] 20 30 20 20
 $ pad.series   : num [1:2] 0 0
 $ print.stat   : logi FALSE
 $ plot.spectra : logi FALSE
 $ center.series: logi TRUE
 $ repeat.extr  : num [1:4] 2 1 1 1
 $ debugging    : logi TRUE
 $ series       : num [1:1680] 2.21e+15 2.22e+15 2.22e+15 2.22e+15 2.22e+15 ...
Browse[1]>                         series.decomp           <- do.call(FilterTSeriesSSA, args.call.t)

D(4)> go()
NULL
[1] FALSE
Loading required package: Rssa
Loading required package: lattice

Attaching package: ‘lattice’

The following object(s) are masked from ‘package:multicore’:

    parallel

Loading required package: svd

Attaching package: ‘Rssa’

The following object(s) are masked from ‘package:stats’:

    decompose

Browse[1]> Q
> ls()
[1] "args.call.t"                                                                                                                                                                                
[2] "//Net/Groups/C-Side/MDI/tmp/jbuttlar/Cluster_jobs_debugging/_data/DataStructureMDI/workingData/CMIP5/Data/CanESM2/co2mass/error_debug_co2mass_Amon_CanESM2_esmFdbk1_r1i1p1_185001-198912.nc"
[3] "w"                                                                                                                                                                                          
[4] "workspace_error_co2mass_Amon_CanESM2_esmFdbk1_r1i1p1_185001-198912.nc_1_1"                                                                                                                  
> debugger(get(ls()[2])
+ )
Message:  Error in apply(data.all, MAR = dims.cycle.id, fun.na) : 
  dims [product 1] do not match the length of object [1680]
Calls: source ... withVisible -> eval -> eval -> do.call -> DecomposeNcdf -> apply
Available environments had calls:
1: source("Skripte/Utils/Specdecomp/2_calculation.R", local = TRUE)
2: withVisible(eval(ei, envir))
3: eval(ei, envir)
4: eval(expr, envir, enclos)
5: do.call(paste(algorithm.type, "Ncdf", sep = ""), call.args)
6: DecomposeNcdf(borders.wl = list(c = c(361, Inf), a = c(11, 13), b = c(13, 3
7: apply(data.all, MAR = dims.cycle.id, fun.na)
8: dump.frames.mod(file.name = file.name, file.results = file.results)

Enter an environment number, or 0 to exit  Selection: 6
Browsing in the environment with call:
   DecomposeNcdf(borders.wl = list(c = c(361, Inf), a = c(11, 13), b = c(13, 3
Called from: debugger.look(ind)
Browse[1]> Available environments had calls:
1: source("Skripte/Utils/Specdecomp/2_calculation.R", local = TRUE)
2: withVisible(eval(ei, envir))
3: eval(ei, envir)
4: eval(expr, envir, enclos)
5: do.call(paste(algorithm.type, "Ncdf", sep = ""), call.args)
6: DecomposeNcdf(borders.wl = list(c = c(361, Inf), a = c(11, 13), b = c(13, 3
7: apply(data.all, MAR = dims.cycle.id, fun.na)
8: dump.frames.mod(file.name = file.name, file.results = file.results)

Enter an environment number, or 0 to exit  Selection: 
Selection: 6
Browsing in the environment with call:
   DecomposeNcdf(borders.wl = list(c = c(361, Inf), a = c(11, 13), b = c(13, 3
Called from: debugger.look(ind)
Browse[1] 
> integer(0)
Browse[1]> str(data.all)
 num [1:1680(1d)] 2.21e+15 2.22e+15 2.22e+15 2.22e+15 2.22e+15 ...
Browse[1]> dim(data.all)
[1] 1680
Browse[1] 
> Browse[1]> Browse[1]> Browse[1]> Browse[1]> Browse[1]> + Browse[1] 
> [1] 1680
Browse[1] 
> integer(0)
Browse[1] 
> Browse[1]> Browse[1]> Browse[1]>        dims.cycle.id     <- 1
Browse[1]>        dims.cycle.name   <- 'series'
Browse[1]>        dim.process.id    <- 2
Browse[1]>        data.all          <- array(data.all, dim = c(1, length(data.all)))
Browse[1]>     dims.cycle.n      <- length(dims.cycle.id)
Browse[1]>     dims.cycle.length <- dim(data.all)[dims.cycle.id]
Browse[1]>     n.timesteps       <- dims.info[match('time', dims.info$name), 3]
Browse[1] 
> [1] 1
Browse[1] 
> [1] 1
Browse[1] 
> [1] 1
Browse[1] 
> [1] 1
Browse[1] 
> [1] 1680
Browse[1] 
> + 2012-11-30 19:48:33 : Identifying valid cells ... 
Browse[1]> Browse[1]> Browse[1]> Browse[1]> Browse[1]> Browse[1]> + ... + Browse[1]> Browse[1]> Browse[1]> + ... + Browse[1]> Browse[1]> Browse[1]> Browse[1] 
> + + Browse[1]> + + Browse[1]> + + Browse[1]> Browse[1]> Browse[1]> + + + Browse[1] 
> Browse[1]> + Browse[1]> Browse[1]> Browse[1]> Browse[1]> Browse[1]> Browse[1]> Browse[1]> Browse[1]> Browse[1]> Browse[1]> + Browse[1]> Browse[1]> Browse[1]> + ... + Browse[1]>         RegisterParallel(package.parallel, max.cores)
Registering 1 cores.
Browse[1] 
> + ... + Error in match.fun(.combine) : object 'abind.mod' not found
Error during wrapup: promise already under evaluation: recursive default argument reference or earlier problems?
Browse[1]>     abind.mod=function(...)abind(..., along=3)
Browse[1] 
> + ... + Error in calcs.iter(iter.nr = i, file.name = file.name, n.timesteps = n.timesteps,  : 
  task 1 failed - "could not find function "calcs.iter""
Error during wrapup: promise already under evaluation: recursive default argument reference or earlier problems?
Browse[1] 
> + ... + Browse[1] 
> + ... + 2012-11-30 19:49:21 : Finished ~100%. 
Error in structure(c(2214054969999360, 2215836307685376, 2217618584895488,  : 
  incorrect number of dimensions
[1] "Error occoured at iteration 1 and loop 1!"
No traceback available 
[1] "Saving workspace to file workspace_error_co2mass_Amon_CanESM2_esmFdbk1_r1i1p1_185001-198912.nc_1_1.rda"
Browse[1]> Q
> load('workspace_error_co2mass_Amon_CanESM2_esmFdbk1_r1i1p1_185001-198912.nc_1_1.rda'
+ ls()
Error: unexpected symbol in:
"load('workspace_error_co2mass_Amon_CanESM2_esmFdbk1_r1i1p1_185001-198912.nc_1_1.rda'
ls"
Error during wrapup: promise already under evaluation: recursive default argument reference or earlier problems?
> load('workspace_error_co2mass_Amon_CanESM2_esmFdbk1_r1i1p1_185001-198912.nc_1_1.rda')
> ls( )
[1] "args.call.t"                                                                                                                                                                                
[2] "//Net/Groups/C-Side/MDI/tmp/jbuttlar/Cluster_jobs_debugging/_data/DataStructureMDI/workingData/CMIP5/Data/CanESM2/co2mass/error_debug_co2mass_Amon_CanESM2_esmFdbk1_r1i1p1_185001-198912.nc"
[3] "w"                                                                                                                                                                                          
[4] "workspace_error_co2mass_Amon_CanESM2_esmFdbk1_r1i1p1_185001-198912.nc_1_1"                                                                                                                  
> debugger(get(ls())[4]
+ )
'dump' is not an object of class 'dump.frames'
> rm(list=ls())
> load('workspace_error_co2mass_Amon_CanESM2_esmFdbk1_r1i1p1_185001-198912.nc_1_1.rda'
+ )
> ls()
[1] "workspace_error_co2mass_Amon_CanESM2_esmFdbk1_r1i1p1_185001-198912.nc_1_1"
> debugger(get(ls()))
Message:  Error in structure(c(2214054969999360, 2215836307685376, 2217618584895488,  : 
  incorrect number of dimensions
Available environments had calls:
1: debugger(get(ls()[2]))
2: debugger.look(ind)
3: foreach(i = 1:max.cores, .combine = abind.mod, .multicombine = TRUE) %dopar
4: e$fun(obj, substitute(ex), parent.frame(), e$data)
5: mclapply(argsList, FUN, mc.preschedule = preschedule, mc.set.seed = set.see
6: lapply(X, FUN, ...)
7: FUN(X[[1]], ...)
8: tryCatch(eval(c.expr, envir = args, enclos = envir), error = function(e) e)
9: tryCatchList(expr, classes, parentenv, handlers)
10: tryCatchOne(expr, names, parentenv, handlers[[1]])
11: doTryCatch(return(expr), name, parentenv, handler)
12: eval(c.expr, envir = args, enclos = envir)
13: eval(expr, envir, enclos)
14: calcs.iter(iter.nr = i, file.name = file.name, n.timesteps = n.timesteps, n

Enter an environment number, or 0 to exit  Selection: 14
Browsing in the environment with call:
   calcs.iter(iter.nr = i, file.name = file.name, n.timesteps = n.timesteps, n
Called from: debugger.look(ind)
Browse[1]> Available environments had calls:
1: debugger(get(ls()[2]))
2: debugger.look(ind)
3: foreach(i = 1:max.cores, .combine = abind.mod, .multicombine = TRUE) %dopar
4: e$fun(obj, substitute(ex), parent.frame(), e$data)
5: mclapply(argsList, FUN, mc.preschedule = preschedule, mc.set.seed = set.see
6: lapply(X, FUN, ...)
7: FUN(X[[1]], ...)
8: tryCatch(eval(c.expr, envir = args, enclos = envir), error = function(e) e)
9: tryCatchList(expr, classes, parentenv, handlers)
10: tryCatchOne(expr, names, parentenv, handlers[[1]])
11: doTryCatch(return(expr), name, parentenv, handler)
12: eval(c.expr, envir = args, enclos = envir)
13: eval(expr, envir, enclos)
14: calcs.iter(iter.nr = i, file.name = file.name, n.timesteps = n.timesteps, n

Enter an environment number, or 0 to exit  Selection: 
Selection: 14
Browsing in the environment with call:
   calcs.iter(iter.nr = i, file.name = file.name, n.timesteps = n.timesteps, n
Called from: debugger.look(ind)
Browse[1]> args.call.t
$borders.wl
$borders.wl$c
[1] 361 Inf

$borders.wl$a
[1] 11 13

$borders.wl$b
[1]  13 360

$borders.wl$d
[1]  0 11


$M
[1] 600 144 144  72

$harmonics
[1] 0 4 0 0

$n.comp
[1] 20 30 20 20

$pad.series
[1] 0 0

$print.stat
[1] FALSE

$plot.spectra
[1] FALSE

$center.series
[1] TRUE

$repeat.extr
[1] 2 1 1 1

$debugging
[1] TRUE

Browse[1]>         file.con.t                 <- open.nc(file.name)
Browse[1]>         data.all.t                 <- var.get.nc(file.con.t, var.name)
Browse[1]>         iter.ind                   <- iter.gridind[iter.nr, ]
Error: object 'iter.gridind' not found
Error during wrapup: promise already under evaluation: recursive default argument reference or earlier problems?
Browse[1]>         data.results.iter          <- array(NA,dim=c(n.timesteps, n.bands, diff(iter.ind) + 1))
Browse[1]> Q
> BuildPackage('ncdf.tools')
Read 10 items
* checking for file ‘ncdf.tools/DESCRIPTION’ ... OK
cp: cannot stat `ncdf.tools/R/.#DecomposeNcdf.R': No such file or directory
 ERROR
copying to build directory failed
Updating HTML index of packages in '.Library'
Making packages.html  ... done
* installing *source* package ‘ncdf.tools’ ...
** R
** inst
** preparing package for lazy loading
** help
*** installing help indices
** building package indices
** installing vignettes
** testing if installed package can be loaded

* DONE (ncdf.tools)

Attaching package: ‘ncdf.tools’

The following object(s) are masked from ‘package:jannis.misc’:

    call.args2string, compile.sysinfo, extract.datacube, ind.datacube

> BuildPackage('ncdf.tools')
Read 10 items
* checking for file ‘ncdf.tools/DESCRIPTION’ ... OK
cp: cannot stat `ncdf.tools/R/.#DecomposeNcdf.R': No such file or directory
 ERROR
copying to build directory failed
Updating HTML index of packages in '.Library'
Making packages.html  ... done
* installing *source* package ‘ncdf.tools’ ...
** R
** inst
** preparing package for lazy loading
** help
*** installing help indices
** building package indices
** installing vignettes
** testing if installed package can be loaded

* DONE (ncdf.tools)

Attaching package: ‘ncdf.tools’

The following object(s) are masked from ‘package:jannis.misc’:

    call.args2string, compile.sysinfo, extract.datacube, ind.datacube

> BuildPackage('ncdf.tools')
Read 10 items
* checking for file ‘ncdf.tools/DESCRIPTION’ ... OK
* preparing ‘ncdf.tools’:
* checking DESCRIPTION meta-information ... OK
* excluding invalid files
Subdirectory 'R' contains invalid file names:
  ‘.project’
* checking for LF line-endings in source and make files
* checking for empty or unneeded directories
* building ‘ncdf.tools_0.5.1.200.tar.gz’

Updating HTML index of packages in '.Library'
Making packages.html  ... done
* installing *source* package ‘ncdf.tools’ ...
** R
Error in parse(outFile) : 2:3: unexpected symbol
1: 
2: R version
    ^
ERROR: unable to collate and parse R files for package ‘ncdf.tools’
* removing ‘/usr/local/lib/R-2.15.1/library/ncdf.tools’
Error in library(pkg.name, character.only = TRUE) : 
  there is no package called ‘ncdf.tools’
Error during wrapup: promise already under evaluation: recursive default argument reference or earlier problems?
> source.functions.package('ncdf.tools')
Error: could not find function "source.functions.package"
Error during wrapup: promise already under evaluation: recursive default argument reference or earlier problems?
> load.functions.package('ncdf.tools')
Error in source(files.to.source[i]) : 
  /home/jbuttlar/MPI/Software/Own_Packages/ncdf.tools/R/DecomposeNcdf.R:2:3: unexpected symbol
1: 
2: R version
    ^
Error during wrapup: promise already under evaluation: recursive default argument reference or earlier problems?
> load.functions.package('ncdf.tools')
Sourced 35 functions.
> BuildPackage('ncdf.tools')
Read 10 items
* checking for file ‘ncdf.tools/DESCRIPTION’ ... OK
* preparing ‘ncdf.tools’:
* checking DESCRIPTION meta-information ... OK
* excluding invalid files
Subdirectory 'R' contains invalid file names:
  ‘.project’
* checking for LF line-endings in source and make files
* checking for empty or unneeded directories
* building ‘ncdf.tools_0.5.1.200.tar.gz’

* installing *source* package ‘ncdf.tools’ ...
** R
** inst
** preparing package for lazy loading
** help
*** installing help indices
** building package indices
** installing vignettes
** testing if installed package can be loaded

* DONE (ncdf.tools)

Attaching package: ‘ncdf.tools’

The following object(s) are masked _by_ ‘.GlobalEnv’:

    call.args2string, class.ncdf, close.nc.all, compile.sysinfo,
    create.std.nc, data.bin2ncdf, date.ncdf2R, date.R2ncdf,
    DecomposeNcdf, extract.datacube, extract.FN.ncdf, gapfill.ind.core,
    GapfillNcdf, GapfillNcdfCoreprocess, GapfillNcdfCreateItercube,
    GapfillNcdfDatacube, GapfillNcdfIdentifyCells,
    GapfillNcdfOpenFiles, GapfillNcdfSaveResults,
    gapinfo.temporal.ncdf, image.rotated, ind.datacube, ncdf.add.dim,
    ncdf.att.copy, ncdf.check.file, ncdf.cut.files, ncdf.def.all.atts,
    ncdf.fileatts.copy, ncdf.get.attinfo, ncdf.get.diminfo,
    ncdf.get.varinfo, ncdf.get.varname, ncdf.hist.add,
    ncdf.merge.files, ncdf.name2date, ncdf.read.data, ncdf.turn.data,
    ncdf.var.copy, rbindMod, SummarizeNcdf, VisualizeDatacube,
    visualize.ncdf

The following object(s) are masked from ‘package:jannis.misc’:

    call.args2string, compile.sysinfo, extract.datacube, ind.datacube

> Q
Error: object 'Q' not found
Error during wrapup: promise already under evaluation: recursive default argument reference or earlier problems?
> q()
Save workspace image? [y/n/c]: n

Process R finished at Fri Nov 30 19:57:37 2012


R version 2.15.1 (2012-06-22) -- "Roasted Marshmallows"
Copyright (C) 2012 The R Foundation for Statistical Computing
ISBN 3-900051-07-0
Platform: x86_64-unknown-linux-gnu (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.


Attaching package: ‘ncdf.tools’

The following object(s) are masked from ‘package:jannis.misc’:

    call.args2string, compile.sysinfo, extract.datacube, ind.datacube


Attaching package: ‘spectral.methods’

The following object(s) are masked from ‘package:jannis.misc’:

    add.axis, AttachList, MEF, RMSE, status.report

Loading required package: mvbutils
Loading required package: utils
Loading required package: tools
Loading required package: stats
MVBUTILS loaded

Loading required package: tcltk
Loading Tcl/Tk interface ... done
> + + > + ... + > > + ... + > > .help.ESS <- help
> options(STERM='iESS', editor='emacsclient')
> setwd(' /Net/Groups/C-Side/MDI/_data/DataStructureMDI/workingData/CMIP5/Data/CanESM2/co2mass')
Error in setwd(" /Net/Groups/C-Side/MDI/_data/DataStructureMDI/workingData/CMIP5/Data/CanESM2/co2mass") : 
  cannot change working directory
> setwd('/Net/Groups/C-Side/MDI/_data/DataStructureMDI/workingData/CMIP5/Data/CanESM2/co2mass')
> 