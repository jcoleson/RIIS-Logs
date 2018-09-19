# RIIS-Logs

## Overview
RIIS-Logs is a R package designed to read an anaylize log files created by IIS using the W3C Extended Log File Format. 

## Why use RIIS-Logs?

While you can read IIS log files directly using base R, you will have to handle reading the column names, converting columns named to R readable identifiers, combining multiple log files into a single dataframe, and handling missing of invalid column data yourself. 

## Installation 

Currently the only way to install if directly from github. To do this, you will need to install the devtools package from CRAN. 

``` r
install.packages("devtools")
devtools::install_github("jcoleson/RIIS-Logs")
```

