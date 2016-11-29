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
library(sqldf)
library(ClustOfVar)
library(digest)
library(zoo)
 
# set the working dir
setwd("/Users/rajesh/Desktop/Coursera/SpringBoardGithub/Streetcar0719")
# read in the csv

for(year in c(2007)) {
     print(paste("Processing the year :",year))
    # Form the names of the csv file using year as the iterator
    year_file <- paste0("./Data2_090216/taxinfo/",year,"/taxinfo",year,".csv")

    #Form the variable to assign to
    df_year <- paste0("df_taxinfo_",year)
    print(df_year)

    # Assign to a data frame
     
    
   assign (df_year, read_csv(year_file, col_types = cols(SMDA_NUM  = "c",
                                              UNIT  = "c",
                                              LOC_STREET  = "c",
                                              LOC_HOUSE_NO  = "c",
                                              LOC_SEC_NO  = "c",
                                              LOC_ST_DESC  = "c",
                                              LOC_ST_IND  = "c",
                                              LOC_ST_DIR  = "c",
                                              TAX_DIST  = "c",
                                              SCHOOL_CODE  = "c",
                                              CLASS_CODE  = "c",
                                              OWNER_LINE1  = "c",
                                              OWNER_LINE2  = "c",
                                              OWNER_LINE3  = "c",
                                              OWNER_LINE4  = "c",
                                              MAIL_LINE1  = "c",
                                              MAIL_LINE2  = "c",
                                              MAIL_LINE3  = "c",
                                              MAIL_LINE4  = "c",
                                              PROPERTY_DESCRIPTION1  = "c",
                                              PROPERTY_DESCRIPTION2  = "c",
                                              PROPERTY_DESCRIPTION3  = "c",
                                              PROPERTY_DESCRIPTION4  = "c",
                                              BOR_FLAG  = col_character(),
                                              VALID_SALE  = col_character(),
                                              MKT_LAND_VAL  = "d",
                                              HMSTD_FLAG  = col_character(),
                                              FILL_01  = col_character(),
                                              NUM_PARCELS  = "c",
                                              CAUV_VALUE  = "c",
                                              RED_25_FLAG  = col_character(),
                                              BANK_CODE  = col_character(),
                                              FILL_02  = col_character(),
                                              DEED_TYPE  = col_character(),
                                              MKT_IMPR_VAL  = "d",
                                              DIV_FLAG  = col_character(),
                                              SALE_AMOUNT  = "c",
                                              MKT_TOTAL_VAL  = "d",
                                              NEW_CONS_FLAG  = col_character(),
                                              SALE_DATE  = "c",
                                              FORECL_FLAG  = col_character(),
                                              CONVEY_NO  = "c",
                                              SPEC_FLAG  = col_character(),
                                              FILL_03  = col_character(),
                                              DEED_NUMBER  = "c",
                                              ANNUAL_TAXES  = "d",
                                              FRONT_FOOTAGE  = "c",
                                              ACRES  = "c",
                                              TAXES_PAID  = "d",
                                              FOX_DELETED  = col_character(),
                                              PAR_DELETED  = col_character(),
                                              PARCEL_ID  = "c",
                                              OWNER_SORT  = "c",
                                              DELQ_TAXES  = "d",
                                              ZIPCODE  = col_character()))
   
    )
    problems(df_year)



    #assign(df_taxinfo_2007, df_taxinfo_2007 %>% select(one_of(features_selected)))
    dim(df_year)
}

for(year in c(2008)) {
  print(paste("Processing the year :",year))
  # Form the names of the csv file using year as the iterator
  year_file <- paste0("./Data2_090216/taxinfo/",year,"/taxinfo",year,".csv")
  
  #Form the variable to assign to
  df_year <- paste0("df_taxinfo_",year)
  print(df_year)
  
  # Assign to a data fram
  # assign(df_year, read_csv(year_file))
  
  
  assign (df_year, read_csv(year_file, col_types = cols(SMDA_NUM = "c",
                                                        UNIT = "c",
                                                        LOC_STREET = "c",
                                                        LOC_HOUSE_NO = "c",
                                                        LOC_SEC_NO = "c",
                                                        LOC_ST_DESC = "c",
                                                        LOC_ST_IND = "c",
                                                        LOC_ST_DIR = "c",
                                                        TAX_DIST = "c",
                                                        SCHOOL_CODE = "c",
                                                        CLASS_CODE = "c",
                                                        OWNER_LINE1 = "c",
                                                        OWNER_LINE2 = "c",
                                                        OWNER_LINE3 = "c",
                                                        OWNER_LINE4 = "c",
                                                        MAIL_LINE1 = "c",
                                                        MAIL_LINE2 = "c",
                                                        MAIL_LINE3 = "c",
                                                        MAIL_LINE4 = "c",
                                                        PROPERTY_DESCRIPTION1 = "c",
                                                        PROPERTY_DESCRIPTION2 = "c",
                                                        PROPERTY_DESCRIPTION3 = "c",
                                                        PROPERTY_DESCRIPTION4 = "c",
                                                        BOR_FLAG = "c",
                                                        VALID_SALE = "c",
                                                        MKT_LAND_VAL = "c",
                                                        HMSTD_FLAG = "c",
                                                        FILL_01 = "c",
                                                        NUM_PARCELS = "c",
                                                        CAUV_VALUE = "c",
                                                        RED_25_FLAG = "c",
                                                        BANK_CODE = "c",
                                                        FILL_02 = "c",
                                                        DEED_TYPE = "c",
                                                        MKT_IMPR_VAL = "c",
                                                        DIV_FLAG = "c",
                                                        SALE_AMOUNT = "c",
                                                        MKT_TOTAL_VAL = "c",
                                                        NEW_CONS_FLAG = "c",
                                                        SALE_DATE = "c",
                                                        FORECL_FLAG = "c",
                                                        CONVEY_NO = "c",
                                                        SPEC_FLAG = "c",
                                                        FILL_03 = "c",
                                                        DEED_NUMBER = "c",
                                                        ANNUAL_TAXES = "c",
                                                        FRONT_FOOTAGE = "c",
                                                        ACRES = "c",
                                                        TAXES_PAID = "c",
                                                        FOX_DELETED = "c",
                                                        PAR_DELETED = "c",
                                                        PARCEL_ID = "c",
                                                        OWNER_SORT = "c",
                                                        DELQ_TAXES = "c",
                                                        ZIPCODE = "c",
                                                        RentalRegSw = "c"))
          
  )
  
  
  problems(df_year)
  
  
  
  #assign(df_taxinfo_2007, df_taxinfo_2007 %>% select(one_of(features_selected)))
  dim(df_year)
}

for(year in c(seq(2009,2014))) {
  print(paste("Processing the year :",year))
  # Form the names of the csv file using year as the iterator
  year_file <- paste0("./Data2_090216/taxinfo/",year,"/taxinfo",year,".csv")
  
  #Form the variable to assign to
  df_year <- paste0("df_taxinfo_",year)
  print(df_year)
  
  # Assign to a data fram
  # assign(df_year, read_csv(year_file))
  
  
  assign (df_year, read_csv(year_file, col_types = cols(SMDA_NUM = "c",
                                                        UNIT = "c",
                                                        LOC_STREET = "c",
                                                        LOC_HOUSE_NO = "c",
                                                        LOC_SEC_NO = "c",
                                                        LOC_ST_DESC = "c",
                                                        LOC_ST_IND = "c",
                                                        LOC_ST_DIR = "c",
                                                        TAX_DIST = "c",
                                                        SCHOOL_CODE = "c",
                                                        CLASS_CODE = "c",
                                                        OWNER_LINE1 = "c",
                                                        OWNER_LINE2 = "c",
                                                        OWNER_LINE3 = "c",
                                                        OWNER_LINE4 = "c",
                                                        MAIL_LINE1 = "c",
                                                        MAIL_LINE2 = "c",
                                                        MAIL_LINE3 = "c",
                                                        MAIL_LINE4 = "c",
                                                        PROPERTY_DESCRIPTION1 = "c",
                                                        PROPERTY_DESCRIPTION2 = "c",
                                                        PROPERTY_DESCRIPTION3 = "c",
                                                        PROPERTY_DESCRIPTION4 = "c",
                                                        BOR_FLAG = "c",
                                                        VALID_SALE = "c",
                                                        MKT_LAND_VAL = "c",
                                                        HMSTD_FLAG = "c",
                                                        FILL_01 = "c",
                                                        NUM_PARCELS = "c",
                                                        CAUV_VALUE = "c",
                                                        RED_25_FLAG = "c",
                                                        BANK_CODE = "c",
                                                        FILL_02 = "c",
                                                        DEED_TYPE = "c",
                                                        MKT_IMPR_VAL = "c",
                                                        DIV_FLAG = "c",
                                                        SALE_AMOUNT = "c",
                                                        MKT_TOTAL_VAL = "c",
                                                        NEW_CONS_FLAG = "c",
                                                        SALE_DATE = "c",
                                                        FORECL_FLAG = "c",
                                                        CONVEY_NO = "c",
                                                        SPEC_FLAG = "c",
                                                        FILL_03 = "c",
                                                        DEED_NUMBER = "c",
                                                        ANNUAL_TAXES = "c",
                                                        FRONT_FOOTAGE = "c",
                                                        ACRES = "c",
                                                        TAXES_PAID = "c",
                                                        FOX_DELETED = "c",
                                                        PAR_DELETED = "c",
                                                        PARCEL_ID = "c",
                                                        OWNER_SORT = "c",
                                                        DELQ_TAXES = "c",
                                                        ZIPCODE = "c",
                                                        RentalRegSw = "c",
                                                        AppraisalArea="c"))
          
  )
  
  
  problems(df_year)
  
  
  
  #assign(df_taxinfo_2007, df_taxinfo_2007 %>% select(one_of(features_selected)))
  dim(df_year)
}


# for(year in c(seq(2010,2014))) {
#   print(paste("Processing the year :",year))
#   # Form the names of the csv file using year as the iterator
#   year_file <- paste0("./Data2_090216/taxinfo/",year,"/taxinfo",year,".csv")
#   
#   #Form the variable to assign to
#   df_year <- paste0("df_taxinfo_",year)
#   print(df_year)
#   
#   # Assign to a data fram
#   # assign(df_year, read_csv(year_file))
#   
#   
#   assign (df_year, read_csv(year_file, col_types = cols(SMDA_NUM = "c",
#                                                         UNIT = "c",
#                                                         LOC_STREET = "c",
#                                                         LOC_HOUSE_NO = "c",
#                                                         LOC_SEC_NO = "c",
#                                                         LOC_ST_DESC = "c",
#                                                         LOC_ST_IND = "c",
#                                                         LOC_ST_DIR = "c",
#                                                         TAX_DIST = "c",
#                                                         SCHOOL_CODE = "c",
#                                                         CLASS_CODE = "c",
#                                                         OWNER_LINE1 = "c",
#                                                         OWNER_LINE2 = "c",
#                                                         OWNER_LINE3 = "c",
#                                                         OWNER_LINE4 = "c",
#                                                         MAIL_LINE1 = "c",
#                                                         MAIL_LINE2 = "c",
#                                                         MAIL_LINE3 = "c",
#                                                         MAIL_LINE4 = "c",
#                                                         PROPERTY_DESCRIPTION1 = "c",
#                                                         PROPERTY_DESCRIPTION2 = "c",
#                                                         PROPERTY_DESCRIPTION3 = "c",
#                                                         PROPERTY_DESCRIPTION4 = "c",
#                                                         BOR_FLAG = "c",
#                                                         VALID_SALE = "c",
#                                                         MKT_LAND_VAL = "d",
#                                                         HMSTD_FLAG = "c",
#                                                         FILL_01 = "c",
#                                                         NUM_PARCELS = "c",
#                                                         CAUV_VALUE = "c",
#                                                         RED_25_FLAG = "c",
#                                                         BANK_CODE = "c",
#                                                         FILL_02 = "c",
#                                                         DEED_TYPE = "c",
#                                                         MKT_IMPR_VAL = "d",
#                                                         DIV_FLAG = "c",
#                                                         SALE_AMOUNT = "c",
#                                                         MKT_TOTAL_VAL = "d",
#                                                         NEW_CONS_FLAG = "c",
#                                                         SALE_DATE = "c",
#                                                         FORECL_FLAG = "c",
#                                                         CONVEY_NO = "c",
#                                                         SPEC_FLAG = "c",
#                                                         FILL_03 = "c",
#                                                         DEED_NUMBER = "c",
#                                                         ANNUAL_TAXES = "d",
#                                                         FRONT_FOOTAGE = "c",
#                                                         ACRES = "d",
#                                                         TAXES_PAID = "d",
#                                                         FOX_DELETED = "c",
#                                                         PAR_DELETED = "c",
#                                                         PARCEL_ID = "c",
#                                                         OWNER_SORT = "c",
#                                                         DELQ_TAXES = "d",
#                                                         ZIPCODE = "c",
#                                                         RentalRegSw = "c",
#                                                         AppraisalArea="c"))
#           
#   )
#   
#   
#   problems(df_year)
#   
#   
#   
#   #assign(df_taxinfo_2007, df_taxinfo_2007 %>% select(one_of(features_selected)))
#   dim(df_year)
# }
for(year in c(2015)) {
  print(paste("Processing the year :",year))
  # Form the names of the csv file using year as the iterator
  year_file <- paste0("./Data2_090216/taxinfo/",year,"/taxinfo",year,".csv")
  
  #Form the variable to assign to
  df_year <- paste0("df_taxinfo_",year)
  print(df_year)
  
  # Assign to a data fram
  # assign(df_year, read_csv(year_file))
  
  
  assign (df_year, read_csv(year_file, col_types = cols(AUD_PARCEL_ID = "c",
                                                        TWO_AND_HALF_RED_FLAG = "c",
                                                        HMSTD_FLAG = "c",
                                                        BOOK_NUM = "c",
                                                        PAGE_NUM = "c",
                                                        PARCEL_NUM = "c",
                                                        MLT_OWN = "c",
                                                        CLASS_CODE = "c",
                                                        AUD_CLASS_CODE_DESC = "c",
                                                        AppraisalArea	 = "c",
                                                        AppraisalAreaCodeDesc = "c",
                                                        OWNER_LINE1	 = "c",
                                                        OWNER_SEC_ADDR	 = "c",
                                                        OWNER_ST_NUM	 = "c",
                                                        OWNER_ST_DIR	 = "c",
                                                        OWNER_STREET_NAME	 = "c",
                                                        OWNER_ST_SUFF	 = "c",
                                                        OWNER_ST_SUFF_DIR	 = "c",
                                                        OWNER_SEC_ADDR	 = "c",
                                                        OWNER_CITY	 = "c",
                                                        OWNER_STATE	 = "c",
                                                        OWNER_ZIPCODE	 = "c",
                                                        OWNER_COUNTRY	 = "c",
                                                        PROPERTY_ST_NUM	 = "c",
                                                        PROPERTY_ST_DIRECTION	 = "c",
                                                        PROPERTY_ST_NAME	 = "c",
                                                        PROPERTY_ST_SFX	 = "c",
                                                        PROPERTY_CITY	 = "c",
                                                        PROPERTY_STATE	 = "c",
                                                        PROPERTY_ZIP	 = "c",
                                                        MAILING_NAME	 = "c",
                                                        MAILING_ATTN	 = "c",
                                                        MAILING_ST_NUM	 = "c",
                                                        MAILING_ST_DIR	 = "c",
                                                        MAILING_ST_NAME	 = "c",
                                                        MAILING_ST_SFX	 = "c",
                                                        MAILING_ST_SFX_DIR	 = "c",
                                                        MAILING_SEC_ADDRESS	 = "c",
                                                        MAILING_CITY	 = "c",
                                                        MAILING_STATE	 = "c",
                                                        MAILING_ZIPCODE	 = "c",
                                                        MAILING_COUNTRY	 = "c",
                                                        PROP_DESC	 = "c",
                                                        PARCEL_DIVIDED_FLAG	 = "c",
                                                        NEW_CONS_FLAG = "c",
                                                        SPL_FLAG	 = "c",
                                                        SCHOOL_CODE	 = "c",
                                                        SCHOOL_CODE_DESC	 = "c",
                                                        TAX_DIST	 = "c",
                                                        TAX_DIST_DESC	 = "c",
                                                        FORECL_FLAG	 = "c",
                                                        ACRES	= "d",
                                                        FRONT_FOOTAGE = "c",
                                                        RENTAL_REG_FLAG	 = "c",
                                                        BOARD_OF_REV_FLAG	 = "c",
                                                        SALE_DATE	= "c",
                                                        SALE_AMOUNT	 = "c",
                                                        SALE_NUM_PARCEL	 = "c",
                                                        SALE_CONV_NUM = "c",
                                                        SALE_DEED_NUM	 = "c",
                                                        SALE_SOURCE	 = "c",
                                                        SALE_TYPE	 = "c",
                                                        PREV_OWNER	 = "c",
                                                        PREV_OWNER_ATTN	 = "c",
                                                        AGRI_USE_VAL	 = "c",
                                                        MKT_LAND_VAL	 = "d",
                                                        MKT_IMPR_VAL	 = "d",
                                                        MKT_TOTAL_VAL	 = "d",
                                                        ANNUAL_TAXES = "d",
                                                        TAXES_PAID	 = "d",
                                                        DELQ_TAXES	 = "d",
                                                        DELQ_TAXES_PAID	 = "c",
                                                        PARCEL_ACTIVE = "c"))
          
  )
  
  
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

 

 
#2015 format change : we need to create the parcel id from the BOOK_NUM, PAGE_NUM_PARCEL_NUM,MLT_NUM
#create the parcelid from c(BOOK_NUM, PAGE_NUM, PARCEL_NUM, MLT_NUM)

df_taxinfo_2015 <- df_taxinfo_2015 %>% unite(PARCEL_ID, BOOK_NUM, PAGE_NUM,PARCEL_NUM,MLT_OWN, sep="")
#df_taxinfo_2015 <- df_taxinfo_2015%>%separate(SALE_DATE,c("SALE_DATE","SALE_TIME"), sep="[:space:]{1,2}")

df_taxinfo_2015 <- select(df_taxinfo_2015, one_of(features_selected))

df_taxinfo_2015 <- df_taxinfo_2015[c(which(df_taxinfo_2015$MKT_TOTAL_VAL > 0)),]

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
# 2007 data was read in as characters 
# So we need to change the  class to numeric
######
df_taxinfo_2007$MKT_LAND_VAL<-as.numeric(df_taxinfo_2007$MKT_LAND_VAL)
df_taxinfo_2007$MKT_IMPR_VAL<-as.numeric(df_taxinfo_2007$MKT_IMPR_VAL)
df_taxinfo_2007$MKT_TOTAL_VAL<-as.numeric(df_taxinfo_2007$MKT_TOTAL_VAL)
df_taxinfo_2007$ANNUAL_TAXES<-as.numeric(df_taxinfo_2007$ANNUAL_TAXES)
df_taxinfo_2007$TAXES_PAID<-as.numeric(df_taxinfo_2007$TAXES_PAID)
df_taxinfo_2007$DELQ_TAXES<-as.numeric(df_taxinfo_2007$DELQ_TAXES)
df_taxinfo_2007$ACRES<-as.numeric(df_taxinfo_2007$ACRES)




#######
# 2008 data was read in as characters 
# So we need to change the  class to numeric
######
df_taxinfo_2008$MKT_LAND_VAL<-as.numeric(df_taxinfo_2008$MKT_LAND_VAL)
df_taxinfo_2008$MKT_IMPR_VAL<-as.numeric(df_taxinfo_2008$MKT_IMPR_VAL)
df_taxinfo_2008$MKT_TOTAL_VAL<-as.numeric(df_taxinfo_2008$MKT_TOTAL_VAL)
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
df_taxinfo_2009$ANNUAL_TAXES<-as.numeric(df_taxinfo_2009$ANNUAL_TAXES)
df_taxinfo_2009$TAXES_PAID<-as.numeric(df_taxinfo_2009$TAXES_PAID)
df_taxinfo_2009$DELQ_TAXES<-as.numeric(df_taxinfo_2009$DELQ_TAXES)
df_taxinfo_2009$ACRES<-as.numeric(df_taxinfo_2009$ACRES)

 
df_taxinfo_2010$MKT_LAND_VAL<-as.numeric(df_taxinfo_2010$MKT_LAND_VAL)
df_taxinfo_2010$MKT_IMPR_VAL<-as.numeric(df_taxinfo_2010$MKT_IMPR_VAL)
df_taxinfo_2010$MKT_TOTAL_VAL<-as.numeric(df_taxinfo_2010$MKT_TOTAL_VAL)
df_taxinfo_2010$ANNUAL_TAXES<-as.numeric(df_taxinfo_2010$ANNUAL_TAXES)
df_taxinfo_2010$TAXES_PAID<-as.numeric(df_taxinfo_2010$TAXES_PAID)
df_taxinfo_2010$DELQ_TAXES<-as.numeric(df_taxinfo_2010$DELQ_TAXES)
df_taxinfo_2010$ACRES<-as.numeric(df_taxinfo_2010$ACRES)


df_taxinfo_2011$MKT_LAND_VAL<-as.numeric(df_taxinfo_2011$MKT_LAND_VAL)
df_taxinfo_2011$MKT_IMPR_VAL<-as.numeric(df_taxinfo_2011$MKT_IMPR_VAL)
df_taxinfo_2011$MKT_TOTAL_VAL<-as.numeric(df_taxinfo_2011$MKT_TOTAL_VAL)
df_taxinfo_2011$ANNUAL_TAXES<-as.numeric(df_taxinfo_2011$ANNUAL_TAXES)
df_taxinfo_2011$TAXES_PAID<-as.numeric(df_taxinfo_2011$TAXES_PAID)
df_taxinfo_2011$DELQ_TAXES<-as.numeric(df_taxinfo_2011$DELQ_TAXES)
df_taxinfo_2011$ACRES<-as.numeric(df_taxinfo_2011$ACRES)


df_taxinfo_2012$MKT_LAND_VAL<-as.numeric(df_taxinfo_2012$MKT_LAND_VAL)
df_taxinfo_2012$MKT_IMPR_VAL<-as.numeric(df_taxinfo_2012$MKT_IMPR_VAL)
df_taxinfo_2012$MKT_TOTAL_VAL<-as.numeric(df_taxinfo_2012$MKT_TOTAL_VAL)
df_taxinfo_2012$ANNUAL_TAXES<-as.numeric(df_taxinfo_2012$ANNUAL_TAXES)
df_taxinfo_2012$TAXES_PAID<-as.numeric(df_taxinfo_2012$TAXES_PAID)
df_taxinfo_2012$DELQ_TAXES<-as.numeric(df_taxinfo_2012$DELQ_TAXES)
df_taxinfo_2012$ACRES<-as.numeric(df_taxinfo_2012$ACRES)

df_taxinfo_2013$MKT_LAND_VAL<-as.numeric(df_taxinfo_2013$MKT_LAND_VAL)
df_taxinfo_2013$MKT_IMPR_VAL<-as.numeric(df_taxinfo_2013$MKT_IMPR_VAL)
df_taxinfo_2013$MKT_TOTAL_VAL<-as.numeric(df_taxinfo_2013$MKT_TOTAL_VAL)
df_taxinfo_2013$ANNUAL_TAXES<-as.numeric(df_taxinfo_2013$ANNUAL_TAXES)
df_taxinfo_2013$TAXES_PAID<-as.numeric(df_taxinfo_2013$TAXES_PAID)
df_taxinfo_2013$DELQ_TAXES<-as.numeric(df_taxinfo_2013$DELQ_TAXES)
df_taxinfo_2013$ACRES<-as.numeric(df_taxinfo_2013$ACRES)

df_taxinfo_2014$MKT_LAND_VAL<-as.numeric(df_taxinfo_2014$MKT_LAND_VAL)
df_taxinfo_2014$MKT_IMPR_VAL<-as.numeric(df_taxinfo_2014$MKT_IMPR_VAL)
df_taxinfo_2014$MKT_TOTAL_VAL<-as.numeric(df_taxinfo_2014$MKT_TOTAL_VAL)
df_taxinfo_2014$ANNUAL_TAXES<-as.numeric(df_taxinfo_2014$ANNUAL_TAXES)
df_taxinfo_2014$TAXES_PAID<-as.numeric(df_taxinfo_2014$TAXES_PAID)
df_taxinfo_2014$DELQ_TAXES<-as.numeric(df_taxinfo_2014$DELQ_TAXES)
df_taxinfo_2014$ACRES<-as.numeric(df_taxinfo_2014$ACRES)




# # REMOVE the records for which the ANNUAL_TAXES == 0
# df_taxinfo_2007 <- df_taxinfo_2007[c(which(df_taxinfo_2007$ANNUAL_TAXES > 0)),]
# df_taxinfo_2008 <- df_taxinfo_2008[c(which(df_taxinfo_2008$ANNUAL_TAXES > 0)),]
# df_taxinfo_2009 <- df_taxinfo_2009[c(which(df_taxinfo_2009$ANNUAL_TAXES > 0)),]
# df_taxinfo_2010 <- df_taxinfo_2010[c(which(df_taxinfo_2010$ANNUAL_TAXES > 0)),]
# df_taxinfo_2011 <- df_taxinfo_2011[c(which(df_taxinfo_2011$ANNUAL_TAXES > 0)),]
# df_taxinfo_2012 <- df_taxinfo_2012[c(which(df_taxinfo_2012$ANNUAL_TAXES > 0)),]
# df_taxinfo_2013 <- df_taxinfo_2013[c(which(df_taxinfo_2013$ANNUAL_TAXES > 0)),]
# df_taxinfo_2014 <- df_taxinfo_2014[c(which(df_taxinfo_2014$ANNUAL_TAXES > 0)),]
# df_taxinfo_2015 <- df_taxinfo_2015[c(which(df_taxinfo_2015$ANNUAL_TAXES > 0)),]



# # REMOVE the records for which the MKT_LAND_VAL == 0
 df_taxinfo_2007 <- df_taxinfo_2007[c(which(df_taxinfo_2007$MKT_LAND_VAL > 0)),]
 df_taxinfo_2008 <- df_taxinfo_2008[c(which(df_taxinfo_2008$MKT_LAND_VAL > 0)),]
 df_taxinfo_2009 <- df_taxinfo_2009[c(which(df_taxinfo_2009$MKT_LAND_VAL > 0)),]
 df_taxinfo_2010 <- df_taxinfo_2010[c(which(df_taxinfo_2010$MKT_LAND_VAL > 0)),]
 df_taxinfo_2011 <- df_taxinfo_2011[c(which(df_taxinfo_2011$MKT_LAND_VAL > 0)),]
 df_taxinfo_2012 <- df_taxinfo_2012[c(which(df_taxinfo_2012$MKT_LAND_VAL > 0)),]
 df_taxinfo_2013 <- df_taxinfo_2013[c(which(df_taxinfo_2013$MKT_LAND_VAL > 0)),]
 df_taxinfo_2014 <- df_taxinfo_2014[c(which(df_taxinfo_2014$MKT_LAND_VAL > 0)),]
 df_taxinfo_2015 <- df_taxinfo_2015[c(which(df_taxinfo_2015$MKT_LAND_VAL > 0)),]

  # REMOVE the records for which the MKT_TOTAL_VAL == 0
  df_taxinfo_2007 <- df_taxinfo_2007[c(which(df_taxinfo_2007$MKT_TOTAL_VAL > 100)),]
  df_taxinfo_2008 <- df_taxinfo_2008[c(which(df_taxinfo_2008$MKT_TOTAL_VAL > 100)),]
  df_taxinfo_2009 <- df_taxinfo_2009[c(which(df_taxinfo_2009$MKT_TOTAL_VAL > 100)),]
  df_taxinfo_2010 <- df_taxinfo_2010[c(which(df_taxinfo_2010$MKT_TOTAL_VAL > 100)),]
  df_taxinfo_2011 <- df_taxinfo_2011[c(which(df_taxinfo_2011$MKT_TOTAL_VAL > 100)),]
  df_taxinfo_2012 <- df_taxinfo_2012[c(which(df_taxinfo_2012$MKT_TOTAL_VAL > 100)),]
  df_taxinfo_2013 <- df_taxinfo_2013[c(which(df_taxinfo_2013$MKT_TOTAL_VAL > 100)),]
  df_taxinfo_2014 <- df_taxinfo_2014[c(which(df_taxinfo_2014$MKT_TOTAL_VAL > 100)),]
  df_taxinfo_2015 <- df_taxinfo_2015[c(which(df_taxinfo_2015$MKT_TOTAL_VAL > 100)),]

  # REMOVE the records for which the ANNUAL_TAXES <=  0
  df_taxinfo_2007 <- df_taxinfo_2007[c(which(df_taxinfo_2007$ANNUAL_TAXES > 100)),]
  df_taxinfo_2008 <- df_taxinfo_2008[c(which(df_taxinfo_2008$ANNUAL_TAXES > 100)),]
  df_taxinfo_2009 <- df_taxinfo_2009[c(which(df_taxinfo_2009$ANNUAL_TAXES > 100)),]
  df_taxinfo_2010 <- df_taxinfo_2010[c(which(df_taxinfo_2010$ANNUAL_TAXES > 100)),]
  df_taxinfo_2011 <- df_taxinfo_2011[c(which(df_taxinfo_2011$ANNUAL_TAXES > 100)),]
  df_taxinfo_2012 <- df_taxinfo_2012[c(which(df_taxinfo_2012$ANNUAL_TAXES > 100)),]
  df_taxinfo_2013 <- df_taxinfo_2013[c(which(df_taxinfo_2013$ANNUAL_TAXES > 100)),]
  df_taxinfo_2014 <- df_taxinfo_2014[c(which(df_taxinfo_2014$ANNUAL_TAXES > 100)),]
  df_taxinfo_2015 <- df_taxinfo_2015[c(which(df_taxinfo_2015$ANNUAL_TAXES > 100)),]

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


# SALE_AMOUNT need to be numeric for 
df_taxinfo_2007$SALE_AMOUNT<-as.numeric(df_taxinfo_2007$SALE_AMOUNT)
df_taxinfo_2008$SALE_AMOUNT<-as.numeric(df_taxinfo_2008$SALE_AMOUNT)
df_taxinfo_2009$SALE_AMOUNT<-as.numeric(df_taxinfo_2009$SALE_AMOUNT)
df_taxinfo_2010$SALE_AMOUNT<-as.numeric(df_taxinfo_2010$SALE_AMOUNT)
df_taxinfo_2011$SALE_AMOUNT<-as.numeric(df_taxinfo_2011$SALE_AMOUNT)
df_taxinfo_2012$SALE_AMOUNT<-as.numeric(df_taxinfo_2012$SALE_AMOUNT)
df_taxinfo_2013$SALE_AMOUNT<-as.numeric(df_taxinfo_2013$SALE_AMOUNT)
df_taxinfo_2014$SALE_AMOUNT<-as.numeric(df_taxinfo_2014$SALE_AMOUNT)
df_taxinfo_2015$SALE_AMOUNT<-as.numeric(df_taxinfo_2015$SALE_AMOUNT)


# Create a final data frame for further analysis : all years 2007-2015
# We'll remove 2015 as it does not seem right
df_all <- bind_rows(df_taxinfo_2007, df_taxinfo_2008, df_taxinfo_2009,df_taxinfo_2010,df_taxinfo_2011,df_taxinfo_2012,df_taxinfo_2013,df_taxinfo_2014)

# Get the complete cases 
# Remove all the observations for which we don't have NAs
df_complete_cases <- df_all[complete.cases(df_all),]

#From the df_complete_cases, select only the PARCEL_ID and ANNUAL Taxes
df_MKT_TOTAL_VAL <- df_complete_cases %>% select(one_of(c("DF_TAXINFO_YEAR","PARCEL_ID", "MKT_TOTAL_VAL")))
 
View(df_MKT_TOTAL_VAL)
summary(df_MKT_TOTAL_VAL)
# reshape by parcel id
reshape.by.parcelid <- function(df_MKT_TOTAL_VAL){
  #Reshape the train data into a matrix containing the yearly MKT_TOTAL_VAL for each parcel id
  #This is preparation required for time series clustering
  #Input: Train dataset which contain multiple rows x 1 column variables
  #Output: Matrix of 9 YEARLY  TAXES observations x 300,000 PARCEL_IDs
  
  # Instead of using reshap, we are using spread.
  #taxinfo_matrix <- reshape(df_MKT_TOTAL_VAL, v.names="MKT_TOTAL_VAL", idvar="DF_TAXINFO_YEAR", timevar="PARCEL_ID", direction="wide")
  
  # 
  taxinfo_matrix <- df_MKT_TOTAL_VAL  %>% spread("PARCEL_ID", value="MKT_TOTAL_VAL", fill=as.numeric(0))
  if (any(is.na(unlist(taxinfo_matrix)))) {
    stop("NA in taxinfo_matrix")
  }
   
  # retain only parcel ids with complete 8 years of data
  # we call this nz_taxinfo_matri - nz_ being non_zero
  nz_taxinfo_matrix <- taxinfo_matrix[,apply(taxinfo_matrix[c(1:ncol(taxinfo_matrix))],2, function(z) !any(z == 0))]
  
  return(nz_taxinfo_matrix)
}

# Call the reshape function 
taxinfo.matrix <- reshape.by.parcelid(df_MKT_TOTAL_VAL)


if (any(is.na(unlist(taxinfo.matrix)))) {
  stop("NA in taxinfo.matrix - B4")
}

rownames(taxinfo.matrix) <- taxinfo.matrix$DF_TAXINFO_YEAR

if (any(is.na(unlist(taxinfo.matrix)))) {
  stop("NA in taxinfo.matrix AFT")
}

# if there are any columns with na's we remove it
# we had found 1 column
taxinfo.matrix_no_na <- taxinfo.matrix[, colSums(is.na(taxinfo.matrix)) != nrow(taxinfo.matrix)]

# Identify which variables are identical 
taxinfo.matrix_uniq <- taxinfo.matrix_no_na[!duplicated(lapply(taxinfo.matrix_no_na, digest))]



duplicates <- taxinfo.matrix_no_na[duplicated(lapply(taxinfo.matrix_no_na, digest))]

#Remove the year ( column 1)
taxinfo.matrix_uniq[,1] <- NULL

# Perform Clustering of Variables

taxinfo.matrix_scl <-scale(taxinfo.matrix_uniq, scale=TRUE, center=TRUE)

# if there are any columns with na's we remove it
# we had found 1 column
taxinfo.matrix_no_na <- taxinfo.matrix_scl[, colSums(is.na(taxinfo.matrix_scl)) != nrow(taxinfo.matrix_scl)]

# For illustartive purposes we choose first 10 columns
Clustvar <-hclustvar(taxinfo.matrix_no_na[, 1:10])
plot(Clustvar)
#then first 100 columns
Clustvar100 <-hclustvar(taxinfo.matrix_no_na[, 1:100])
plot(Clustvar100)
part100 <- cutreevar(Clustvar100,11)

#plot(Clustvar100$height)
#stab100 <- stability(Clustvar100,B = 60, graph = TRUE)


#Now let's get some  random PARCEL_IDs
# About 1500 should do

n <- ncol(taxinfo.matrix_no_na)
taxinfo.matrix_shuffled <- taxinfo.matrix_no_na[,sample(n) ]
train_indices <- 1:round(0.024 * n)
train <- taxinfo.matrix_shuffled[,train_indices ]

#test_indices <- (round(0.214 * n) + 1):2*(round(0.214 * n))
#test <- taxinfo.matrix_shuffled[,test_indices]
skip_1500 = 1
if(skip_1500 == 0) {
Clustvar1500 <-hclustvar(train)
plot(Clustvar1500)

#####
# B is the Boot strapping sample and we determine the stability
# Evaluates the stability of partitions obtained from a hierarchy of p variables. This hierarchy is performed
# with hclustvar and the stability of the partitions of 2 to p-1 clusters is evaluated with a
# bootstrap approach. The boostrap approch is the following: hclustvar is applied to B bootstrap
# samples of the n rows. The partitions of 2 to p-1 clusters obtained from the B bootstrap hierarchies
# are compared with the partitions from the initial hierarchy . The mean of the corrected Rand
# indices is plotted according to the number of clusters. This graphical representation helps in the
# determination of a suitable numbers of clusters.

#stab1500 <- stability(Clustvar1500,B = 500, graph = TRUE)


# Could not get a graph : Make a rough partition of 11 clusters
part1500 <- cutreevar(Clustvar1500,11)
plot(Clustvar1500$height)

a <- part1500$var
} else {
 part100 <- cutreevar(Clustvar100,11)
 plot(Clustvar100$height)
 
 a <- part100$var

}
#Remove xs from Parcel ids


train_cl1  <- as.data.frame(row.names(a$cluster1), stringsAsFactors = FALSE)
train_cl2  <- as.data.frame(row.names(a$cluster2), stringsAsFactors = FALSE)
train_cl3  <- as.data.frame(row.names(a$cluster3), stringsAsFactors = FALSE)
train_cl4  <- as.data.frame(row.names(a$cluster4), stringsAsFactors = FALSE)
train_cl5  <- as.data.frame(row.names(a$cluster5), stringsAsFactors = FALSE)
train_cl6  <- as.data.frame(row.names(a$cluster6), stringsAsFactors = FALSE)
train_cl7  <- as.data.frame(row.names(a$cluster7), stringsAsFactors = FALSE)
train_cl8  <- as.data.frame(row.names(a$cluster8), stringsAsFactors = FALSE)
train_cl9  <- as.data.frame(row.names(a$cluster9), stringsAsFactors = FALSE)
train_cl10 <- as.data.frame(row.names(a$cluster10), stringsAsFactors = FALSE)
train_cl11 <- as.data.frame(row.names(a$cluster11), stringsAsFactors = FALSE)
# train_cl12 <- as.data.frame(row.names(a$cluster12), stringsAsFactors = FALSE)
# train_cl13 <- as.data.frame(row.names(a$cluster13), stringsAsFactors = FALSE)
# train_cl14 <- as.data.frame(row.names(a$cluster14), stringsAsFactors = FALSE)
# train_cl15 <- as.data.frame(row.names(a$cluster15), stringsAsFactors = FALSE)

# Remove X's from the PARCEL IDs
train_cl1  <- apply(train_cl1,2, function(y) as.character(gsub("X", "", y)))
train_cl2  <- apply(train_cl2,2, function(y) as.character(gsub("X", "", y)))
train_cl3  <- apply(train_cl3,2, function(y) as.character(gsub("X", "", y)))
train_cl4  <- apply(train_cl4,2, function(y) as.character(gsub("X", "", y)))
train_cl5  <- apply(train_cl5,2, function(y) as.character(gsub("X", "", y)))
train_cl6  <- apply(train_cl6,2, function(y) as.character(gsub("X", "", y)))
train_cl7  <- apply(train_cl7,2, function(y) as.character(gsub("X", "", y)))
train_cl8  <- apply(train_cl8,2, function(y) as.character(gsub("X", "", y)))
train_cl9  <- apply(train_cl9,2, function(y) as.character(gsub("X", "", y)))
train_cl10 <- apply(train_cl10,2, function(y) as.character(gsub("X", "", y)))
train_cl11 <- apply(train_cl11,2, function(y) as.character(gsub("X", "", y)))
# train_cl12 <- apply(train_cl12,2, function(y) as.character(gsub("X", "", y)))
# train_cl13 <- apply(train_cl13,2, function(y) as.character(gsub("X", "", y)))
# train_cl14 <- apply(train_cl14,2, function(y) as.character(gsub("X", "", y)))
# train_cl15 <- apply(train_cl15,2, function(y) as.character(gsub("X", "", y)))
#   


# From each of the clusters get back the time series data

ts_train_cl1 <-ts(rowMeans(taxinfo.matrix[c(train_cl1)]))

plot.ts(ts_train_cl1)
# Perform Holts Winters Smoothing and Forecast

#ts_train_cl1_forecast  <- HoltWinters(ts_train_cl1, beta=FALSE, gamma=FALSE)
#ts_train_cl1_forecast2 <- forecast.HoltWinters(ts_train_cl1_forecast, h=10)

#Mean absolute Percentage error
mape <- function(y, yhat) {
  
  mean(abs((y - yhat)/y)) 
}

funggcast<-function(dn,fcast){ 
  # fuction is from here
  # http://davenportspatialanalytics.squarespace.com/blog/2012/3/14/plotting-forecast-objects-in-ggplot-part-1-extracting-the-da.html
  #require(zoo) #needed for the 'as.yearmon()' function
  fcast<-as.vector(fcast)
  #en<-max(time(fcast$mean)) #extract the max date used in the forecast
  en<- ( max( time(fcast)))
  #Extract Source and Training Data
  ds<-as.data.frame(window(dn,end=en))
  names(ds)<-'observed'
  ds$date<-as.Date(time(window(dn,end=en)))
  
  #Extract the Fitted Values (need to figure out how to grab confidence intervals)
  dfit<-as.data.frame(fcast$fitted)
  dfit$date<-as.Date(time(fcast$fitted))
  names(dfit)[1]<-'fitted'
  
  ds<-merge(ds,dfit,all.x=T) #Merge fitted values with source and training data
  
  #Exract the Forecast values and confidence intervals
  dfcastn<-as.data.frame(fcast)
  dfcastn$date<-as.Date(as.yearmon(row.names(dfcastn)))
  names(dfcastn)<-c('forecast','lo80','hi80','lo95','hi95','date')
  
  pd<-merge(ds,dfcastn,all.x=T) #final data.frame for use in ggplot
  return(pd)
  
}


#plot.forecast(ts_train_cl1_forecast2)
# Use Simple moving average for Holtz-Winters 
# Beta and gamma are set to FALSE

forecast_clusters <-function ( clst_num, partvar, taxinfo.matrix  ) {
  arg2 <- partvar[clst_num]
  train_cl_num  <- as.data.frame(row.names(arg2[[1]]), stringsAsFactors = FALSE)
  train_cl_num  <- apply(train_cl_num,2, function(y) as.character(gsub("X", "", y)))
  ts_train_cl_num <-ts((rowMeans(taxinfo.matrix[c(train_cl_num)])),start = c(2007))
  l_start <- rowMeans(taxinfo.matrix[c(train_cl_num)])
  b_start <- l_start[2] - l_start[1]
  
  ts_train_cl_num_forecast  <- HoltWinters(ts_train_cl_num, beta=FALSE, gamma=FALSE, l.start=l_start[1],b.start = b_start)
  plot(ts_train_cl_num_forecast)
  ts_train_cl_num_forecast2 <- forecast.HoltWinters(ts_train_cl_num_forecast, h=4)
  
  title <- paste("Mean of MKT_TOTAL_VAL for Cluster ", clst_num)
  #plot.ts(ts_train_cl_num)
  plot.forecast(ts_train_cl_num_forecast2,ylab="MKT_TOTAL_VAL - row means", main=title)
  
  
}

 


mkt_val_lm_forecast <- function (clst_num, partvar, taxinfo.matrix, poly_order) {
  arg2 <- partvar[clst_num]
  train_cl_num  <- as.data.frame(row.names(arg2[[1]]), stringsAsFactors = FALSE)
  train_cl_num  <- apply(train_cl_num,2, function(y) as.character(gsub("X", "", y)))
  ts_train_cl_num <-ts((rowMeans(taxinfo.matrix[c(train_cl_num)])),start = c(2007))
  
  Time <- c(seq(2007,2014))
  
  #Time <- Time-2010
  
  Future_Time <- c(seq(2007,2018))
  Future_Time <- data.frame(Time = Future_Time  )      
  
  if ( poly_order == 1 ){
  title <- paste("Mean of MKT_TOTAL_VAL for  1st order  & Cluster ", clst_num)
  }
  if ( poly_order == 2 ){
    title <- paste("Mean of MKT_TOTAL_VAL for  2nd order  & Cluster ", clst_num)
  }
  if ( poly_order == 3 ){
    title <- paste("Mean of MKT_TOTAL_VAL for  3rd order  & Cluster ", clst_num)
  } 
  if ( poly_order == 4){
    title <- paste("Mean of MKT_TOTAL_VAL for  4th order  & Cluster ", clst_num)
  } 
  
  
  lm_mkt_val2 <-lm(ts_train_cl_num[1:8] ~ poly(Time,poly_order))
   #plot(predict(lm_mkt_val2, Future_Time), ylab="MKT_TOTAL_VAL - row means", main=title)
  pred_model <- predict.lm(lm_mkt_val2, newdata = Future_Time)
  
   
  df_mkt_val2 <- data.frame(pred_model, Future_Time)
  
  
  # Data Layer
  n2 <-(ggplot)
  # 
  # # Data + Aesthetics Mapping 
  n2 <-ggplot(df_mkt_val2,aes(y = pred_model, x= Time, alpha=0.7, col = Time))
  #n2 <- n2 + ggplot(data.frame(ts_train_cl_num),aes(y = ts_train_cl_num[1:8], x= Time, alpha=0.5, col = as.factor(Time)))
  
  # 
  # # Data + aes + Geometries 
  n2 <- n2 + geom_point() 
  n2 <- n2 + geom_line(data = df_mkt_val2)
  # 
  # # Data + Aesthetic Mapping +  Geom + Facets
  # #n <- n + facet_grid(. ~ Department.Title ) 
  # 
  # #Data + Aesthetics + Geoms + Facets + Statistics
  # # ... add a linear regression model here
  n2 <- n2 + geom_smooth(method="gam" ) 
  # #Data + Aesthetics + Geoms + Facets + Statistics + Co-ordinates
  # #n <- n + scale_y_discrete(limits=c("00000","120000"), breaks=seq(00000,120000,10000))
  n2 <- n2 + xlab("Years")
  n2 <- n2 + ylab( " mean MKT_VAL in dollars ")
  # 
  # #Data + Aesthetics + Geoms + Facets + Statistics + Co-ordinates + Theme 
  # n <- n + theme(axis.text.x = element_text(angle=305))
  # 
  n2 <- n2 + ggtitle(title)
  print(n2)
  
  
}

# Function to estimate MAPE
# Mean absolute Percentage error

  mape <- function(y, yhat)
  mean(abs((y - yhat)/y))

plot_act_pred <- function (clst_num, partvar, taxinfo.matrix, poly_order) {
  arg2 <- partvar[clst_num]
  train_cl_num  <- as.data.frame(row.names(arg2[[1]]), stringsAsFactors = FALSE)
  train_cl_num  <- apply(train_cl_num,2, function(y) as.character(gsub("X", "", y)))
  ts_train_cl_num <-ts((rowMeans(taxinfo.matrix[c(train_cl_num)])),start = c(2007))
  
  Time <- c(seq(2007,2012))
  
  #Time <- Time-2010
  
  Future_Time <- c(seq(2007,2018))
  Future_Time <- data.frame(Time = Future_Time  )      
  
 
  
  lm_mkt_val2 <-lm(ts_train_cl_num[1:6] ~ poly(Time,poly_order))

  #plot(predict(lm_mkt_val2, Future_Time), ylab="MKT_TOTAL_VAL - row means", main=title)
  pred_model <- predict.lm(lm_mkt_val2, newdata = Future_Time)
  
  summary(pred_model)
  
  df_mkt_val2 <- data.frame(pred_model, Future_Time)
  
  #pd <- funggcast(ts_train_cl_num, lm_mkt_val2[1:8])
  dn <- ts_train_cl_num
  fcast <- df_mkt_val2
  # fuction is from here
  # http://davenportspatialanalytics.squarespace.com/blog/2012/3/14/plotting-forecast-objects-in-ggplot-part-1-extracting-the-da.html
  #require(zoo) #needed for the 'as.yearmon()' function
  #fcast<-as.vector(fcast)
  #en<-max(time(fcast$mean)) #extract the max date used in the forecast
  en<- max(Future_Time$Time)
  #Extract Source and Training Data
  ds<-as.data.frame(window(dn,end=en))
  names(ds)<-'observed'
  #ds$date<-as.Date(time(window(dn,end=en)))
  ds$date<-as.numeric(time(window(ts_train_cl_num,end=en)))
  
  #Extract the Fitted Values  
  dfit<-as.data.frame(fcast$pred_model)
  dfit$date<-as.numeric(fcast$Time)
  names(dfit)[1]<-'fitted'
  
  
  
  ds<-merge(ds,dfit,all.x=TRUE) #Merge fitted values with source and training data
  
  # Compute the mape 
  mape_val <-as.numeric(mape(ds$observed, ds$fitted))
  
  df_mape <- data.frame(as.numeric(mape_val), as.numeric(poly_order), as.numeric(clst_num))
   
  colnames(df_mape) <- c("mape", "poly_order","cluster")
   
  
    

  
   
  
  # Moving on to Forecast - here is the period for forecast
  Forecast_Time <- c(seq(2015,2018))
  Forecast_Time <- data.frame(Time = Forecast_Time  )    
  
  pred_model <- predict.lm(lm_mkt_val2, newdata = Forecast_Time)
  #                                                                                                                                                                                                                             plot(pred_model, ylab="MKT_TOTAL_VAL - row means", main=title)
 
  dfcastn <- data.frame(pred_model, Forecast_Time)
  names(dfcastn)<-c('forecast','date')
  
  # 
  # #Exract the Forecast values  
  # dfcastn<-as.data.frame(fcast)
  # #dfcastn$date<-as.Date(as.yearmon(row.names(dfcastn)))
  # dfcastn$date<-  as.numeric(fcast$Time)
  # names(dfcastn)<-c('forecast','lo80','hi80','lo95','hi95','date')
  # 
   pd<-merge(ds,dfcastn,all.x=TRUE) #final data.frame for use in ggplot
  
  
   if ( poly_order == 1 ){
     title <- paste("Mean of MKT_TOTAL_VAL for  1st order  & Cluster ", clst_num, "MAPE - ", mape_val)
   }
   if ( poly_order == 2 ){
     title <- paste("Mean of MKT_TOTAL_VAL for  2nd order  & Cluster ", clst_num, "MAPE - ", mape_val)
   }
   if ( poly_order == 3 ){
     title <- paste("Mean of MKT_TOTAL_VAL for  3rd order  & Cluster ", clst_num, "MAPE - ", mape_val)
   } 
  
  
  
  # Data Layer
  n2 <-(ggplot)
  # 
  # # Data + Aesthetics Mapping 
  n2 <-ggplot(ds,aes(y = observed, x= Time, alpha=0.7))
  #n2 <- n2 + ggplot(data.frame(ts_train_cl_num),aes(y = ts_train_cl_num[1:8], x= Time, alpha=0.5, col = as.factor(Time)))
  
  # 
  # # Data + aes + Geometries 
  n2 <- n2 + geom_point() 
  n2 <- n2 + geom_line(col = 'red')
  n2 <- n2 + geom_line(aes(y=fitted),col='blue')
  #n2 <- n2 + geom_line(aes(y=forecast), col='black') 
  
  
  # 
  # # Data + Aesthetic Mapping +  Geom + Facets
  # #n <- n + facet_grid(. ~ Department.Title ) 
  # 
  # #Data + Aesthetics + Geoms + Facets + Statistics
  # # ... add a linear regression model here
  #n2 <- n2 + geom_smooth(method="gam" ) 
  # #Data + Aesthetics + Geoms + Facets + Statistics + Co-ordinates
  # #n <- n + scale_y_discrete(limits=c("00000","120000"), breaks=seq(00000,120000,10000))
  n2 <- n2 + xlab("Years")
  n2 <- n2 + ylab(" mean MKT_VAL in dollars ")
  # 
  # #Data + Aesthetics + Geoms + Facets + Statistics + Co-ordinates + Theme 
  # n <- n + theme(axis.text.x = element_text(angle=305))
  # 
  n2 <- n2 + ggtitle(title)
  print(n2)
  
  return(df_mape)
}



linear_regresion_model5 <- function (partvar, taxinfo.matrix, poly_order) {
  
  for ( clst_num in c(seq(1:11))) {
  
  
  arg2 <- partvar[clst_num]
  train_cl_num  <- as.data.frame(row.names(arg2[[1]]), stringsAsFactors = FALSE)
  train_cl_num  <- apply(train_cl_num,2, function(y) as.character(gsub("X", "", y)))
  ts_train_cl_num <-ts((rowMeans(taxinfo.matrix[c(train_cl_num)])),start = c(2007))
  
  Time <- c(seq(2007,2014))
  
 
    
  Future_Time <- c(seq(2007,2018))
  Future_Time <- data.frame(Time = Future_Time  )      
  title <- paste("Mean of MKT_TOTAL_VAL for Cluster  ", clst_num, " Order - ", poly_order)
  
  
  
  title <- paste("Mean of MKT_TOTAL_VAL for (", poly_order," order plynomial)")
  
  lm_mkt_val3 <-lm(ts_train_cl_num[1:8] ~ poly(Time,poly_order))
  summary(lm_mkt_val3)
  #plot(predict(lm_mkt_val3, Future_Time), ylab="MKT_TOTAL_VAL - row means", main=title)
  pred_model <- predict.lm(lm_mkt_val3, newdata = Future_Time)
  #                                                                                                                                                                                                                             plot(pred_model, ylab="MKT_TOTAL_VAL - row means", main=title)
  summary(pred_model)
  
   
  
  data <- data.frame(pred_model, Future_Time)
  
  len <- length(Future_Time)
  data$clst_num <- unlist(rep(clst_num,times = len))
  data$clst_num <-as.numeric(data$clst_num) 
  
  
  # init the df_data_all with the first cluster 
  if(clst_num == 1) {
    df_data_all <-data
  }
  
  # now row bind the rest of data from the clusters 
  
  # Now row-bind all the buffer zones together
  df_data_all <- bind_rows(df_data_all, data)
  
  if(clst_num == 11) {
  # Data Layer
  n3 <-(ggplot)
  # 
  # # Data + Aesthetics Mapping 
  n3 <-ggplot(df_data_all,aes(y = pred_model, x= Time, alpha=0.7, col = Time))
  # 
  # # Data + aes + Geometries 
  n3 <- n3 + geom_point() 
  n3 <- n3 + geom_line()
  # 
  # # Data + Aesthetic Mapping +  Geom + Facets
  # #n <- n + facet_grid(. ~ Department.Title ) 
  # 
  # #Data + Aesthetics + Geoms + Facets + Statistics
  # # ... add a linear regression model here
  n3 <- n3 + geom_smooth(method="gam" ) 
  # #Data + Aesthetics + Geoms + Facets + Statistics + Co-ordinates
  # #n <- n + scale_y_discrete(limits=c("00000","120000"), breaks=seq(00000,120000,10000))
  n3 <- n3 + xlab("Years")
  n3 <- n3 + ylab("MKT_VAL - row means ")
  # 
  # #Data + Aesthetics + Geoms + Facets + Statistics + Co-ordinates + Theme 
  # n <- n + theme(axis.text.x = element_text(angle=305))
  # 
  n3 <- n3 + ggtitle(title)
  n3 <- n3 +facet_wrap( ~ clst_num)
  print(n3)
  
  
  
  }
  }
  
  
}

plot_mape_bar_chart<- function(df_mape_all) {
  
  # Data Layer
  n3 <-(ggplot)
  # 
  # # Data + Aesthetics Mapping 
  n3 <-ggplot(df_mape_all,aes( x= poly_order, y = mape, col=as.factor(poly_order)))
  # 
  # # Data + aes + Geometries 
  n3 <- n3 + geom_point() 
  # 
  # # Data + Aesthetic Mapping +  Geom + Facets
  # #n <- n + facet_grid(. ~ Department.Title ) 
  # 
  # #Data + Aesthetics + Geoms + Facets + Statistics
  # # ... add a linear regression model here
  #n3 <- n3 + geom_smooth(method="gam" ) 
  # #Data + Aesthetics + Geoms + Facets + Statistics + Co-ordinates
  # #n <- n + scale_y_discrete(limits=c("00000","120000"), breaks=seq(00000,120000,10000))
  n3 <- n3 + xlab("Polynomial Order - ( Linear, Quadratic, Cubic)")
  n3 <- n3 + ylab("Mean Absolute Percentage Error ")
  
  
  # 
  # #Data + Aesthetics + Geoms + Facets + Statistics + Co-ordinates + Theme 
  # n <- n + theme(axis.text.x = element_text(angle=305))
  # 
  n3 <- n3 + ggtitle("MAPE")
  n3 <- n3 +facet_wrap( ~ cluster)
  print(n3)
  
  
  
  
}

# Use Holt-Winters  for Simple Moving Average
for ( clst in c(seq(1:11))) {
 forecast_clusters(clst,a, taxinfo.matrix)
 
}
 
 

# we create three models of regressions
# 1st order - a + T              ( linear)
# 2nd order a + bT + cT^2        ( quadratic)
# 3rd order a = bT + cT^2 + dT^3 ( cubic)

 for( poly_order in c(seq(1:3))){
  
  for ( clst in c(seq(1:11))) {
  #mkt_val_lm_forecast(clst,a, taxinfo.matrix, poly_order)
  
  #df_mape_clusters <- plot_act_pred(clst,a, taxinfo.matrix, poly_order)
  df_mape_clusters <- plot_act_pred(clst,a, taxinfo.matrix[c(1:6),], poly_order)
  if (clst == 1) {
    df_mape_clst_poly <- df_mape_clusters
    }
  else {
    df_mape_clst_poly <- bind_rows(df_mape_clst_poly, df_mape_clusters)
    }
  }
  
  if (poly_order == 1) {
     df_mape_all <- df_mape_clst_poly
    } 
  else 
     {
      df_mape_all <- bind_rows(df_mape_all, df_mape_clst_poly)
  }
   
   
   
   
  linear_regresion_model5(a, taxinfo.matrix, poly_order)
  
  
  
 }

plot_mape_bar_chart(df_mape_all)

stop()


### Perform analysis on the 
# Core PARCEL Ids.
###

for(zone in c("CENTER", "EDGE")) {
  print(paste("Processing the zone :",zone))
  # Form the names of the csv file using year as the iterator
  buffer_zone_file <- paste0("./Data2_090216/parcel_csv/StreetCarParcels_",zone,".csv")
  
  #Form the variable to assign to
  df_buffer_zone <- paste0("df_buffer_",zone)
  print(df_buffer_zone)
  
  # Assign to a data fram
  # assign(df_year, read_csv(year_file))
  
  assign (df_buffer_zone, read_csv(buffer_zone_file, col_types = cols(GRPPCLID = "c",
                                                               BOOK = "c",
                                                               PAGE = "c",
                                                               PARCEL = "c",
                                                               MLTOWN = "c",
                                                               PARCELID = "c",
                                                               PNTPCLID = "c",
                                                               PROPTYID = "c",
                                                               AUDPCLID = "c",
                                                               AUDPTYID = "c",
                                                               TAXDST = "c",
                                                               OWNER6 = "c",
                                                               OWNNM1 = "c",
                                                               OWNNM2 = "c",
                                                               OWNAD1 = "c",
                                                               OWNAD1A = "c",
                                                               OWNAD2 = "c",
                                                               LGLDS1 = "c",
                                                               LGLDS2 = "c",
                                                               LGLDS3 = "c",
                                                               PREVOWN1 = "c",
                                                               PREVOWN2 = "c",
                                                               SPLFLG = "c",
                                                               NEWFLG = "c",
                                                               MKTLND = "c",
                                                               MKTIMP = "c",
                                                               MKTCAU = "c",
                                                               CLASS = "c",
                                                               NHBDNO = "c",
                                                               ADDRNO = "c",
                                                               ADDRST = "c",
                                                               ADDRSF = "c",
                                                               BANKCD = "c",
                                                               MLNM1 = "c",
                                                               MLNM2 = "c",
                                                               MLADR1 = "c",
                                                               MLADR1A = "c",
                                                               MLADR2 = "c",
                                                               CNTDUE = "c",
  DLNQDT= "c",	CNTSTG= "c",	CNTTRM= "c",	CNTFLG= "c",	RECST= "c",	SALDAT= "c",	NUMPCL= "c",	SALTYP= "c",	SALAMT= "c",	SALSRC= "c",
  VALID= "c",	SALCNV= "c",	DEEDNO= "c",	INSTTY= "c",	ACREDEED= "c",	LOC_ST_IND= "c",	LOC_ST_DIR= "c",	LOC_SEC_NO= "c",
  SCHOOL_COD= "c",	BOR_FLAG= "c",	HMSD_FLAG= "c",	PARSTAT= "c",	RED_25_FLA= "c",	DIV_FLAG= "c",	MKT_TOTAL_= "c",
  FORECL_FLA= "c",	ANNUAL_TAX= "c",	FRONT_FOOT= "c",	TAXES_PAID= "c",	PAR_DELETE= "c",	DELQ_TAXES= "c",
  LGLDS4= "c",	CONVEY_NO= "c",	OWNER48= "c",	EXLUCODE= "c",	NUM_UNITS= "c",	TAXDST_DIS= "c",	DATE_CREAT= "c",
  OWNADCITY= "c",	OWNADSTATE= "c",	OWNADZIP= "c",	APPRAR= "c",	APPRAR_DIS= "c",	CONBUILD_F= "c",
  CURYR_FLAG= "c",	RENT_REG_F= "c",	SCHOOL_C_1= "c",	DELQ_TAX_1= "c",
  Shape_Leng= "d",	Shape_Area= "d",	centroid_x= "d",	centroid_y= "d",	cent_long= "d",	cent_lat= "d")
                                                               
                                                      ))
  
  
  problems(df_buffer_zone)
  
  
  
  #assign(df_taxinfo_2007, df_taxinfo_2007 %>% select(one_of(features_selected)))
  dim(df_buffer_zone)
}

for(zone in c("CORE")) {
  print(paste("Processing the zone :",zone))
  # Form the names of the csv file using year as the iterator
  buffer_zone_file <- paste0("./Data2_090216/parcel_csv/StreetCarParcels_",zone,".csv")
  
  #Form the variable to assign to
  df_buffer_zone <- paste0("df_buffer_",zone)
  print(df_buffer_zone)
  
  # Assign to a data fram
  # assign(df_year, read_csv(year_file))
  
  assign (df_buffer_zone, read_csv(buffer_zone_file, col_types = cols(GRPPCLID = "c",
                                                                      MLTOWN = "c",
                                                                      PARCELID = "c",
                                                                      PNTPCLID = "c",
                                                                      TAXDST = "c",
                                                                      OWNNM1 = "c",
                                                                      PREVOWN1 = "c",
                                                                      NEWFLG = "c",
                                                                      MKTLND = "c",
                                                                      MKTIMP = "c",
                                                                      MKTCAU = "c",
                                                                      CLASS = "c",
                                                                      NHBDNO = "c",
                                                                      ADDRNO = "c",
                                                                      ADDRST = "c",
                                                                      ADDRSF = "c",
                                                                      BANKCD = "c",
                                                                      MLNM1 = "c",
                                                                      MLNM2 = "c",
                                                                      MLADR1 = "c",
                                                                      MLADR1A = "c",
                                                                      MLADR2 = "c",
                                                                      CNTDUE = "c",
                                                                      DLNQDT= "c",	CNTSTG= "c",	CNTTRM= "c",	CNTFLG= "c",	RECST= "c",	SALDAT= "c",	NUMPCL= "c",	SALTYP= "c",	SALAMT= "c",	SALSRC= "c",
                                                                      VALID= "c",	SALCNV= "c",	DEEDNO= "c",	INSTTY= "c",	ACREDEED= "c",	LOC_ST_IND= "c",	LOC_ST_DIR= "c",	LOC_SEC_NO= "c",
                                                                      SCHOOL_COD= "c",	BOR_FLAG= "c",	HMSD_FLAG= "c",	PARSTAT= "c",	RED_25_FLA= "c",	DIV_FLAG= "c",	MKT_TOTAL_= "c",
                                                                      FORECL_FLA= "c",	ANNUAL_TAX= "c",	FRONT_FOOT= "c",	TAXES_PAID= "c",	PAR_DELETE= "c",	DELQ_TAXES= "c",
                                                                      LGLDS4= "c",	CONVEY_NO= "c",	OWNER48= "c",	EXLUCODE= "c",	NUM_UNITS= "c",	TAXDST_DIS= "c",	DATE_CREAT= "c",
                                                                      OWNADCITY= "c",	OWNADSTATE= "c",	OWNADZIP= "c",	APPRAR= "c",	APPRAR_DIS= "c",	CONBUILD_F= "c",
                                                                      CURYR_FLAG= "c",	RENT_REG_F= "c",	SCHOOL_C_1= "c",	DELQ_TAX_1= "c",
                                                                      Shape_Leng= "d",	Shape_Area= "d",	centroid_x= "d",	centroid_y= "d",	cent_long= "d",	cent_lat= "d")
                                   
  ))
  
  
  problems(df_buffer_zone)
  
  
  
  #assign(df_taxinfo_2007, df_taxinfo_2007 %>% select(one_of(features_selected)))
  dim(df_buffer_zone)
}


#create the parcelid from c(BOOK_NUM, PAGE_NUM, PARCEL_NUM, MLT_NUM)
df_buffer_CENTER <- df_buffer_CENTER %>% unite(PARCEL_ID, BOOK, PAGE,PARCEL,MLTOWN, sep="")
df_buffer_EDGE <- df_buffer_EDGE %>% unite(PARCEL_ID, BOOK, PAGE,PARCEL,MLTOWN, sep="")
df_buffer_CORE <- df_buffer_CORE %>% unite(PARCEL_ID, PARCELID,MLTOWN, sep="")


# Now make a selection of the PARCEL_IDs and their coordinates
buff_zone_features <-c("PARCEL_ID",  "MKT_TOTAL_", "centroid_x", "centroid_y", "cent_long", "cent_lat")

df_buffer_CENTER <- select(df_buffer_CENTER, one_of(buff_zone_features))
df_buffer_EDGE   <- select(df_buffer_EDGE,   one_of(buff_zone_features))
df_buffer_CORE   <- select(df_buffer_CORE,   one_of(buff_zone_features))

# Now remove the Parcels with 0 ANNUAL _TAXES

df_buffer_CENTER <- df_buffer_CENTER[c(which(as.numeric(df_buffer_CENTER$MKT_TOTAL_VAL) > 0)),]
df_buffer_EDGE <-   df_buffer_EDGE[c(which(as.numeric(df_buffer_EDGE$MKT_TOTAL_VAL) > 0)),]
df_buffer_CORE <-   df_buffer_CORE[c(which(as.numeric(df_buffer_CORE$MKT_TOTAL_VAL) > 0)),]


# Now lets add the ZONEs in the respective data frames

#Lets add the Year to the data frame

len <- length(df_buffer_CENTER$PARCEL_ID)
df_buffer_CENTER$DF_BUFFER_ZONE<-unlist(rep("CENTER",times =len))
df_buffer_CENTER$DF_BUFFER_ZONE <-as.character(df_buffer_CENTER$DF_BUFFER_ZONE)

len <- length(df_buffer_EDGE$PARCEL_ID)
df_buffer_EDGE$DF_BUFFER_ZONE<-unlist(rep("EDGE",times =len))
df_buffer_EDGE$DF_BUFFER_ZONE <-as.character(df_buffer_EDGE$DF_BUFFER_ZONE)

len <- length(df_buffer_CORE$PARCEL_ID)
df_buffer_CORE$DF_BUFFER_ZONE<-unlist(rep("CORE",times =len))
df_buffer_CORE$DF_BUFFER_ZONE <-as.character(df_buffer_CORE$DF_BUFFER_ZONE)

# Now row-bind all the buffer zones together
df_buffer_zone_all <- bind_rows(df_buffer_CORE, df_buffer_CENTER, df_buffer_EDGE)

# Remove all the Parcels with 0 Annual Taxes
df_buffer_zone_all <- df_buffer_zone_all[c(which(as.numeric(df_buffer_zone_all$MKT_TOTAL_VAL) > 0)),]

# Remove MKT_TOTAL_VAL field 
df_buffer_zone_all$MKT_TOTAL_VAL  <- NULL

# reshape by parcel id
reshape.by.parcelid <- function(df_MKT_TOTAL_VAL){
  #Reshape the train data into a matrix containing the yearly MKT_TOTAL_VAL for each parcel id
  #This is preparation required for time series clustering
  #Input: Train dataset which contain multiple rows x 1 column variables
  #Output: Matrix of 9 YEARLY  TAXES observations x 300,000 PARCEL_IDs
  
  # Instead of using reshap, we are using spread.
  #taxinfo_matrix <- reshape(df_MKT_TOTAL_VAL, v.names="MKT_TOTAL_VAL", idvar="DF_TAXINFO_YEAR", timevar="PARCEL_ID", direction="wide")
  
  # 
  taxinfo_matrix <- df_MKT_TOTAL_VAL  %>% spread("PARCEL_ID", value="MKT_TOTAL_VAL", fill=as.numeric(0))
  if (any(is.na(unlist(taxinfo_matrix)))) {
    stop("NA in taxinfo_matrix")
  }
  
  # retain only parcel ids with complete 8 years of data
  # we call this nz_taxinfo_matri - nz_ being non_zero
 # nz_taxinfo_matrix <- taxinfo_matrix[,apply(taxinfo_matrix[c(1:ncol(taxinfo_matrix))],2, function(z) !any(z == 0))]
  
  return(taxinfo_matrix)
}

# Now Filter using semi_join the df_MKT_TOTAL_VAL with the CORE zone
# Select only those in df_MKT_TOTAL_VAL which have PARCEL_IDs in df_buffer_CORE
df_MKT_TOTAL_VAL_CORE <- semi_join(df_MKT_TOTAL_VAL, df_buffer_CORE, by="PARCEL_ID")
taxinfo_CORE.matrix  <- reshape.by.parcelid(df_MKT_TOTAL_VAL_CORE)

df_MKT_TOTAL_VAL_CENTER <- semi_join(df_MKT_TOTAL_VAL, df_buffer_CENTER, by="PARCEL_ID")
df_MKT_TOTAL_VAL_CENTER_all <- semi_join(df_all, df_buffer_CENTER, by="PARCEL_ID")

taxinfo_CENTER.matrix  <- reshape.by.parcelid(df_MKT_TOTAL_VAL_CENTER)

df_MKT_TOTAL_VAL_EDGE <- semi_join(df_MKT_TOTAL_VAL, df_buffer_EDGE, by="PARCEL_ID")
taxinfo_EDGE.matrix  <- reshape.by.parcelid(df_MKT_TOTAL_VAL_EDGE)
