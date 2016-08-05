# This program  reads in the CENTER, EDGE and CORE csv files

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

# examine the files 
dir()
setwd("/Users/rajesh/Desktop/Coursera/SpringBoardGithub/StreetCar0719")

# read in the csv 
stcar_center<- read_csv("./streetcarbuffer_parcels/parcel_csv_050616/StreetCarParcels_CENTER.csv")
stcar_core<- read_csv("./streetcarbuffer_parcels/parcel_csv_050616/StreetCarParcels_CORE.csv")
stcar_edge<- read_csv("./streetcarbuffer_parcels/parcel_csv_050616/StreetCarParcels_EDGE.csv")

# subset some interesting features
selected_var_v <- c("PARCELID", "EXLUCODE", "MKTLND", "MKTIMP", "MKT_TOTAL_", "SALDAT","SALAMT","FORECL_FLA", "AREA","ACRES")

#
parcelid_center<- stcar_center[selected_var_v]
parcelid_edge  <- stcar_core[selected_var_v]
parcelid_core  <- stcar_edge[selected_var_v]





View(parcelid_center)
View(parcelid_edge)
View(parcelid_core)
glimpse(stcar_core)



