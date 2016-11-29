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



# # REMOVE the records for which the MKT_TOTAL_VAL == 0
 df_taxinfo_2007 <- df_taxinfo_2007[c(which(df_taxinfo_2007$MKT_LAND_VAL > 0)),]
 df_taxinfo_2008 <- df_taxinfo_2008[c(which(df_taxinfo_2008$MKT_LAND_VAL > 0)),]
 df_taxinfo_2009 <- df_taxinfo_2009[c(which(df_taxinfo_2009$MKT_LAND_VAL > 0)),]
 df_taxinfo_2010 <- df_taxinfo_2010[c(which(df_taxinfo_2010$MKT_LAND_VAL > 0)),]
 df_taxinfo_2011 <- df_taxinfo_2011[c(which(df_taxinfo_2011$MKT_LAND_VAL > 0)),]
 df_taxinfo_2012 <- df_taxinfo_2012[c(which(df_taxinfo_2012$MKT_LAND_VAL > 0)),]
 df_taxinfo_2013 <- df_taxinfo_2013[c(which(df_taxinfo_2013$MKT_LAND_VAL > 0)),]
 df_taxinfo_2014 <- df_taxinfo_2014[c(which(df_taxinfo_2014$MKT_LAND_VAL > 0)),]
 df_taxinfo_2015 <- df_taxinfo_2015[c(which(df_taxinfo_2015$MKT_LAND_VAL > 0)),]

  # REMOVE the records for which the ANNUAL_TAXES == 0
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
df_all <- bind_rows(df_taxinfo_2007, df_taxinfo_2008, df_taxinfo_2009,df_taxinfo_2010,df_taxinfo_2011,df_taxinfo_2012,df_taxinfo_2013,df_taxinfo_2014,df_taxinfo_2015)

# Get the complete cases 
# Remove all the observations for which we don't have NAs
df_complete_cases <- df_all[complete.cases(df_all),]

#From the df_complete_cases, select only the PARCEL_ID and ANNUAL Taxes
df_annual_taxes <- df_complete_cases %>% select(one_of(c("DF_TAXINFO_YEAR","PARCEL_ID", "ANNUAL_TAXES")))
 
View(df_annual_taxes)
summary(df_annual_taxes)
# reshape by parcel id
reshape.by.parcelid <- function(df_annual_taxes){
  #Reshape the train data into a matrix containing the yearly ANNUAL_TAXES for each parcel id
  #This is preparation required for time series clustering
  #Input: Train dataset which contain multiple rows x 1 column variables
  #Output: Matrix of 9 YEARLY  TAXES observations x 300,000 PARCEL_IDs
  
  # Instead of using reshap, we are using spread.
  #taxinfo_matrix <- reshape(df_annual_taxes, v.names="ANNUAL_TAXES", idvar="DF_TAXINFO_YEAR", timevar="PARCEL_ID", direction="wide")
  
  # 
  taxinfo_matrix <- df_annual_taxes  %>% spread("PARCEL_ID", value="ANNUAL_TAXES", fill=as.numeric(0))
  if (any(is.na(unlist(taxinfo_matrix)))) {
    stop("NA in taxinfo_matrix")
  }
   
  # retain only parcel ids with complete 8 years of data
  # we call this nz_taxinfo_matri - nz_ being non_zero
  nz_taxinfo_matrix <- taxinfo_matrix[,apply(taxinfo_matrix[c(1:ncol(taxinfo_matrix))],2, function(z) !any(z == 0))]
  
  return(nz_taxinfo_matrix)
}

# Call the reshape function 
taxinfo.matrix <- reshape.by.parcelid(df_annual_taxes)


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
plot(Clustvar100$height)
stab100 <- stability(Clustvar100,B = 60, graph = TRUE)


#Now let's get some  random PARCEL_IDs
# About 1500 should do

n <- ncol(taxinfo.matrix_no_na)
taxinfo.matrix_shuffled <- taxinfo.matrix_no_na[,sample(n) ]
train_indices <- 1:round(0.0214 * n)
train <- taxinfo.matrix_shuffled[,train_indices ]

#test_indices <- (round(0.214 * n) + 1):2*(round(0.214 * n))
#test <- taxinfo.matrix_shuffled[,test_indices]

Clustvar1500 <-hclustvar(train)
plot(Clustvar1500)

#####
# B is the Boot strapping sample and we determine the stability
# Evaluates the stability of partitions obtained from a hierarchy of p variables. This hierarchy is performed
# with hclustvar and the stability of the partitions of 2 to p-1 clusters is evaluated with a
# bootstrap approach. The boostrap approch is the following: hclustvar is applied to B boostrap
# samples of the n rows. The partitions of 2 to p-1 clusters obtained from the B bootstrap hierarchies
# are compared with the partitions from the initial hierarchy . The mean of the corrected Rand
# indices is plotted according to the number of clusters. This graphical representation helps in the
# determination of a suitable numbers of clusters.

#stab <- stability(Clustvar1500,B = 10, graph = TRUE)


# Could not get a graph : Make a rough partition of 15 clusters
part <- cutreevar(Clustvar1500,15)

a <- part$var

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
train_cl12 <- as.data.frame(row.names(a$cluster12), stringsAsFactors = FALSE)
train_cl13 <- as.data.frame(row.names(a$cluster13), stringsAsFactors = FALSE)
train_cl14 <- as.data.frame(row.names(a$cluster14), stringsAsFactors = FALSE)
train_cl15 <- as.data.frame(row.names(a$cluster15), stringsAsFactors = FALSE)

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
train_cl12 <- apply(train_cl12,2, function(y) as.character(gsub("X", "", y)))
train_cl13 <- apply(train_cl13,2, function(y) as.character(gsub("X", "", y)))
train_cl14 <- apply(train_cl14,2, function(y) as.character(gsub("X", "", y)))
train_cl15 <- apply(train_cl15,2, function(y) as.character(gsub("X", "", y)))
  


# From each of the clusters get back the time series data

#ts_train_cl1 <-ts(rowMeans(taxinfo.matrix[c(train_cl1)]))
#plot.ts(ts_train_cl1)
# Perform Holts Winters Smoothing and Forecast

#ts_train_cl1_forecast  <- HoltWinters(ts_train_cl1, beta=FALSE, gamma=FALSE)
#ts_train_cl1_forecast2 <- forecast.HoltWinters(ts_train_cl1_forecast, h=10)

#plot.forecast(ts_train_cl1_forecast2)


 
forecast_clusters <-function ( clst_num, partvar, taxinfo.matrix  ) {
   arg2 <- partvar[clst_num]
  train_cl_num  <- as.data.frame(row.names(arg2[[1]]), stringsAsFactors = FALSE)
  train_cl_num  <- apply(train_cl_num,2, function(y) as.character(gsub("X", "", y)))
  ts_train_cl_num <-ts(rowMeans(taxinfo.matrix[c(train_cl_num)]))
  ts_train_cl_num_forecast  <- HoltWinters(ts_train_cl_num, beta=FALSE, gamma=FALSE)
  ts_train_cl_num_forecast2 <- forecast.HoltWinters(ts_train_cl_num_forecast, h=10)
  title <- paste("Mean of ANNUAL TAXES for Cluster ", clst_num)
  plot.forecast(ts_train_cl_num_forecast2,ylab="ANNUAL TAXES - row means", main=title)
 }

for ( clst in c(seq(1:15))) {
 forecast_clusters(clst,a, taxinfo.matrix)
}
 

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
buff_zone_features <-c("PARCEL_ID",  "ANNUAL_TAX", "centroid_x", "centroid_y", "cent_long", "cent_lat")

df_buffer_CENTER <- select(df_buffer_CENTER, one_of(buff_zone_features))
df_buffer_EDGE   <- select(df_buffer_EDGE,   one_of(buff_zone_features))
df_buffer_CORE   <- select(df_buffer_CORE,   one_of(buff_zone_features))

# Now remove the Parcels with 0 ANNUAL _TAXES

df_buffer_CENTER <- df_buffer_CENTER[c(which(as.numeric(df_buffer_CENTER$ANNUAL_TAX) > 0)),]
df_buffer_EDGE <-   df_buffer_EDGE[c(which(as.numeric(df_buffer_EDGE$ANNUAL_TAX) > 0)),]
df_buffer_CORE <-   df_buffer_CORE[c(which(as.numeric(df_buffer_CORE$ANNUAL_TAX) > 0)),]


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
df_buffer_zone_all <- df_buffer_zone_all[c(which(as.numeric(df_buffer_zone_all$ANNUAL_TAX) > 0)),]

# Remove ANNUAL_TAX field 
df_buffer_zone_all$ANNUAL_TAX  <- NULL

# reshape by parcel id
reshape.by.parcelid <- function(df_annual_taxes){
  #Reshape the train data into a matrix containing the yearly ANNUAL_TAXES for each parcel id
  #This is preparation required for time series clustering
  #Input: Train dataset which contain multiple rows x 1 column variables
  #Output: Matrix of 9 YEARLY  TAXES observations x 300,000 PARCEL_IDs
  
  # Instead of using reshap, we are using spread.
  #taxinfo_matrix <- reshape(df_annual_taxes, v.names="ANNUAL_TAXES", idvar="DF_TAXINFO_YEAR", timevar="PARCEL_ID", direction="wide")
  
  # 
  taxinfo_matrix <- df_annual_taxes  %>% spread("PARCEL_ID", value="ANNUAL_TAXES", fill=as.numeric(0))
  if (any(is.na(unlist(taxinfo_matrix)))) {
    stop("NA in taxinfo_matrix")
  }
  
  # retain only parcel ids with complete 8 years of data
  # we call this nz_taxinfo_matri - nz_ being non_zero
 # nz_taxinfo_matrix <- taxinfo_matrix[,apply(taxinfo_matrix[c(1:ncol(taxinfo_matrix))],2, function(z) !any(z == 0))]
  
  return(taxinfo_matrix)
}

# Now Filter using semi_join the df_annual_taxes with the CORE zone
# Select only those in df_annual_taxes which have PARCEL_IDs in df_buffer_CORE
df_annual_taxes_CORE <- semi_join(df_annual_taxes, df_buffer_CORE, by="PARCEL_ID")
taxinfo_CORE.matrix  <- reshape.by.parcelid(df_annual_taxes_CORE)

df_annual_taxes_CENTER <- semi_join(df_annual_taxes, df_buffer_CENTER, by="PARCEL_ID")
df_annual_taxes_CENTER_all <- semi_join(df_all, df_buffer_CENTER, by="PARCEL_ID")

taxinfo_CENTER.matrix  <- reshape.by.parcelid(df_annual_taxes_CENTER)

df_annual_taxes_EDGE <- semi_join(df_annual_taxes, df_buffer_EDGE, by="PARCEL_ID")
taxinfo_EDGE.matrix  <- reshape.by.parcelid(df_annual_taxes_EDGE)
