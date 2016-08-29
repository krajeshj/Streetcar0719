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

# library(RJSONIO)
# library(RCurl)
# 
# getGeoData <- function(location){
#   location <- gsub(' ','+',location)
#   geo_data <- getURL(paste("https://maps.googleapis.com/maps/api/geocode/json?address=",location,"&key=AIzaSyAwsSUG-nFioXysuzun5VLBFyUQE5h2P4Q", sep=""))
#   raw_data_2 <- fromJSON(geo_data)
#   return(raw_data_2)
# }

# examine the files 
dir()
setwd("/Users/rajesh/Desktop/Coursera/SpringBoardGithub/StreetCar0719")

# read in the csv 
#stcar_core<- read_csv("./streetcarbuffer_parcels/parcel_csv_050616/StreetCarParcels_CORE.csv")
stcar_core<- read_csv("./streetcarbuffer_parcels/parcel_csv_082616/StreetCarParcels_CORE.csv")

# Google key
rajesh_key <- "AIzaSyAwsSUG-nFioXysuzun5VLBFyUQE5h2P4Q"

glimpse(stcar_core)
View(stcar_core)

# Function to get data from google servers

#define a function that will process googles server responses for us.
getGeoDetails <- function(address, api_key){   
  #use the gecode function to query google servers
  #geo_reply = geocode(address, output='all', messaging=TRUE, override_limit=TRUE)
   geo_reply = google_geocode(address, key = api_key, simplify= TRUE)
  #now extract the bits that we need from the returned list
  answer <- data.frame(lat=NA, long=NA, accuracy=NA, formatted_address=NA, address_type=NA, status=NA)
  answer$status <- geo_reply$status
  
  #if we are over the query limit - want to pause for an hour
  # while(geo_reply$status == "OVER_QUERY_LIMIT"){
  #   print("OVER QUERY LIMIT - Pausing for 1 hour at:") 
  #   time <- Sys.time()
  #   print(as.character(time))
  #   Sys.sleep(60*60)
  #   geo_reply = geocode(address, output='all', messaging=TRUE, override_limit=TRUE)
  #   answer$status <- geo_reply$status
  # }
  
  #return Na's if we didn't get a match:
  if (geo_reply$status != "OK"){
    print("Status is not OK !!!!")
    return(answer)
  
  }   
  print("Status is  OK !!!!")
  
  #else, extract what we need from the Google server reply into a dataframe:
  # answer$lat <- geo_reply$results[[1]]$geometry$location$lat
  # answer$long <- geo_reply$results[[1]]$geometry$location$lng   
   
  answer$lat <- geo_reply[1]$results$geometry$location$lat[1]
  answer$long <- geo_reply[1]$results$geometry$location$lng[1]
  #answer$lat <- geo_reply$results$lat
  #answer$long <- geo_reply$results$lng 
   
  if (length(geo_reply[1]$results$types) > 0){
    answer$accuracy <- geo_reply[1]$results$types[1]
  }
  answer$address_type <- paste(geo_reply[1]$results$types[1], collapse=',')
  # answer$formatted_address <- geo_reply$results[[1]]$formatted_address
  answer$formatted_address <- geo_reply[1]$results$formatted_address[1]
  
  #print(paste("The lat and long answer is lat ", geo_reply[1]$results$geometry$location$lat))
  #print(paste("The lat and long answer is long", geo_reply[1]$results$geometry$location$lng))
  
  Sys.sleep(.33)
  return(answer)
}

# Remove observations with 0 Annual Taxes
# Thay are Vacant lots or those that don't bring revenue
stcar_core <- stcar_core %>% filter(ANNUAL_TAX !=0)






stcar_core <-mutate(stcar_core, addr_to_geocode = (paste(ADDRNO, ADDRST, ADDRSF, "cincinnati, OH")))

# Some ADDRSF are coded as PW and we need to change this to PKWY so that Google can understand this
#Find the observations iwht "PW" in the ADDRSF field
# Change this to PKWY
stcar_core$ADDRSF[c(which(stcar_core$ADDRSF == "PW"))] <- "PKWY"

# initialized 

#initialise a dataframe to hold the results
geocoded <- data.frame()
# find out where to start in the address list (if the script was interrupted before):
startindex <- 1

# Start the geocoding process - address by address. geocode() function takes care of query speed limit.





for (ii in seq(startindex, nrow(stcar_core))){
#  for (ii in seq(startindex, 3)){
    
  print(paste("Working on index", ii, "of", nrow(stcar_core)))
  #query the google geocoder - this will pause here if we are over the limit.
  result = getGeoDetails(stcar_core$addr_to_geocode[ii], api_key = rajesh_key) 
  print(result$status)   
  str(result)
  result$index <- ii
  #append the answer to the results file.
  geocoded <- rbind(geocoded, result)
  #save temporary results as we are going along
  #saveRDS(geocoded, tempfilename)
}


stcar_core<-bind_cols(stcar_core, geocoded)


myMap <- get_map(location="1208 Sycamore st, Cincinnati,OH", source="google", maptype="roadmap", crop=FALSE, zoom = 15)


# Get a ggplot object
CinciMap        <- ggmap(myMap) 
CinciGoogleDensityMap <- ggmap(myMap)
CinciCAGISDensityMap <- ggmap(myMap)

# provide  data to aestheic mappings
CinciMap <- CinciMap + geom_point(aes( x = as.numeric(long), y = as.numeric(lat), alpha = 0.7, col = EXLUCODE, size= as.numeric(ACREDEED *10)), data= stcar_core)

print(CinciMap)

# Added a layer for density 
CinciGoogleDensityMap <- CinciGoogleDensityMap + stat_density2d(
                          aes(x = as.numeric(long), y = as.numeric(lat), fill = ..level..,
                            alpha = ..level..),
                          bins = 6, geom = "polygon", data = stcar_core)
 
print(CinciGoogleDensityMap)


## Without Geocoding plot the CAGIS provided co-ordinates

 CinciCAGISDensityMap <- ggmap(myMap)
 CinciCAGISDensityMap <- CinciCAGISDensityMap + stat_density2d(aes(x = as.numeric(cent_long), y = as.numeric(cent_lat), fill = ..level.., alpha = ..level..),
                        bins = 6, geom = "polygon", data = stcar_core)
 print(CinciCAGISDensityMap)


 


 


 
# Data Layer
# n <-(ggplot)
# 
# # Data + Aesthetics Mapping 
# n <-ggplot(data,aes(x= data$Department.Title, y = data$Total.Payments, color=data$Job.Class.Title, alpha=0.4, size=data$Overtime.Pay))
# 
# # Data + aes + Geometries 
# n <- n + geom_jitter() 
# 
# # Data + Aesthetic Mapping +  Geom + Facets
# #n <- n + facet_grid(. ~ Department.Title ) 
# 
# #Data + Aesthetics + Geoms + Facets + Statistics
# # ... add a linear regression model here
# 
# #Data + Aesthetics + Geoms + Facets + Statistics + Co-ordinates
# #n <- n + scale_y_discrete(limits=c("00000","120000"), breaks=seq(00000,120000,10000))
# n <- n + xlab("City of Los Angeles Departments")
# n <- n + ylab("Total Pay")
# 
# #Data + Aesthetics + Geoms + Facets + Statistics + Co-ordinates + Theme 
# n <- n + theme(axis.text.x = element_text(angle=305))
# 
# print(n)





