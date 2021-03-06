README.md
================
Rajesh Jagannath
April 30, 2017

Springboard Final Project
----------

Impact on Total Market Value of Parcels: Introduction of the Street Car in Downtown Cincinnati
----------

The Cincinnati Streetcar is a modern streetcar system designed to link major employment centers in downtown and uptown, connecting through Cincinnati's historic Over-the-Rhine neighborhood. It was introduced into service in August 2016. It operates 18 hours a day, 365 days a year. 

Impacts on the economy were expected and anticipated upon its introduction - some positive and some negative.

This project analyzes Total Market Value of the parcels in a buffer zone around the Streetcar route. Three spatial buffer-zones were established by Cincinnati Area Geographic Systems(CAGIS). A random sample of parcels not in the Buffer-zone were compared. Polynomial Regression was used for prediction of MKT_TOTAL_VAL(Total Market Value). Data was used with permission from the staff at CAGIS. Using ClustofVars library, clusters of parcels_ids with similar trends are grouped for analysis into k=12 clusters. Training sets and test sets were created. Error (Mean Absolute Percentage Error) was minimized on Test set to select the best model for prediction. Models were selected from one of linear, quadratic, cubic, 4th order or 5th order polynomial regression. Prediction and Visualization were performed. Insights were drawn  and report concluded with ideas for future work. 

# 
I have selected this study as my capstone project submission for the [Springboard - Foundations to Data Science Course](https://www.springboard.com/workshops/data-science).

# Final Report 
__Please refer to the__ [Final Project Report ](https://github.com/krajeshj/Streetcar0719/blob/master/Reports/Final_Milestone/FinalReport_041617.pdf) for the full details of the problem and dataset.

# Slide Deck
__A power point presentation of the project exists__ [Project Slides](https://github.com/krajeshj/Streetcar0719/blob/master/Reports/Final_Milestone/Final_ReportPresentation.pdf)
 # Output
__A output file of  main.Rmd is located here __ [main.html](https://github.com/krajeshj/Streetcar0719/blob/master/taxinfoTimeSeries/main.html)

# Files

File|Description
---------|-------------------------------------------------------------------------------------------------------------------
taxinfoTimeSeries/main.R| Main R Script for ETL, Clustering, Model selection, Prediction and Visualization 
taxinfoTimeSeries/Buffer_parcels_ETL_MKT_VAL.R|ETL files for the 3 buffer zone CORE,CENTER and EDGE
taxinfoTimeSeries/Assessors_yearly_data_ETL_MKT_VAL.R|ETL for loading 8 years of data 
taxinfoTimeSeries/functions_MKT_VAL.R|Contains functions for Polynomial regression
Data2_090216/Read_Position_delimited_File_from_tuple.R | reads in the the txt files in fixed width format
Reports/Final_Milestone/FinalReport_041617.pdf|Final Report
Reports/Final_Milestone/Final_ReportPresentation.pdf| Final Power point Presentation
 



Directory|Description
---------|---------------------------------------------------------------------------------------------------
Data2_090216|Contains datasets
Data2_090216/parcel_csv| contains the parcel ids of the parcels in Buffer Parcel (csv files)
Data2_090216/taxinfo| contains the 9 years of data including MKT_TOTAL_VAL (txt file - fixed width format)
taxinfoTimeSeries| Contains the main code
Reports/Final_Milestone | The final reports are archived here
Reports/Final_Milestone/Plots | contains all the supporting plots generated in the study
 

### References

1.  <https://dev.socrata.com/foundry/data.cincinnati-oh.gov/emnx-rw6d>
2.  <http://www.cincinnati.com/story/news/2016/05/05/streetcar-nation-kc-opens-friday-cincy-next/83874740/>
3.	<https://cran.r-project.org/web/packages/ClustOfVar/ClustOfVar.pdf>
4.	<http://www.exegetic.biz/blog/2013/12/contour-and-density-layers-with-ggmap/>
5.	<http://www.shanelynn.ie/massive-geocoding-with-r-and-google-maps/>
6.	<http://stat405.had.co.nz/ggmap.pdf>
7.	A Little Book of R for Time-series, Avril Coghlan
8.	An Introduction to Statistical Learning, Gareth James et al


