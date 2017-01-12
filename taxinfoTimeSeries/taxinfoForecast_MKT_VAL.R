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
library(maptools)
library(rgdal)

set.seed(100)
#
# Analysis is done on non_buffer_zone as well as CORE, CENTER and EDGE buffer zones
# set skip_non_buffer = 1 to skip directly to CORE, CENTER and EDGE analysis
skip_non_buffer = 0

#
# Choose a smaller sample  for non buffer zone : skip_1500 = 1 for dev
# Choose about 1500 samples don't skip : for analysis
skip_1500 = 0

print(" Setting current working directory ")

# set the working dir
setwd("/Users/rajesh/Desktop/Coursera/SpringBoardGithub/Streetcar0719")

print(" sourcing functions ")

source ('taxinfoTimeSeries/functions_MKT_VAL.R')


print( "Reading in  8 years of parcel data 1/4 Million observations X 8 years")
print(" Performing Extraction, Transformation and Loading ... ")
# Here we read in 8 years data for 250,000 - 275,000 parcels for all of Cincinnati
# Extraction Transformation and Cleaning is done here
source('taxinfoTimeSeries/Assessors_yearly_data_ETL_MKT_VAL.R')

print( "Reading Buffer zone Parcel information ")
print(" Performing Extraction, Transformation and Loading ... ")

# here we read in and clean up the Parcels of the Buffer
# extraction , Transormaton and Cleaning is done in this file
source('taxinfoTimeSeries/Buffer_parcels_ETL_MKT_VAL.R')




if(skip_non_buffer == 0) {


print(" NON BUFFER ZONE : Hierarchical Clustering ")
# Begin Hierarchical Clustering of parcel ids

# For illustartive purposes we choose first 10 columns
Clustvar <-hclustvar(taxinfo.matrix_no_na[, 1:10])
plot(Clustvar)

print(" NON BUFFER ZONE : 100 random samples  Hierarchical Clustering ")

#then random 100 columns
n <- ncol(taxinfo.matrix_no_na)
taxinfo.matrix_shuffled <- taxinfo.matrix_no_na[,sample(n) ]
#0.01248  is 2500 values
train_indices <- 1:round(0.00042226 * n)
train <- taxinfo.matrix_shuffled[,train_indices ]


Clustvar100 <-hclustvar(train)
plot(Clustvar100)
rect.hclust(Clustvar100,k=12, border="red")
part100 <- cutreevar(Clustvar100,12)

plot(Clustvar100$height)

print(" NON BUFFER ZONE : 100 random samples  Stability graph ")



#stab100 <- stability(Clustvar100,B = 60, graph = TRUE)

if(skip_1500 == 0) {
#Now let's get some  random PARCEL_IDs
# About 1500 should do

n <- ncol(taxinfo.matrix_no_na)
taxinfo.matrix_shuffled <- taxinfo.matrix_no_na[,sample(n) ]
#0.01248  is 2500 values
train_indices <- 1:round(0.0051699 * n)
train <- taxinfo.matrix_shuffled[,train_indices ]




  
  
  
  
  
Clustvar1500 <-hclustvar(train)
plot(Clustvar1500)
rect.hclust(Clustvar1500,k=12, border="red")


#####
# B is the Boot strapping sample and we determine the stability
# Evaluates the stability of partitions obtained from a hierarchy of p variables. This hierarchy is performed
# with hclustvar and the stability of the partitions of 2 to p-1 clusters is evaluated with a
# bootstrap approach. The boostrap approch is the following: hclustvar is applied to B bootstrap
# samples of the n rows. The partitions of 2 to p-1 clusters obtained from the B bootstrap hierarchies
# are compared with the partitions from the initial hierarchy . The mean of the corrected Rand
# indices is plotted according to the number of clusters. This graphical representation helps in the
# determination of a suitable numbers of clusters.

#stab1500 <- stability(Clustvar1500,B = 5, graph = TRUE)


# Could not get a graph : Make a rough partition of 12 clusters
part1500 <- cutreevar(Clustvar1500,12)
plot(Clustvar1500$height)
 
a <- part1500$var
} else {
 part100 <- cutreevar(Clustvar100,12)
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
train_cl12 <- as.data.frame(row.names(a$cluster12), stringsAsFactors = FALSE)
 

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
 



# Use Holt-Winters  for Simple Exponential Smoothing
for ( clst in c(seq(1:12))) {
 forecast_clusters(clst,a, taxinfo.matrix_uniq)
 
}
 
 


# we create 5 models of regressions
# 1st order - a + T              ( linear)
# 2nd order a + bT + cT^2        ( quadratic)
# 3rd order a = bT + cT^2 + dT^3 ( cubic)
# 4th order and 
# 5th order as well 

print("NON BUFFER ZONE : Plotting Actuals vs. Fitted for models in clusters")
print("NON BUFFER ZONE : Evaluating 12 Clusters with 1st, 2nd, 3rd and 4th and 5th order polynomial regression")
print("NON BUFFER ZONE : Years 2007-2014 serve as training data")
print("NON BUFFER ZONE : Years 2015-2018 serve as test data for validation")


 for( poly_order in c(seq(1:5))){
  
  for ( clst in c(seq(1:12))) {
   
  #df_mape_clusters <- plot_act_pred(clst,a, taxinfo.matrix, poly_order)
   df_mape_train_clusters <- plot_act_pred_trg(clst,a, taxinfo.matrix[c(1:6),], poly_order)
   df_mape_test_clusters  <- plot_act_pred_test(clst,a, taxinfo.matrix[c(1:6),], taxinfo.matrix[c(7:8),], poly_order)
  
  if (clst == 1) {
    df_mape_train_clst_poly <- df_mape_train_clusters["mape"]
    df_actpred_train_clst_poly <- df_mape_train_clusters["act_pred"]
    
    
    df_mape_test_clst_poly <- df_mape_test_clusters["mape"]
     
     
    }
  else {
    
     
    df_mape_train_clst_poly <- bind_rows(df_mape_train_clst_poly, df_mape_train_clusters["mape"])
    df_actpred_train_clst_poly <- bind_rows(df_actpred_train_clst_poly, df_mape_train_clusters["act_pred"])
    
    
    df_mape_test_clst_poly  <- bind_rows(df_mape_test_clst_poly,  df_mape_test_clusters["mape"])
     }
  }
  
  if (poly_order == 1) {
     df_mape_train_all <- df_mape_train_clst_poly
     df_actpred_train_all <- df_actpred_train_clst_poly
     
     
     df_mape_test_all  <- df_mape_test_clst_poly
     
    } 
  else 
     {
      df_mape_train_all <- bind_rows(df_mape_train_all, df_mape_train_clst_poly) 
      df_actpred_train_all <- bind_rows(df_actpred_train_all, df_actpred_train_clst_poly) 
      
      df_mape_test_all <- bind_rows(df_mape_test_all, df_mape_test_clst_poly) 
      
      
  }
   
 
  
  
 }

print("NON BUFFER ZONE : Computing MAPE - Mean Absolute Percentage error")

# Chart the actuals and predicted for the different clusters

print("BUFFER ZONE: Plotting the Actual vs. Fitted for Training set ")


for( poly_order in c(seq(1:5))){
  
  plot_actpred_chart(df_actpred_train_all, " Non BUFFER ZONE training set ", poly_order)
   
  
} # poly_order


# Evaluate the Mean Absolute Percentage error
# Training data
# Years 2007 - 2012
plot_mape_chart(df_mape_train_all, "non Buffer zone : training data")

#Evaluate the MAPE for 
# Testing data 
# years 2013-2014
plot_mape_chart(df_mape_test_all, "non Buffer zone : test data")

print("NON BUFFER ZONE :  Plotting MKT_TOT_VAL source and predicted data")
print("NON BUFFER ZONE :  Creating df_final_mkt_val data frame for later Visualization")


for( poly_order in c(seq(1:3))){
  
  # facet the clusters on a single plot 
  # visualize  fitted and predicted
  
  df_final_mkt_val_non_bfr_zone <- non_linear_regresion_model(a, taxinfo.matrix, poly_order, 12, "non-Buffer", df_mape_test_all[(df_mape_test_all$poly_order < 4),])
  if ( poly_order == 1) {
    df_final_mkt_val <- df_final_mkt_val_non_bfr_zone 
  } 
  else{ df_final_mkt_val <- bind_rows(df_final_mkt_val, df_final_mkt_val_non_bfr_zone )}
  
  
}

} # skip_non_buffer_zone

print("BUFFER ZONE: Training and test data set ")

######
# EDGE
######
 
print("EDGE BUFFER ZONE :  Training Data - Dendogram")
#then random 100 columns
n <- ncol(taxinfo_EDGE.matrix_no_na)
taxinfo_EDGE.matrix_shuffled <- taxinfo_EDGE.matrix_no_na[,sample(n) ]
#0.7   is 561 values
train_indices <- 1:round(0.7 * n)
train <- taxinfo_EDGE.matrix_shuffled[,train_indices ]


ClustvarEDGE100 <-hclustvar(train)
plot(ClustvarEDGE100)
rect.hclust(ClustvarEDGE100,k=12, border="red")

partEDGE100 <- cutreevar(ClustvarEDGE100,12)


a_EDGE <- partEDGE100$var

plot(ClustvarEDGE100$height)

 
######
# CENTER
######
print("CENTER BUFFER ZONE :  Training Data - Dendogram")


#then random 100 columns
n <- ncol(taxinfo_CENTER.matrix_no_na)
taxinfo_CENTER.matrix_shuffled <- taxinfo_CENTER.matrix_no_na[,sample(n) ]
#0.7   is 561 values
train_indices <- 1:round(0.7 * n)
train <- taxinfo_CENTER.matrix_shuffled[,train_indices ]


ClustvarCENTER100 <-hclustvar(train)
plot(ClustvarCENTER100)
rect.hclust(ClustvarCENTER100,k=12, border="red")
partCENTER100 <- cutreevar(ClustvarCENTER100,12)
a_CENTER <- partCENTER100$var
plot(ClustvarCENTER100$height)

#stab100 <- stability(Clustvar100,B = 60, graph = TRUE)

######
# CORE
######

print("CORE BUFFER ZONE :  Training Data - Dendogram")

#then random 100 columns
n <- ncol(taxinfo_CORE.matrix_no_na)
taxinfo_CORE.matrix_shuffled <- taxinfo_CORE.matrix_no_na[,sample(n) ]
#0.7   is 561 values
train_indices <- 1:round(0.7 * n)
train <- taxinfo_CORE.matrix_shuffled[,train_indices ]


ClustvarCORE100 <-hclustvar(train)
plot(ClustvarCORE100)
rect.hclust(ClustvarCORE100,k=12, border="red")

partCORE100 <- cutreevar(ClustvarCORE100,12)

a_CORE <-partCORE100$var

plot(ClustvarCORE100$height)

#stab100 <- stability(Clustvar100,B = 60, graph = TRUE)

print("BUFFER_ZONE: About to plot actuals and fitted")


for( poly_order in c(seq(1:5))){
  
  
  for ( clst in c(seq(1:12))) {
    
    
     
     df_mape_train_CORE_parcels   <- plot_act_pred_trg(clst,a_CORE,  taxinfo_CORE.matrix[c(1:6),], poly_order)
     df_mape_train_CENTER_parcels <- plot_act_pred_trg(clst,a_CENTER,  taxinfo_CENTER.matrix[c(1:6),], poly_order)
     df_mape_train_EDGE_parcels   <- plot_act_pred_trg(clst,a_EDGE,  taxinfo_EDGE.matrix[c(1:6),], poly_order)
     
     
     
     
     df_mape_test_CORE_parcels   <- plot_act_pred_test(clst,a_CORE,  taxinfo_CORE.matrix[c(1:6),], taxinfo_CORE.matrix[c(7:8),],    poly_order)
     df_mape_test_CENTER_parcels <- plot_act_pred_test(clst,a_CENTER,  taxinfo_CENTER.matrix[c(1:6),],taxinfo_CENTER.matrix[c(7:8),], poly_order)
     df_mape_test_EDGE_parcels   <- plot_act_pred_test(clst,a_EDGE,  taxinfo_EDGE.matrix[c(1:6),],taxinfo_EDGE.matrix[c(7:8),], poly_order)
     
     
     
     
    if (clst == 1) {
      
       df_mape_train_CORE_clst_poly <- df_mape_train_CORE_parcels["mape"]
       df_mape_train_CENTER_clst_poly <- df_mape_train_CENTER_parcels["mape"]
       df_mape_train_EDGE_clst_poly <- df_mape_train_EDGE_parcels["mape"]
       
       df_actpred_train_CORE_clst_poly <- df_mape_train_CORE_parcels["act_pred"]
       df_actpred_train_CENTER_clst_poly <- df_mape_train_CENTER_parcels["act_pred"]
       df_actpred_train_EDGE_clst_poly <- df_mape_train_EDGE_parcels["act_pred"]      
       
       
       
       df_mape_test_CORE_clst_poly <- df_mape_test_CORE_parcels["mape"]
       df_mape_test_CENTER_clst_poly <- df_mape_test_CENTER_parcels["mape"]
       df_mape_test_EDGE_clst_poly <- df_mape_test_EDGE_parcels["mape"]
       
       
       
       
       
       
    }
    else {
       
       df_mape_train_CORE_clst_poly <- bind_rows(df_mape_train_CORE_clst_poly,     df_mape_train_CORE_parcels["mape"])
       df_mape_train_CENTER_clst_poly <- bind_rows(df_mape_train_CENTER_clst_poly,     df_mape_train_CENTER_parcels["mape"])
       df_mape_train_EDGE_clst_poly <- bind_rows(df_mape_train_EDGE_clst_poly,     df_mape_train_EDGE_parcels["mape"])
      
       
        
       df_actpred_train_CORE_clst_poly <- bind_rows(df_actpred_train_CORE_clst_poly,     df_mape_train_CORE_parcels["act_pred"])
       df_actpred_train_CENTER_clst_poly <- bind_rows(df_actpred_train_CENTER_clst_poly, df_mape_train_CENTER_parcels["act_pred"])
       df_actpred_train_EDGE_clst_poly <- bind_rows(df_actpred_train_EDGE_clst_poly,     df_mape_train_EDGE_parcels["act_pred"])
       
       
       
       df_mape_test_CORE_clst_poly <- bind_rows(df_mape_test_CORE_clst_poly,     df_mape_test_CORE_parcels["mape"])
       df_mape_test_CENTER_clst_poly <- bind_rows(df_mape_test_CENTER_clst_poly,     df_mape_test_CENTER_parcels["mape"])
       df_mape_test_EDGE_clst_poly <- bind_rows(df_mape_test_EDGE_clst_poly,     df_mape_test_EDGE_parcels["mape"])
       
       
       
    }
  }
  
  
  if (poly_order == 1) {
    
    
    df_mape_train_CORE_all   <- df_mape_train_CORE_clst_poly
    df_mape_train_CENTER_all <- df_mape_train_CENTER_clst_poly
    df_mape_train_EDGE_all   <- df_mape_train_EDGE_clst_poly 
    
    df_actpred_train_CORE_all   <- df_actpred_train_CORE_clst_poly
    df_actpred_train_CENTER_all <- df_actpred_train_CENTER_clst_poly
    df_actpred_train_EDGE_all   <- df_actpred_train_EDGE_clst_poly 
    
    
    
    
    
    
    df_mape_test_CORE_all   <- df_mape_test_CORE_clst_poly
    df_mape_test_CENTER_all <- df_mape_test_CENTER_clst_poly
    df_mape_test_EDGE_all   <- df_mape_test_EDGE_clst_poly 
    
    
    
  } 
  else 
  {
   
    df_mape_train_CORE_all <- bind_rows(df_mape_train_CORE_all, df_mape_train_CORE_clst_poly) 
    df_mape_train_CENTER_all <- bind_rows(df_mape_train_CENTER_all, df_mape_train_CENTER_clst_poly) 
    df_mape_train_EDGE_all <- bind_rows(df_mape_train_EDGE_all, df_mape_train_EDGE_clst_poly)  
    
    df_actpred_train_CORE_all <- bind_rows(df_actpred_train_CORE_all, df_actpred_train_CORE_clst_poly) 
    df_actpred_train_CENTER_all <- bind_rows(df_actpred_train_CENTER_all, df_actpred_train_CENTER_clst_poly) 
    df_actpred_train_EDGE_all <- bind_rows(df_actpred_train_EDGE_all, df_actpred_train_EDGE_clst_poly)  
    
    
    
    
    df_mape_test_CORE_all <- bind_rows(df_mape_test_CORE_all, df_mape_test_CORE_clst_poly) 
    df_mape_test_CENTER_all <- bind_rows(df_mape_test_CENTER_all, df_mape_test_CENTER_clst_poly) 
    df_mape_test_EDGE_all <- bind_rows(df_mape_test_EDGE_all, df_mape_test_EDGE_clst_poly)   
    
    
    
    
  }
   
 
    
}


print("BUFFER ZONE: Plotting the Actual vs. Fitted for Training set ")


for( poly_order in c(seq(1:5))){
  
  plot_actpred_chart(df_actpred_train_CORE_all, " CORE BUFFER ZONE training set ",poly_order)
  plot_actpred_chart(df_actpred_train_CENTER_all, " CENTER BUFFER ZONE training set", poly_order)
  plot_actpred_chart(df_actpred_train_EDGE_all, " EDGE BUFFER ZONE training set ", poly_order)
  
} # poly_order
  
print("BUFFER ZONE: Plotting the mape charts ")

# Plot the mape chart for the buffer zones
 

plot_mape_chart(df_mape_train_CORE_all, " CORE BUFFER ZONE training set data")
plot_mape_chart(df_mape_train_CENTER_all, " CENTER BUFFER ZONE training set  data")
plot_mape_chart(df_mape_train_EDGE_all, " EDGE BUFFER ZONE training set data")




plot_mape_chart(df_mape_test_CORE_all, " CORE BUFFER ZONE test set data")
plot_mape_chart(df_mape_test_CENTER_all, " CENTER BUFFER ZONE test set  data")
plot_mape_chart(df_mape_test_EDGE_all, " EDGE BUFFER ZONE test set data")


print( "BUFFER_ZONE : Faceting over  clusters for each zone")
# facet the clusters on a single plot 
# visualize  fitted and predicted


######
# EDGE
######


#then random 100 columns
n <- ncol(taxinfo_EDGE.matrix_no_na)
taxinfo_EDGE.matrix_shuffled <- taxinfo_EDGE.matrix_no_na[,sample(n) ]
#0.7   is 561 values
train_indices <- 1:round(1.0 * n)
train <- taxinfo_EDGE.matrix_shuffled[,train_indices ]


ClustvarEDGE100 <-hclustvar(train)
plot(ClustvarEDGE100)
rect.hclust(ClustvarEDGE100,k=12, border="red")

partEDGE100 <- cutreevar(ClustvarEDGE100,12)


a_EDGE <- partEDGE100$var

plot(ClustvarEDGE100$height)
#stabEDGE100 <- stability(ClustvarEDGE100,B = 60, graph = TRUE)

######
# CENTER
######


#then random 100 columns
n <- ncol(taxinfo_CENTER.matrix_no_na)
taxinfo_CENTER.matrix_shuffled <- taxinfo_CENTER.matrix_no_na[,sample(n) ]
#0.7   is 561 values
train_indices <- 1:round(1.0 * n)
train <- taxinfo_CENTER.matrix_shuffled[,train_indices ]


ClustvarCENTER100 <-hclustvar(train)
plot(ClustvarCENTER100)
rect.hclust(ClustvarCENTER100,k=12, border="red")

partCENTER100 <- cutreevar(ClustvarCENTER100,12)

a_CENTER <- partCENTER100$var
plot(ClustvarCENTER100$height)
#stab100 <- stability(Clustvar100,B = 60, graph = TRUE)

######
# CORE
######


#then random 100 columns
n <- ncol(taxinfo_CORE.matrix_no_na)
taxinfo_CORE.matrix_shuffled <- taxinfo_CORE.matrix_no_na[,sample(n) ]
#0.7   is 561 values
train_indices <- 1:round(1.0 * n)
train <- taxinfo_CORE.matrix_shuffled[,train_indices ]


ClustvarCORE100 <-hclustvar(train)
plot(ClustvarCORE100)
partCORE100 <- cutreevar(ClustvarCORE100,12)
rect.hclust(ClustvarCORE100,k=12, border="red")

a_CORE <-partCORE100$var

plot(ClustvarCORE100$height)
#stab100 <- stability(Clustvar100,B = 60, graph = TRUE)
print("BUFFER_ZONE Completed dendograms for all the parcels")


print("BUFFER_ZONE Visualize Source Data and Predicted in the same plot")


for( poly_order in c(seq(1:3))){

  # facet the clusters on a single plot 
  # visualize  source and predicted
  
  df_final_mkt_val_core <- non_linear_regresion_model(a_CORE, taxinfo_CORE.matrix, poly_order,12, "CORE", df_mape_test_CORE_all[(df_mape_test_CORE_all$poly_order <4),])
  if (( poly_order == 1) && (skip_non_buffer == 1)) {
    df_final_mkt_val <- df_final_mkt_val_core 
  } else
  { df_final_mkt_val <- bind_rows(df_final_mkt_val, df_final_mkt_val_core )}
}

for( poly_order in c(seq(1:3))){
  
  # facet the clusters on a single plot 
  # visualize  source and predicted
  
  df_final_mkt_val_center <- non_linear_regresion_model(a_CENTER, taxinfo_CENTER.matrix, poly_order,12, "CENTER",df_mape_test_CENTER_all[(df_mape_test_CENTER_all$poly_order <4),])
  df_final_mkt_val <- bind_rows(df_final_mkt_val, df_final_mkt_val_center )
}

for( poly_order in c(seq(1:3))){
  
  # facet the clusters on a single plot 
  # visualize  source and predicted
   df_final_mkt_val_edge <- non_linear_regresion_model(a_EDGE, taxinfo_EDGE.matrix, poly_order,12, "EDGE", df_mape_test_EDGE_all[(df_mape_test_EDGE_all$poly_order <4),])
   df_final_mkt_val <- bind_rows(df_final_mkt_val, df_final_mkt_val_edge )
   
}

# For the plots below we need to make the zone a factor
df_final_mkt_val$zone <- as.factor(df_final_mkt_val$zone)
df_final_mkt_val$data_type <- as.factor(df_final_mkt_val$data_type)
df_final_mkt_val$date <- as.factor(df_final_mkt_val$date)


# Also find the mkt_total/ cluster = ( mkt_val_mean/cluster  * num_parcel_ids/cluster)
df_final_mkt_val <- df_final_mkt_val %>% mutate(mkt_total = mkt_val * num_parcel_ids)
print(" ZONE UNDER STUDY : Final plot ")



n3 <- NULL
# Data Layer
#title <- paste0("MKT TOTAL VALUE  in different ZONEs ")

title <- paste0("MKT TOTAL VALUE in different ZONEs ")


n3 <-(ggplot)
# 
# # Data + Aesthetics Mapping 
#n3 <- ggplot(df_final_mkt_val,aes(y = mkt_total, x = factor(date), fill = factor(clst_num), color=factor(data_type)))
n3 <- ggplot(df_final_mkt_val,aes(y = mkt_val, x = factor(date), fill = factor(clst_num), color=factor(data_type)))

#n3 <-   ggplot(df_final_mkt_val,aes(y = mkt_val, x = date ))
# 
# # Data + aes + Geometries
n3 <- n3 + geom_bar(stat="identity", width = 0.6) 
#n3 <- n3 + geom_line()
# 
# # Data + Aesthetic Mapping +  Geom + Facets
# #n <- n + facet_grid(. ~ Department.Title ) 
# 
# #Data + Aesthetics + Geoms + Facets + Statistics
# # ... add a linear regression model here
#n3 <- n3 + geom_smooth(method="gam" ) 
# #Data + Aesthetics + Geoms + Facets + Statistics + Co-ordinates
# #n <- n + scale_y_discrete(limits=c("00000","120000"), breaks=seq(00000,120000,10000))
n3 <- n3 + scale_x_discrete()
n3 <- n3 + xlab("Years")
n3 <- n3 + ylab("MKT_TOTAL_VAL  ")
# 
# #Data + Aesthetics + Geoms + Facets + Statistics + Co-ordinates + Theme 
 n3 <- n3 + theme(axis.text.x = element_text(angle=305))
# 
n3 <- n3 + ggtitle(title)
n3 <- n3 +facet_wrap( ~ zone)
print(n3)


## Split it
df_fin_1 <- df_final_mkt_val %>% filter((zone %in% c("CORE","non-Buffer")))

df_fin_2 <- df_final_mkt_val %>% filter((zone %in% c("CENTER","EDGE")))


n3 <- NULL
# Data Layer
#title <- paste0("MKT TOTAL VALUE  in different ZONEs ")

title <- paste0("MKT TOTAL VALUE in different ZONEs CENTER and EDGE ")


n3 <-(ggplot)
# 
# # Data + Aesthetics Mapping 
#n3 <- ggplot(df_final_mkt_val,aes(y = mkt_total, x = factor(date), fill = factor(clst_num), color=factor(data_type)))
n3 <- ggplot(df_fin_2,aes(y = mkt_val, x = factor(date), fill = factor(clst_num), color=factor(data_type)))

#n3 <-   ggplot(df_final_mkt_val,aes(y = mkt_val, x = date ))
# 
# # Data + aes + Geometries
n3 <- n3 + geom_bar(stat="identity", width = 0.6) 
#n3 <- n3 + geom_line()
# 
# # Data + Aesthetic Mapping +  Geom + Facets
# #n <- n + facet_grid(. ~ Department.Title ) 
# 
# #Data + Aesthetics + Geoms + Facets + Statistics
# # ... add a linear regression model here
#n3 <- n3 + geom_smooth(method="gam" ) 
# #Data + Aesthetics + Geoms + Facets + Statistics + Co-ordinates
# #n <- n + scale_y_discrete(limits=c("00000","120000"), breaks=seq(00000,120000,10000))
n3 <- n3 + scale_x_discrete()
n3 <- n3 + xlab("Years")
n3 <- n3 + ylab("MKT_TOTAL_VAL  ")
# 
# #Data + Aesthetics + Geoms + Facets + Statistics + Co-ordinates + Theme 
n3 <- n3 + theme(axis.text.x = element_text(angle=305))
# 
n3 <- n3 + ggtitle(title)
n3 <- n3 +facet_wrap( ~ zone)
print(n3)



n3 <- NULL
# Data Layer
#title <- paste0("MKT TOTAL VALUE  in different ZONEs ")

title <- paste0("MKT TOTAL VALUE in different ZONEs CORE and non-Buffer ")


n3 <-(ggplot)
# 
# # Data + Aesthetics Mapping 
#n3 <- ggplot(df_final_mkt_val,aes(y = mkt_total, x = factor(date), fill = factor(clst_num), color=factor(data_type)))
n3 <- ggplot(df_fin_1,aes(y = mkt_val, x = factor(date), fill = factor(clst_num), color=factor(data_type)))

#n3 <-   ggplot(df_final_mkt_val,aes(y = mkt_val, x = date ))
# 
# # Data + aes + Geometries
n3 <- n3 + geom_bar(stat="identity", width = 0.6) 
#n3 <- n3 + geom_line()
# 
# # Data + Aesthetic Mapping +  Geom + Facets
# #n <- n + facet_grid(. ~ Department.Title ) 
# 
# #Data + Aesthetics + Geoms + Facets + Statistics
# # ... add a linear regression model here
#n3 <- n3 + geom_smooth(method="gam" ) 
# #Data + Aesthetics + Geoms + Facets + Statistics + Co-ordinates
# #n <- n + scale_y_discrete(limits=c("00000","120000"), breaks=seq(00000,120000,10000))
n3 <- n3 + scale_x_discrete()
n3 <- n3 + xlab("Years")
n3 <- n3 + ylab("MKT_TOTAL_VAL  ")
# 
# #Data + Aesthetics + Geoms + Facets + Statistics + Co-ordinates + Theme 
n3 <- n3 + theme(axis.text.x = element_text(angle=305))
# 
n3 <- n3 + ggtitle(title)
n3 <- n3 +facet_wrap( ~ zone)
print(n3)


# Identify clusters with growth

cluster_max_val_parcels_CENTER <- remove_char_X(rownames(partCENTER100$var[[2]]))

cluster_max_val_parcels_EDGE <- remove_char_X(rownames(partEDGE100$var[[8]]))



cluster_max_val_parcels_CORE <- remove_char_X(rownames(partCORE100$var[[11]]))

cluster_max_val_parcels_NON_BFR <- remove_char_X(rownames(part1500$var[[5]]))

   
##############

# PLOTS on the MAP for EDGE

##############
library(ggmap)


###############
#Street Car Line : Convert shape files to data
###############
shp_file_streetcar <- readOGR('/Users/rajesh/Desktop/Coursera/SpringBoardGithub/StreetCar0719/streetcarbuffer_parcels/gis_shape_files/StreetCar/StreetCar.shp',
                              layer="StreetCar"     )
proj4string(shp_file_streetcar)
shp_file_streetcar <- spTransform(shp_file_streetcar, CRS("+proj=longlat +datum=WGS84"))

# convert to a data.frame for use with ggplot2/ggmap and plot
data <- fortify(shp_file_streetcar)

##############

# PLOTS on the MAP for EDGE

##############

myMap <- get_map(location="1208 Sycamore st, Cincinnati,OH", source="google", maptype="roadmap", crop=FALSE, zoom = 15)
title <- paste0("Density of Clusters of parcels with growing MKT_VAL in EDGE ")


df_cluster_max_val_EDGE <- as.data.frame(cluster_max_val_parcels_EDGE)
colnames(df_cluster_max_val_EDGE)<- c("PARCEL_ID")
df_cluster_max_val_EDGE <- semi_join(df_buffer_EDGE,df_cluster_max_val_EDGE, by="PARCEL_ID")

CinciCAGISDensityMap <- ggmap(myMap)
CinciCAGISDensityMap <- CinciCAGISDensityMap + stat_density2d(aes(x = as.numeric(cent_long), y = as.numeric(cent_lat), fill = ..level.., alpha = ..level..),  bins = 6, geom = "polygon", data = df_cluster_max_val_EDGE)
CinciCAGISDensityMap <- CinciCAGISDensityMap  + geom_point(data = df_cluster_max_val_EDGE, aes(x = as.numeric(cent_long), y = as.numeric(cent_lat)), alpha = 1)
CinciCAGISDensityMap <- CinciCAGISDensityMap + geom_polygon(aes(x = long, y = lat, group = group ), data = shp_file_streetcar,
                                                            alpha = 1.0, size = 1.0, fill = 'red', color = 'blue')                                           

CinciCAGISDensityMap <- CinciCAGISDensityMap + ggtitle(title)
print(CinciCAGISDensityMap)

# plot on MAPS for CENTER

df_cluster_max_val_CENTER <- as.data.frame(cluster_max_val_parcels_CENTER)
colnames(df_cluster_max_val_CENTER)<- c("PARCEL_ID")
df_cluster_max_val_CENTER <- semi_join(df_buffer_CENTER,df_cluster_max_val_CENTER, by="PARCEL_ID")

myMap <- get_map(location="1208 Sycamore st, Cincinnati,OH", source="google", maptype="roadmap", crop=FALSE, zoom = 15)
title <- paste0("Density of Clusters of parcels with growing MKT_VAL in CENTER ")

CinciCAGISDensityMap <- ggmap(myMap)
CinciCAGISDensityMap <- CinciCAGISDensityMap + stat_density2d(aes(x = as.numeric(cent_long), y = as.numeric(cent_lat), fill = ..level.., alpha = ..level..), bins = 6, geom = "polygon", data = df_cluster_max_val_CENTER)
CinciCAGISDensityMap <- CinciCAGISDensityMap  + geom_point(data = df_cluster_max_val_CENTER, aes(x = as.numeric(cent_long), y = as.numeric(cent_lat)), alpha = 1)

CinciCAGISDensityMap <- CinciCAGISDensityMap + ggtitle(title)
CinciCAGISDensityMap <- CinciCAGISDensityMap + geom_polygon(aes(x = long, y = lat, group = group ), data = shp_file_streetcar,
                                                            alpha = 1.0, size = 1.0, fill = 'red', color = 'blue')
print(CinciCAGISDensityMap)

 
# plot on MAPS for CORE

df_cluster_max_val_CORE <- as.data.frame(cluster_max_val_parcels_CORE)
colnames(df_cluster_max_val_CORE)<- c("PARCEL_ID")
df_cluster_max_val_CORE <- semi_join(df_buffer_CORE,df_cluster_max_val_CORE, by="PARCEL_ID")
myMap <- get_map(location="1208 Sycamore st, Cincinnati,OH", source="google", maptype="roadmap", crop=FALSE, zoom = 15)
title <- paste0("Density of Clusters of parcels with growing MKT_VAL in CORE ")

CinciCAGISDensityMap <- ggmap(myMap)
CinciCAGISDensityMap <- CinciCAGISDensityMap + stat_density2d(aes(x = as.numeric(cent_long), y = as.numeric(cent_lat), fill = ..level.., alpha = ..level..),    bins = 6, geom = "polygon", data = df_cluster_max_val_CORE)
CinciCAGISDensityMap <- CinciCAGISDensityMap  + geom_point(data = df_cluster_max_val_CORE, aes(x = as.numeric(cent_long), y = as.numeric(cent_lat)), alpha = 1)
CinciCAGISDensityMap <- CinciCAGISDensityMap + ggtitle(title)
CinciCAGISDensityMap <- CinciCAGISDensityMap + geom_polygon(aes(x = long, y = lat, group = group ), data = shp_file_streetcar,
                                                            alpha = 1.0, size = 0.3, fill = 'red', color = 'blue')
print(CinciCAGISDensityMap)


 
