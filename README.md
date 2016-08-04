README.md
================
Rajesh Jagannath
August 2, 2016

R Markdown
----------

Street Car
----------

The Cincinnati Streetcar is a modern streetcar system designed to link major employment centers in downtown and uptown, connecting through Cincinnati's historic Over-the-Rhine neighborhood. It will operate 18 hours a day, 365 days a year.

### 1. What is the problem you want to solve?

Predict a “net positive effect” on economy in the buffer zone around the streetcar route.

### 2. Who is your client and why do they care about this problem?

The City of Cincinnati would be the client. Downtown is Cincinnati’s largest employment center, with approximately 70,000 people in the area every day. It has been proven in cities from Atlanta to Seattle that fixed rails in the ground with thousands of potential riders draw new storefronts and businesses, as well as fixed up housing. That new development will put people to work and boost the city’s tax revenue. Also, here may have been inconveniences to the neighborhood, during the construction phase.

Hence, there are two camps of opinion -

-   one opinion insists that the introduction of the streetcar is disruptive to the neighborhood ( crowding, transient population, noise) and

-   The other opinion is that it provides easy access to business, shops, dining and commuting to work and home and draws new business, expansion of storefronts, revenue from ridership, permit fees, property tax and restaurant license fee.

### 3. What data are you going to use for this? How will you acquire this data?

-   Data source would be from Open Data Cincinnati and CAGIS, City of Cincinnati, OH.
-   Identify a buffer zone around the street car route using parcel ids
-   CSV files for Center, Core and Edge zones
-   Obtain the data for Market value of the Land and Improvements ( tax info) for these parcels for the last 10 years (CSV)

### 4. In brief, outline your approach to solving this problem (knowing that this might change later).

-   Clean the data
-   Define and build model
-   Establish criteria that defines the economic growth
-   Use historical property values for the last 10 years
-   Predict property value trends using Time series
-   Visualize using ggmap / ggplot

### 5. What are your deliverables?

-   Marked up Code in the github
-   Slide-deck with Analysis and Visualization

### References

1.  <https://dev.socrata.com/foundry/data.cincinnati-oh.gov/emnx-rw6d>

2.  <http://www.cincinnati.com/story/news/2016/05/05/streetcar-nation-kc-opens-friday-cincy-next/83874740/>

### DIRECTORIES/FILES :

-   CagisOpenDataQuaterly has shapefiles (.shx) files. The Address.shx would be the most useful one for rendering on a map.
-   Data2 is a directory containing the primary data-set. These contain 9 years( 2007-2015) worth of Property Taxes from the assessors office. These are CSV files that have been extracted from 'fixed-width-format' and converted to .csv file format. Each directory has the file format described in a pdf file.

-   streetcarbuffer\_parcels has two subdirs
    -   gis\_shape\_files/gis\_shapeFiles\_studyarea\_Parcels : Used to mark the streetcars parcels
    -   old\_csv files - they are old in the sense that these where first used for exploratory analysis and many records with no addresses were found
-   Trial Code : Has first R files with which we explored the data
    -   Read\_Position\_delimited\_File.R converts fwf to .csv file
    -   ReadShapeFile.R Read in streetcarbuffer\_parcels/gis\_shape\_files/gis\_shapeFiles\_studyarea\_Parcels/CENTER\_EDGE\_CORE\_PARCELS.shx shape files and rasterizes them into a plot
-   Map\_HeatMap\_PropVal.R Exploratory Data Analysis to create a density plot based on csv files( old\_csv\_files were used

-   ReadStreetcCarDataSets.R : Read three CSV files in the 1000ft Bufferzones - CORE, CENTER and EDGE We select interesting features form the data from the frame viz.

                              PARCELID   Unique identifier Parcel id   

                              EXLUCODE    Existing Land Use Code, Multi-family, commercial, Parks  

                              MKTLND      Market Value of the Land   

                              MKTIMP      Market value of the Improvements   

                              MKT_TOTAL_  Total Value      

                              SALDAT      Sale Date           

                              SALAMT      Sale Amount        

                              FORECL_FLA  Foreclosure Flag    

                              AREA        Area               

                              ACRES       Acres                                                      

------------------------------------------------------------------------

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.
