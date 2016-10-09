# This program reads in the excel spreadsheets for Tax and Sales Data

library(dplyr)
library(tidyr)
library(ggplot2)
library(readr)
library(stringr)
library(scales)
library(mixtools)
library(readxl)
library(lubridate)
library(reshape2)
library(forecast)
library(TSclust)

 
# set the working dir
setwd("/Users/rajesh/Desktop/Coursera/SpringBoardGithub/Streetcar0719")
# read in the csv

for(year in c(seq(2007,2015))) {
     print(paste("Processing the year :",year))
    # Form the names of the csv file using year as the iterator
    year_file <- paste0("./Data2_090216/taxinfo/",year,"/taxinfo",year,".csv")

    #Form the variable to assign to
    df_year <- paste0("df_taxinfo_",year)
    print(df_year)

    # Assign to a data fram
    #assign(df_year, read_csv(year_file, col_types=list(col_character(),col_number(),col_number(), col_number(), col_number(),col_number(),col_number(),col_number(),col_number(),col_character(),col_character(),col_character())))
    assign(df_year, read_csv(year_file))
    problems(df_year)



    #assign(df_taxinfo_2007, df_taxinfo_2007 %>% select(one_of(features_selected)))
    dim(df_year)
}
# Select Features
features_selected <-c("PARCEL_ID", "MKT_LAND_VAL","MKT_IMPR_VAL", "MKT_TOTAL_VAL", "ANNUAL_TAXES","TAXES_PAID", "DELQ_TAXES", "ACRES", "SALE_AMOUNT", "SALE_DATE", "NEW_CONS_FLAG","FORECL_FLAG")

df_taxinfo_2007 <- select(df_taxinfo_2007, one_of(features_selected))
df_taxinfo_2008 <- select(df_taxinfo_2008, one_of(features_selected))
df_taxinfo_2009 <- select(df_taxinfo_2009, one_of(features_selected))
df_taxinfo_2010 <- select(df_taxinfo_2010, one_of(features_selected))
df_taxinfo_2011 <- select(df_taxinfo_2011, one_of(features_selected))
df_taxinfo_2012 <- select(df_taxinfo_2012, one_of(features_selected))
df_taxinfo_2013 <- select(df_taxinfo_2013, one_of(features_selected))
df_taxinfo_2014 <- select(df_taxinfo_2014, one_of(features_selected))




names(df_taxinfo_2015)

#2015 format change : we need to create the parcel id from the BOOK_NUM, PAGE_NUM_PARCEL_NUM,MLT_NUM
#create the parcelid from c(BOOK_NUM, PAGE_NUM, PARCEL_NUM, MLT_NUM)

df_taxinfo_2015 <- df_taxinfo_2015 %>% unite(PARCEL_ID, BOOK_NUM, PAGE_NUM,PARCEL_NUM,MLT_OWN, sep="")
#df_taxinfo_2015 <- df_taxinfo_2015%>%separate(SALE_DATE,c("SALE_DATE","SALE_TIME"), sep="[:space:]{1,2}")

df_taxinfo_2015 <- select(df_taxinfo_2015, one_of(features_selected))

df_taxinfo_2015 <- df_taxinfo_2015[c(which(df_taxinfo_2015$ANNUAL_TAXES > 0)),]

## Convert some of the values into numeric
for(year in c(seq(2007,2015))) {

  for (par in c("MKT_LAND_VAL","MKT_IMPR_VAL", "MKT_TOTAL_VAL", "ANNUAL_TAXES","TAXES_PAID", "DELQ_TAXES", "ACRES", "SALE_AMOUNT" )){
    #Form the variable to assign to
    df_year_par <- paste0("df_taxinfo_",year,"$",par)
    print(paste("processing", df_year_par))
    df_year_par<-(as.numeric(df_year_par))
    class(df_year_par)

  }
  for (par in c("NEW_CONS_FLAG","FORECL_FLAG")){
    #Form the variable to assign to
    df_year_par <- paste0("df_taxinfo_",year,"$",par)
    print(paste("processing", df_year_par))
    df_year_par<-(as.factor(df_year_par))

  }



}
#for (par in c("MKT_LAND_VAL","MKT_IMPR_VAL", "MKT_TOTAL_VAL", "ANNUAL_TAXES","TAXES_PAID", "DELQ_TAXES", "ACRES", "SALE_AMOUNT" )){
#######
# 2008 data was read in as characters 
# So we need to change the  class to numeric
######
df_taxinfo_2008$MKT_LAND_VAL<-as.numeric(df_taxinfo_2008$MKT_LAND_VAL)
df_taxinfo_2008$MKT_IMPR_VAL<-as.numeric(df_taxinfo_2008$MKT_IMPR_VAL)
df_taxinfo_2008$MKT_TOTAL_VAL<-as.numeric(df_taxinfo_2008$MKT_TOTAL_VAL)
df_taxinfo_2008$SALE_AMOUNT<-as.numeric(df_taxinfo_2008$SALE_AMOUNT)

df_taxinfo_2008$ANNUAL_TAXES<-as.numeric(df_taxinfo_2008$ANNUAL_TAXES)
df_taxinfo_2008$TAXES_PAID<-as.numeric(df_taxinfo_2008$TAXES_PAID)
df_taxinfo_2008$DELQ_TAXES<-as.numeric(df_taxinfo_2008$DELQ_TAXES)


df_taxinfo_2008$ACRES<-as.numeric(df_taxinfo_2008$ACRES)

#####
#2009 needs to be treated a little different 
#So we need to change the class as numeric
#####

df_taxinfo_2009$MKT_LAND_VAL<-as.numeric(df_taxinfo_2009$MKT_LAND_VAL)
df_taxinfo_2009$MKT_IMPR_VAL<-as.numeric(df_taxinfo_2009$MKT_IMPR_VAL)
df_taxinfo_2009$MKT_TOTAL_VAL<-as.numeric(df_taxinfo_2009$MKT_TOTAL_VAL)
df_taxinfo_2009$SALE_AMOUNT<-as.numeric(df_taxinfo_2009$SALE_AMOUNT)

df_taxinfo_2009$ANNUAL_TAXES<-as.numeric(df_taxinfo_2009$ANNUAL_TAXES)
df_taxinfo_2009$TAXES_PAID<-as.numeric(df_taxinfo_2009$TAXES_PAID)
df_taxinfo_2009$DELQ_TAXES<-as.numeric(df_taxinfo_2009$DELQ_TAXES)


df_taxinfo_2009$ACRES<-as.numeric(df_taxinfo_2009$ACRES)

# REMOVE the records for which the ANNUAL_TAXES == 0
df_taxinfo_2007 <- df_taxinfo_2007[c(which(df_taxinfo_2007$ANNUAL_TAXES > 0)),]
df_taxinfo_2008 <- df_taxinfo_2008[c(which(df_taxinfo_2008$ANNUAL_TAXES > 0)),]
df_taxinfo_2009 <- df_taxinfo_2009[c(which(df_taxinfo_2009$ANNUAL_TAXES > 0)),]
df_taxinfo_2010 <- df_taxinfo_2010[c(which(df_taxinfo_2010$ANNUAL_TAXES > 0)),]
df_taxinfo_2011 <- df_taxinfo_2011[c(which(df_taxinfo_2011$ANNUAL_TAXES > 0)),]
df_taxinfo_2012 <- df_taxinfo_2012[c(which(df_taxinfo_2012$ANNUAL_TAXES > 0)),]
df_taxinfo_2013 <- df_taxinfo_2013[c(which(df_taxinfo_2013$ANNUAL_TAXES > 0)),]
df_taxinfo_2014 <- df_taxinfo_2014[c(which(df_taxinfo_2014$ANNUAL_TAXES > 0)),]
# Some data in 2013 was just not right 


#Date coversions
# The date coversions could not be done in a foreachloop
# So doing it one by one
df_taxinfo_2007$SALE_DATE <-as.Date(as.POSIXlt(strptime(df_taxinfo_2007$SALE_DATE, format="%Y%m%d")))

df_taxinfo_2008$SALE_DATE <-as.Date(as.POSIXlt(strptime(df_taxinfo_2008$SALE_DATE, format="%Y%m%d")))

df_taxinfo_2009$SALE_DATE <-as.Date(as.POSIXlt(strptime(df_taxinfo_2009$SALE_DATE, format="%Y%m%d")))
df_taxinfo_2010$SALE_DATE <-as.Date(as.POSIXlt(strptime(df_taxinfo_2010$SALE_DATE, format="%Y%m%d")))
df_taxinfo_2011$SALE_DATE <-as.Date(as.POSIXlt(strptime(df_taxinfo_2011$SALE_DATE, format="%Y%m%d")))
df_taxinfo_2012$SALE_DATE <-as.Date(as.POSIXlt(strptime(df_taxinfo_2012$SALE_DATE, format="%Y%m%d")))
df_taxinfo_2013$SALE_DATE <-as.Date(as.POSIXlt(strptime(df_taxinfo_2013$SALE_DATE, format="%Y%m%d")))
df_taxinfo_2014$SALE_DATE <-as.Date(as.POSIXlt(strptime(df_taxinfo_2014$SALE_DATE, format="%Y%m%d")))
df_taxinfo_2015$SALE_DATE <-as.Date(strptime(df_taxinfo_2015$SALE_DATE, format="%y/%m/%d"))


#Lets add the Year to the data frame

len <- length(df_taxinfo_2007$PARCEL_ID)
df_taxinfo_2007$DF_TAXINFO_YEAR <- unlist(rep("2007",times =len))
df_taxinfo_2007$DF_TAXINFO_YEAR <-as.numeric(df_taxinfo_2007$DF_TAXINFO_YEAR)

len <- length(df_taxinfo_2008$PARCEL_ID)
df_taxinfo_2008$DF_TAXINFO_YEAR <- unlist(rep("2008",times =len))
df_taxinfo_2008$DF_TAXINFO_YEAR <-as.numeric(df_taxinfo_2008$DF_TAXINFO_YEAR)


len <- length(df_taxinfo_2009$PARCEL_ID)
df_taxinfo_2009$DF_TAXINFO_YEAR <- unlist(rep("2009",times =len))
df_taxinfo_2009$DF_TAXINFO_YEAR <-as.numeric(df_taxinfo_2009$DF_TAXINFO_YEAR)


len <- length(df_taxinfo_2010$PARCEL_ID)
df_taxinfo_2010$DF_TAXINFO_YEAR <- unlist(rep("2010",times =len))
df_taxinfo_2010$DF_TAXINFO_YEAR <-as.numeric(df_taxinfo_2010$DF_TAXINFO_YEAR)


len <- length(df_taxinfo_2011$PARCEL_ID)
df_taxinfo_2011$DF_TAXINFO_YEAR <- unlist(rep("2011",times =len))
df_taxinfo_2011$DF_TAXINFO_YEAR <-as.numeric(df_taxinfo_2011$DF_TAXINFO_YEAR)

len <- length(df_taxinfo_2012$PARCEL_ID)
df_taxinfo_2012$DF_TAXINFO_YEAR <- unlist(rep("2012",times =len))
df_taxinfo_2012$DF_TAXINFO_YEAR <-as.numeric(df_taxinfo_2012$DF_TAXINFO_YEAR)

len <- length(df_taxinfo_2013$PARCEL_ID)
df_taxinfo_2013$DF_TAXINFO_YEAR <- unlist(rep("2013",times =len))
df_taxinfo_2013$DF_TAXINFO_YEAR <-as.numeric(df_taxinfo_2013$DF_TAXINFO_YEAR)

len <- length(df_taxinfo_2014$PARCEL_ID)
df_taxinfo_2014$DF_TAXINFO_YEAR <- unlist(rep("2014",times =len))
df_taxinfo_2014$DF_TAXINFO_YEAR <-as.numeric(df_taxinfo_2014$DF_TAXINFO_YEAR)


len <- length(df_taxinfo_2015$PARCEL_ID)
df_taxinfo_2015$DF_TAXINFO_YEAR <- unlist(rep("2015",times =len))
df_taxinfo_2015$DF_TAXINFO_YEAR <-as.numeric(df_taxinfo_2015$DF_TAXINFO_YEAR)


# Create a final data frame for further analysis : all years 2007-2012
df_all <- bind_rows(df_taxinfo_2007, df_taxinfo_2008, df_taxinfo_2009,df_taxinfo_2010,df_taxinfo_2011,df_taxinfo_2012,df_taxinfo_2013,df_taxinfo_2014,df_taxinfo_2015)

# Get the complete cases 
# Remove all the observations for which we don't have NAs
df_complete_cases <- df_all[complete.cases(df_all),]




library("TSclust")

#get a summary
summary(df_complete_cases)

#From the df_complete_cases, select only the PARCEL_ID and ANNUAL Taxes
df_annual_taxes <- df_complete_cases %>% select(one_of(c("DF_TAXINFO_YEAR","PARCEL_ID", "ANNUAL_TAXES")))
 
View(df_annual_taxes)
summary(df_annual_taxes)
# reshape by parcel id
reshape.by.parcelid <- function(df_annual_taxes){
  #Reshape the train data into a matrix containing the yearly ANNUAL_TAXES for each parcel id
  #This is preparation required for time series clustering
  #Input: Train datas5t which contain multiple rows x 4 column variables
  #Output: Matrix of 8 YEARLY  TXES observations x 300000 PARCEL_IDs
  head(df_annual_taxes)
  # taxinfo.matrix <- dcast(df_annual_taxes,formula=DF_TAXINFO_YEAR ~ PARCEL_ID,value.var = "ANNUAL_TAXES",fun.aggregate = sum)
  #taxinfo_matrix <- reshape(df_annual_taxes, v.names="ANNUAL_TAXES", idvar="DF_TAXINFO_YEAR", timevar="PARCEL_ID", direction="wide")
  
  # 
  taxinfo_matrix <- df_annual_taxes  %>% spread("PARCEL_ID", value="ANNUAL_TAXES", fill=as.numeric(0))
  if (any(is.na(unlist(taxinfo_matrix)))) {
    stop("NA in taxinfo_matrix")
  }
   
  # retain only parcel ids with complete 8 years of data
  nz_taxinfo_matrix <- taxinfo_matrix[,apply(taxinfo_matrix[c(1:ncol(taxinfo_matrix))],2, function(z) !any(z == 0))]
  if (any(is.na(unlist(nz_taxinfo_matrix)))) {
    stop("NA in nz_taxinfo_matrix")
  }
  View(nz_taxinfo_matrix)
  
  # Randomly select 10% of the records
  # This selects rows and we need to select columns at random
  #nz_taxinfo_matrix_frac <- nz_taxinfo_matrix %>% sample_frac(0.1, replace=FALSE)
  
  nz_taxinfo_matrix_frac <- nz_taxinfo_matrix
  summary(nz_taxinfo_matrix_frac)
  taxinfo.matrix<- tbl_df(nz_taxinfo_matrix_frac) 
  summary(nz_taxinfo_matrix_frac)
  
  return(nz_taxinfo_matrix_frac)
}
taxinfo.matrix <- reshape.by.parcelid(df_annual_taxes)
# taxinfo.matrix[,4] <- NULL
# taxinfo.matrix[,3] <- NULL
# taxinfo.matrix[,2] <- NULL
#taxinfo.matrix[,1] <- NULL
 
if (any(is.na(unlist(taxinfo.matrix)))) {
  stop("NA in taxinfo.matrix - B4")
}


rownames(taxinfo.matrix) <- taxinfo.matrix$DF_TAXINFO_YEAR

if (any(is.na(unlist(taxinfo.matrix)))) {
  stop("NA in taxinfo.matrix AFT")
}

# calculate dissimilarity matrix

calculate.ts.dist <- function(taxinfo.matrix){
  #Calculates the dissimilarity matrix via the Autocorrelation method (ACF)
  #Input: A matrix of Annual taxes  dimension
  #         (YEAR) x (PARCELID)
  #Output:A matrix of dissimilarity computations of length 
  # Remove Year
   if (any(is.na(unlist(taxinfo.matrix)))) {
    stop("NA in tsdist Right before assignment to tsdist")
  }
 tsdist<- taxinfo.matrix
 tsdist[,1] <-NULL
 
 if (any(is.na(unlist(tsdist)))) {
    stop("NA in tsdist Right before scale")
 }
 
   tsdist<-scale(tsdist) #standardising data points
  
  
  
  df_tsdist <- tsdist[, colSums(is.na(tsdist)) != nrow(tsdist)]
  
   if (any(is.na(unlist(df_tsdist)))) {
     stop("NA in df_tsdist Right before diss")
   }
  
  tsdist_diss<- diss(df_tsdist, "ACF", p=0.05)
  View(tsdist_diss)
  
  return(tsdist_diss)
}

#Perform and plot hierarchical clustering based on dissimilarity computation of yearly sales 
tsdist.complete<-calculate.ts.dist(taxinfo.matrix)
hc<-hclust(tsdist.complete)
plot(hc)



