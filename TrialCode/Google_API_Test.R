library(RJSONIO)
library(RCurl)
library("googleway")
 getGeoData <- function(location){
   location <- gsub(' ','+',location)
   geo_data <- getURL(paste("https://maps.googleapis.com/maps/api/geocode/json?address=",location,"&key=AIzaSyAwsSUG-nFioXysuzun5VLBFyUQE5h2P4Q", sep=""))
   raw_data_2 <- fromJSON(geo_data)
   return(raw_data_2)
 }

getGeoData("San Francisco")

google_geocode("San Francisco", key="AIzaSyAwsSUG-nFioXysuzun5VLBFyUQE5h2P4Q")
