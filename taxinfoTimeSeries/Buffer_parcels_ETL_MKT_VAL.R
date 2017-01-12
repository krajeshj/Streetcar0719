

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

#GRPPCLID ="c" ,MLTOWN ="c" ,PARCELID ="c" ,PNTPCLID ="c" ,TAXDST ="c" ,OWNNM1 ="c" ,OWNNM2 ="c" ,PREVOWN1 ="c" ,NEWFLG ="c" ,MKTLND ="c" ,MKTIMP ="c" ,MKTCAU ="c" ,CLASS ="c" ,NHBDNO ="c" ,ADDRNO ="c" ,ADDRST ="c" ,ADDRSF ="c" ,BANKCD ="c" ,MLNM1 ="c" ,MLNM2 ="c" ,MLADR1 ="c" ,MLADR1A ="c" ,MLADR2 ="c" ,CNTDUE ="c" ,DLNQDT ="c" ,CNTSTG ="c" ,CNTTRM ="c" ,CNTFLG ="c" ,RECST ="c" ,SALDAT ="c" ,NUMPCL ="c" ,SALTYP ="c" ,SALAMT ="c" ,SALSRC ="c" ,VALID ="c" ,SALCNV ="c" ,DEEDNO ="c" ,INSTTY ="c" ,ACREDEED ="c" ,LOC_ST_IND ="c" ,LOC_ST_DIR ="c" ,LOC_SEC_NO ="c" ,SCHOOL_COD ="c" ,BOR_FLAG ="c" ,HMSD_FLAG ="c" ,PARSTAT ="c" ,RED_25_FLA ="c" ,DIV_FLAG ="c" ,MKT_TOTAL_ ="c" ,FORECL_FLA ="c" ,ANNUAL_TAX ="c" ,FRONT_FOOT ="c" ,TAXES_PAID ="c" ,PAR_DELETE ="c" ,DELQ_TAXES ="c" ,LGLDS4 ="c" ,CONVEY_NO ="c" ,OWNER48 ="c" ,EXLUCODE ="c" ,NUM_UNITS ="c" ,TAXDST_DIS ="c" ,DATE_CREAT ="c" ,OWNADCITY ="c" ,OWNADSTATE ="c" ,OWNADZIP ="c" ,APPRAR ="c" ,APPRAR_DIS ="c" ,CONBUILD_F ="c" ,CURYR_FLAG ="c" ,RENT_REG_F ="c" ,SCHOOL_C_1 ="c" ,DELQ_TAX_1 ="c" ,Shape_Leng ="d" ,Shape_Area ="d" ,centroid_x ="d" ,centroid_y ="d" ,cent_long ="d" ,cent_lat="d")

for(zone in c("CORE")) {
  print(paste("Processing the zone :",zone))
  # Form the names of the csv file using year as the iterator
  buffer_zone_file <- paste0("./Data2_090216/parcel_csv/StreetCarParcels_",zone,".csv")
  
  #Form the variable to assign to
  df_buffer_zone <- paste0("df_buffer_",zone)
  print(df_buffer_zone)
  
  # Assign to a data fram
  # assign(df_year, read_csv(year_file))
  
  assign (df_buffer_zone, read_csv(buffer_zone_file, col_types = cols(GRPPCLID ="c" ,MLTOWN ="c" ,PARCELID ="c" ,PNTPCLID ="c" ,TAXDST ="c" ,
                                                                      OWNNM1 ="c" ,OWNNM2 ="c" ,PREVOWN1 ="c" ,NEWFLG ="c" ,MKTLND ="c" ,
                                                                      MKTIMP ="c" ,MKTCAU ="c" ,CLASS ="c" ,NHBDNO ="c" ,ADDRNO ="c" ,ADDRST ="c" ,
                                                                      ADDRSF ="c" ,BANKCD ="c" ,MLNM1 ="c" ,MLNM2 ="c" ,MLADR1 ="c" ,MLADR1A ="c" ,
                                                                      MLADR2 ="c" ,CNTDUE ="c" ,DLNQDT ="c" ,CNTSTG ="c" ,CNTTRM ="c" ,CNTFLG ="c" ,
                                                                      RECST ="c" ,SALDAT ="c" ,NUMPCL ="c" ,SALTYP ="c" ,SALAMT ="c" ,SALSRC ="c" ,
                                                                      VALID ="c" ,SALCNV ="c" ,DEEDNO ="c" ,INSTTY ="c" ,ACREDEED ="c" ,
                                                                      LOC_ST_IND ="c" ,LOC_ST_DIR ="c" ,LOC_SEC_NO ="c" ,SCHOOL_COD ="c" ,
                                                                      BOR_FLAG ="c" ,HMSD_FLAG ="c" ,PARSTAT ="c" ,RED_25_FLA ="c" ,
                                                                      DIV_FLAG ="c" ,MKT_TOTAL_ ="c" ,FORECL_FLA ="c" ,ANNUAL_TAX ="c" ,
                                                                      FRONT_FOOT ="c" ,TAXES_PAID ="c" ,PAR_DELETE ="c" ,DELQ_TAXES ="c" ,
                                                                      LGLDS4 ="c" ,CONVEY_NO ="c" ,OWNER48 ="c" ,EXLUCODE ="c" ,NUM_UNITS ="c" ,
                                                                      TAXDST_DIS ="c" ,DATE_CREAT ="c" ,OWNADCITY ="c" ,OWNADSTATE ="c" ,
                                                                      OWNADZIP ="c" ,APPRAR ="c" ,APPRAR_DIS ="c" ,CONBUILD_F ="c" ,
                                                                      CURYR_FLAG ="c" ,RENT_REG_F ="c" ,SCHOOL_C_1 ="c" ,DELQ_TAX_1 ="c" ,
                                                                      Shape_Leng ="d" ,Shape_Area ="d" ,centroid_x ="d" ,centroid_y ="d" ,
                                                                      cent_long ="d" ,cent_lat="d")))
  
  
  
  problems(df_buffer_zone)
  
  
  
  #assign(df_taxinfo_2007, df_taxinfo_2007 %>% select(one_of(features_selected)))
  dim(df_buffer_zone)
}
# Reading in CSV files upto here 

#create the parcelid from c(BOOK_NUM, PAGE_NUM, PARCEL_NUM, MLT_NUM)
df_buffer_CENTER <- df_buffer_CENTER %>% unite(PARCEL_ID, BOOK, PAGE,PARCEL,MLTOWN, sep="")
df_buffer_EDGE   <- df_buffer_EDGE   %>% unite(PARCEL_ID, BOOK, PAGE,PARCEL,MLTOWN, sep="")
df_buffer_CORE   <- df_buffer_CORE   %>% unite(PARCEL_ID, PARCELID,MLTOWN, sep="")

# Feature selection 
# Now make a selection of the PARCEL_IDs and their coordinates
buff_zone_features <-c("PARCEL_ID",  "MKT_TOTAL_", "centroid_x", "centroid_y", "cent_long", "cent_lat")

df_buffer_CENTER <- select(df_buffer_CENTER, one_of(buff_zone_features))
df_buffer_EDGE   <- select(df_buffer_EDGE,   one_of(buff_zone_features))
df_buffer_CORE   <- select(df_buffer_CORE,   one_of(buff_zone_features))

# Now remove the Parcels with 0 ANNUAL _TAXES

df_buffer_CENTER <- df_buffer_CENTER[c(which(as.numeric(df_buffer_CENTER$MKT_TOTAL_) > 0)),]
df_buffer_EDGE <-   df_buffer_EDGE[c(which(as.numeric(df_buffer_EDGE$MKT_TOTAL_) > 0)),]
df_buffer_CORE <-   df_buffer_CORE[c(which(as.numeric(df_buffer_CORE$MKT_TOTAL_) > 0)),]


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
df_buffer_zone_all <- df_buffer_zone_all[c(which(as.numeric(df_buffer_zone_all$MKT_TOTAL_) > 0)),]

# Remove MKT_TOTAL_VAL field 
df_buffer_zone_all$MKT_TOTAL_  <- NULL


# Transformation ...

# reshape by parcel id
reshape.by.parcelid <- function(df_MKT_TOTAL_VAL){
  #Reshape the train data into a matrix containing the yearly MKT_TOTAL_VAL for each parcel id
  #This is preparation required for time series clustering
  #Input: Train dataset which contain multiple rows x 1 column variables
  #Output: Matrix of 8 YEARLY  TAXES observations x 300,000 PARCEL_IDs
  
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


# joining with ts data 

# Now Filter using semi_join the df_MKT_TOTAL_VAL with the CORE zone
# Select only those in df_MKT_TOTAL_VAL which have PARCEL_IDs in df_buffer_CORE
df_MKT_TOTAL_VAL_CORE <- semi_join(df_MKT_TOTAL_VAL, df_buffer_CORE, by="PARCEL_ID")
taxinfo_CORE.matrix  <- reshape.by.parcelid(df_MKT_TOTAL_VAL_CORE)

df_MKT_TOTAL_VAL_CENTER <- semi_join(df_MKT_TOTAL_VAL, df_buffer_CENTER, by="PARCEL_ID")

taxinfo_CENTER.matrix  <- reshape.by.parcelid(df_MKT_TOTAL_VAL_CENTER)

df_MKT_TOTAL_VAL_EDGE <- semi_join(df_MKT_TOTAL_VAL, df_buffer_EDGE, by="PARCEL_ID")
taxinfo_EDGE.matrix  <- reshape.by.parcelid(df_MKT_TOTAL_VAL_EDGE)

#####
#EDGE
#####

# if there are any columns with na's we remove it
# we had found 1 column
taxinfo_EDGE.matrix_no_na <- taxinfo_EDGE.matrix[, colSums(is.na(taxinfo_EDGE.matrix)) != nrow(taxinfo_EDGE.matrix)]

# Identify which variables are identical 
taxinfo_EDGE.matrix_uniq <- taxinfo_EDGE.matrix_no_na[!duplicated(lapply(taxinfo_EDGE.matrix_no_na, digest))]



duplicates_EDGE <- taxinfo_EDGE.matrix_no_na[duplicated(lapply(taxinfo_EDGE.matrix_no_na, digest))]

#Remove the year ( column 1)
taxinfo_EDGE.matrix_uniq[,1] <- NULL

# Perform Clustering of Variables

taxinfo_EDGE.matrix_scl <-scale(taxinfo_EDGE.matrix_uniq, scale=TRUE, center=TRUE)

# if there are any columns with na's we remove it
# we had found 1 column
taxinfo_EDGE.matrix_no_na <- taxinfo_EDGE.matrix_scl[, colSums(is.na(taxinfo_EDGE.matrix_scl)) != nrow(taxinfo_EDGE.matrix_scl)]


#####
#CENTER
#####

# if there are any columns with na's we remove it
# we had found 1 column
taxinfo_CENTER.matrix_no_na <- taxinfo_CENTER.matrix[, colSums(is.na(taxinfo_CENTER.matrix)) != nrow(taxinfo_CENTER.matrix)]

# Identify which variables are identical 
taxinfo_CENTER.matrix_uniq <- taxinfo_CENTER.matrix_no_na[!duplicated(lapply(taxinfo_CENTER.matrix_no_na, digest))]



duplicates_CENTER <- taxinfo_CENTER.matrix_no_na[duplicated(lapply(taxinfo_CENTER.matrix_no_na, digest))]

#Remove the year ( column 1)
taxinfo_CENTER.matrix_uniq[,1] <- NULL

# Perform Clustering of Variables

taxinfo_CENTER.matrix_scl <-scale(taxinfo_CENTER.matrix_uniq, scale=TRUE, center=TRUE)

# if there are any columns with na's we remove it
# we had found 1 column
taxinfo_CENTER.matrix_no_na <- taxinfo_CENTER.matrix_scl[, colSums(is.na(taxinfo_CENTER.matrix_scl)) != nrow(taxinfo_CENTER.matrix_scl)]

#####
#CORE
#####

# if there are any columns with na's we remove it
# we had found 1 column
taxinfo_CORE.matrix_no_na <- taxinfo_CORE.matrix[, colSums(is.na(taxinfo_CORE.matrix)) != nrow(taxinfo_CORE.matrix)]

# Identify which variables are identical 
taxinfo_CORE.matrix_uniq <- taxinfo_CORE.matrix_no_na[!duplicated(lapply(taxinfo_CORE.matrix_no_na, digest))]



duplicates_CORE <- taxinfo_CORE.matrix_no_na[duplicated(lapply(taxinfo_CORE.matrix_no_na, digest))]

#Remove the year ( column 1)
taxinfo_CORE.matrix_uniq[,1] <- NULL

# Perform Clustering of Variables

taxinfo_CORE.matrix_scl <-scale(taxinfo_CORE.matrix_uniq, scale=TRUE, center=TRUE)

# if there are any columns with na's we remove it
# we had found 1 column
taxinfo_CORE.matrix_no_na <- taxinfo_CORE.matrix_scl[, colSums(is.na(taxinfo_CORE.matrix_scl)) != nrow(taxinfo_CORE.matrix_scl)]


