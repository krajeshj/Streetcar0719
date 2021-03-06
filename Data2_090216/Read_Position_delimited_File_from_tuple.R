
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

# setwd
setwd("/Users/rajesh/Desktop/Coursera/SpringBoardGithub/Streetcar0719")
# examine the files
dir()

# some nummbers in the file have , that seperate 000s positio : 6,088.56
# A function  to co-erce the data to be numeric
# in field_col_classes, the DELQ_TAXES column then will be num.with.commas
setAs("character", "num.with.commas",
      function(from) as.numeric(gsub(",", "", from) ) )
# similar tricks can be done for Y/N values
#setAs("character", "logical.Y.N", function(from) c(Y=TRUE,N=FALSE)[from] )).


# The definitions of the col headers are read into a list from field.txt
# names             <- scan (file= "/Users/rajesh/Desktop/Coursera/SpringBoardGithub/Strcar0719/Data2/taxinfo/2014/field_names.txt", multi.line=TRUE, what = character())
# field_col_classes <- scan (file= "/Users/rajesh/Desktop/Coursera/SpringBoardGithub/Strcar0719/Data2/taxinfo/2014/field_col_classes.txt", multi.line=TRUE, what = character())
# field_width       <- scan (file= "/Users/rajesh/Desktop/Coursera/SpringBoardGithub/Strcar0719/Data2/taxinfo/2014/field_width.txt", multi.line=TRUE, what = character())

# Trying out a new method
# get the  field information in the PDF into a CSV file
# then read in the  fields and provide them to the read.fwf function

# Function converts position delimited files to csv
# takes in year as a character argument
# Reads in the tuple of  field col names, classes, width
# opens the input file to read from taxinfo2014.txt
# writes the input file  and converts into csv file

convert_fwf2csv <- function(year) {
  print (paste("the year being processed is ", year, sep=""))
  field_tuple <- read_csv( file = paste("/Users/rajesh/Desktop/Coursera/SpringBoardGithub/Streetcar0719/Data2_090216/taxinfo/",year,"/field_tuple.csv",sep=""))

  View(field_tuple)
  print ( paste("/Users/rajesh/Desktop/Coursera/SpringBoardGithub/Streetcar0719/Data2_090216/taxinfo/",year,"/taxinfo",year,".txt", sep=""))


   taxinfo.fixed <- read.fwf(
                             file = paste("/Users/rajesh/Desktop/Coursera/SpringBoardGithub/Streetcar0719/Data2_090216/taxinfo/",year,"/taxinfo",year,".txt",sep=""),
                             width = as.numeric(field_tuple$field_width),
                             colClasses = as.character(field_tuple$field_col_class),
                             col.names = field_tuple$names,
                             na.strings= c('NA','NULL'),
                             fill = TRUE)
   
   
  
    
  
  
  


 str(taxinfo.fixed)
 glimpse(taxinfo.fixed)
 print ( paste("/Users/rajesh/Desktop/Coursera/SpringBoardGithub/Streetcar0719/Data2_090216/taxinfo/",year,"/taxinfo",year,".csv", sep=""))
 write_csv(taxinfo.fixed, paste("/Users/rajesh/Desktop/Coursera/SpringBoardGithub/Streetcar0719/Data2_090216/taxinfo/",year,"/taxinfo",year,".csv", sep=""))
 #write_csv(taxinfo.fixed, paste("/Users/rajesh/Desktop/Coursera/SpringBoardGithub/Streetcar0719/Data2_090216/taxinfo/",year,"/taxinfo",year,".csv", sep=""))

 #write_csv(taxinfo.fixed, paste("/Users/rajesh/Dropbox/StreetCar08172016/taxinfo08172016",year,".csv", sep=""))
 summary(taxinfo.fixed)
 print (paste("Done Processing ", year, sep=""))


 }


#convert_fwf2csv("2007")
#convert_fwf2csv("2008")
#convert_fwf2csv("2009")
# convert_fwf2csv("2010")
#  convert_fwf2csv("2011")
#  convert_fwf2csv("2012")
#  convert_fwf2csv("2013")
 convert_fwf2csv("2014")

