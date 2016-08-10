# This program analyzes the instruction trace of a Ultimate Random

library(dplyr)
library(RSQLite)
library(tidyr)
library(ggplot2)
library(readr)
library(stringr)
library(scales)
library(mixtools)
library(readxl)
library(ggmap)
library(googleway)


# set the working dir
setwd("/Users/rajesh/Desktop/Coursera/SpringBoardGithub/Streetcar0719")
# read in the csv 

for(year in c(2007,seq(2009,2015))) {
    print(paste("Processing the year :",year))
    # Form the names of the csv file using year as the iterator
    year_file <- paste0("./Data2/taxinfo/",year,"/taxinfo",year,".csv")
    
    #Form the variable to assign to 
    df_year <- paste0("df_taxinfo_",year) 
    print(df_year)
    
    # Assign to a data frame
    assign(df_year, read_csv(year_file))
    
  
    
    #assign(df_taxinfo_2007, df_taxinfo_2007 %>% select(one_of(features_selected)))
    dim(df_year)
}
# Select Features
features_selected <-c("PARCEL_ID", "MKT_LAND_VAL","MKT_IMPR_VAL", "MKT_TOTAL_VAL", "ANNUAL_TAXES","TAXES_PAID", "DELQ_TAXES", "ACRES", "SALE_AMOUNT", "SALE_DATE", "NEW_CONS_FLAG","FORECL_FLAG", "DEED_TYPE")

df_taxinfo_2007 <- select(df_taxinfo_2007, one_of(features_selected))

df_taxinfo_2009 <- select(df_taxinfo_2009, one_of(features_selected))
df_taxinfo_2010 <- select(df_taxinfo_2010, one_of(features_selected))
df_taxinfo_2011 <- select(df_taxinfo_2011, one_of(features_selected))
df_taxinfo_2012 <- select(df_taxinfo_2012, one_of(features_selected))
df_taxinfo_2013 <- select(df_taxinfo_2013, one_of(features_selected))
df_taxinfo_2014 <- select(df_taxinfo_2014, one_of(features_selected))

#names(df_taxinfo_2015)
#df_taxinfo_2015 <- select(df_taxinfo_2015, one_of(features_selected))


 


                          