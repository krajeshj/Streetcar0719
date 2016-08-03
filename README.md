README.md
================
Rajesh Jagannath
August 2, 2016

R Markdown
----------

Streetcar0719
=============

Steetcar0719 is a directory placing the taxinfo for the capstone project

### OBJECTIVE:

Determine the economic impact of the introduction of a Street Car route in the City of Cincinnati. The data is from CAGIS and OpenData Cincinnati.

### DATA-SETS :

-   CagisOpenDataQuaterly has shapefiles (.shx) files. The Address.shx would be the most useful one for rendering on a map. \*Data2 is the primary data-set. These contain 10 years worth of Property Taxes from the assessors office. These are CSV files that have been Extracted from 'fixed-width-format' and coverted to .csv file format. Each directory has the file format described in a pdf file.

*streetcarbuffer\_parcels has two subdirs ** gis\_shape\_files/gis\_shapeFiles\_studyarea\_Parcels : Used to mark the streetcars parcels ** old\_csv files - they are old in the sense that these where first used for exploratory analysis and many records with no addresses were found * TrialCode : Has first R files with which we explored the data \*\* Read\_Position\_delimited\_File.R converts fwf to .csv file \*\* ReadShapeFile.R Read in streetcarbuffer\_parcels/gis\_shape\_files/gis\_shapeFiles\_studyarea\_Parcels/\*\_PARCELS.shx shape files and rasterizes them into a plot \*\* Map\_HeatMap\_PropVal.R Exploratory Data Analysis to create a density plot based on csv files( old\_csv\_files were used

``` r
summary(cars)
```

    ##      speed           dist       
    ##  Min.   : 4.0   Min.   :  2.00  
    ##  1st Qu.:12.0   1st Qu.: 26.00  
    ##  Median :15.0   Median : 36.00  
    ##  Mean   :15.4   Mean   : 42.98  
    ##  3rd Qu.:19.0   3rd Qu.: 56.00  
    ##  Max.   :25.0   Max.   :120.00

Including Plots
---------------

You can also embed plots, for example:

![](README_files/figure-markdown_github/pressure-1.png)

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.
