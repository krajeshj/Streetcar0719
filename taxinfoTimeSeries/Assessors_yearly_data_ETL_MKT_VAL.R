
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

# Perform Scaling

taxinfo.matrix_scl <-scale(taxinfo.matrix_uniq, scale=TRUE, center=TRUE)

# if there are any columns with na's we remove it
# we had found 1 column
taxinfo.matrix_no_na <- taxinfo.matrix_scl[, colSums(is.na(taxinfo.matrix_scl)) != nrow(taxinfo.matrix_scl)]

