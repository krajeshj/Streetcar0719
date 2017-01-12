
#
remove_char_X <- function(y) {
  as.character(gsub("X", "", y))
}



#Mean absolute Percentage error
mape <- function(y, yhat) {
  
  mean(abs((y - yhat)/y)) 
}

 
plotForecastErrors <- function(forecasterrors) {
  # make a histogram of the forecast errors:
  mybinsize <- IQR(forecasterrors, na.rm = TRUE)/4
  mysd <- sd(forecasterrors, na.rm = TRUE)
  mymin <- min(forecasterrors, na.rm= TRUE) - mysd*5
  mymax <- max(forecasterrorsna.rm = TRUE) + mysd*3
  # generate normally distributed data with mean 0 and standard deviation mysd 
  mynorm <- rnorm(10000, mean=0, sd=mysd)
  mymin2 <- min(mynorm)
  mymax2 <- max(mynorm)
  if (mymin2 < mymin) { mymin <- mymin2 }
  if (mymax2 > mymax) { mymax <- mymax2 }
  # make a red histogram of the forecast errors, with the normally distributed data overlaid: 
  mybins <- seq(mymin - mybinsize, (mymax + mybinsize), mybinsize)
  hist(forecasterrors, col="red", freq=FALSE, breaks=mybins)
  range(mynorm)
  range(mybins) 
  myhist <- hist(mynorm, plot=FALSE, breaks=mybins, include.lowest= TRUE)

  # plot the normal curve as a blue line on top of the histogram of forecast errors: 
  points(myhist$mids, myhist$density, type="l", col="blue", lwd=2)
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
  
   acf(ts_train_cl_num_forecast2$residuals, lag.max=8, na.action=na.pass)
  #plot.ts(ts_train_cl_num_forecast2$residuals)
  plotForecastErrors(ts_train_cl_num_forecast2$residuals)
}





# Function to estimate MAPE
# Mean absolute Percentage error

mape <- function(y, yhat)
  mean(abs((y - yhat)/y))


### plot the actual and fitted curves of the time-series

plot_act_pred <- function (clst_num, partvar, taxinfo.matrix, poly_order) {
  arg2 <- partvar[clst_num]
  train_cl_num  <- as.data.frame(row.names(arg2[[1]]), stringsAsFactors = FALSE)
  train_cl_num  <- apply(train_cl_num,2, function(y) as.character(gsub("X", "", y)))
  ts_train_cl_num <-ts((rowMeans(taxinfo.matrix[c(train_cl_num)])),start = c(2007))
  
  Time <- c(seq(2007,2012))
  
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
  
  if ( poly_order > 3 ){
    title <- paste("Mean of MKT_TOTAL_VAL for  ", poly_order,"th order  & Cluster ", clst_num, "MAPE - ", mape_val)
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
   n2 <- n2 + theme(axis.text.x = element_text(angle=305))
  # 
  n2 <- n2 + ggtitle(title)
  print(n2)
  
  return(df_mape)
}



non_linear_regresion_model_saved <- function (partvar, taxinfo.matrix, poly_order) {
  
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
      n3 <-ggplot(df_data_all,aes(y = pred_model, x= as.factor(Time), alpha=0.7, color = as.factor(Time), fill = as.factor(Time)))
      # 
      # # Data + aes + Geometries 
      n3 <- n3 + geom_bar(stat="identity") 
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
      n3 <- n3 + ylab("MKT_VAL - row means ")
      # 
      # #Data + Aesthetics + Geoms + Facets + Statistics + Co-ordinates + Theme 
       n3 <- n3 + theme(axis.text.x = element_text(angle=305))
      # 
      n3 <- n3 + ggtitle(title)
      n3 <- n3 +facet_wrap( ~ clst_num)
      print(n3)
      
      
      
    }
  }
  
  
}

plot_mape_chart<- function(df_mape_all, type_of_validation) {
  title <- paste0("MAPE - ", type_of_validation)
  
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
  n3 <- n3 + xlab("Polynomial Order - ( Linear, Quadratic, Cubic, 4th and 5th order polynomial)")
  n3 <- n3 + ylab("Mean Absolute Percentage Error ")
  
  
  # 
  # #Data + Aesthetics + Geoms + Facets + Statistics + Co-ordinates + Theme 
   n3 <- n3 + theme(axis.text.x = element_text(angle=305))
  # 
  n3 <- n3 + ggtitle(title)
  n3 <- n3 +facet_wrap( ~ cluster)
  print(n3)
  
  
  
  
}





### plot the actual and fitted curves of the time-series

plot_act_pred_trg <- function (clst_num, partvar, taxinfo.matrix, poly_order) {
  arg2 <- partvar[clst_num]
  train_cl_num  <- as.data.frame(row.names(arg2[[1]]), stringsAsFactors = FALSE)
  train_cl_num  <- apply(train_cl_num,2, function(y) as.character(gsub("X", "", y)))
  ts_train_cl_num <-ts((rowMeans(taxinfo.matrix[c(train_cl_num)])),start = c(2007))
  
  Time <- c(seq(2007,2012))
  
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
  
  df_act_pred <- data.frame(ds, as.numeric(poly_order), as.numeric(clst_num))
  
  # Compute the mape 
  mape_val <-as.numeric(mape(ds$observed, ds$fitted))
  
  df_mape <- data.frame(as.numeric(mape_val), as.numeric(poly_order), as.numeric(clst_num))
  
  colnames(df_mape) <- c("mape", "poly_order","cluster")
  
  colnames(df_act_pred) <- c("Time","observed","fitted","poly_order","clst_num")
  
  
  
  
  
  
  
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
  
  
   
  return(list(mape=df_mape,act_pred=df_act_pred ))
  
}


plot_act_pred_test <- function (clst_num, partvar, trg_taxinfo.matrix, test_taxinfo.matrix, poly_order) {
 
   arg2 <- partvar[clst_num]
  
  train_cl_num  <- as.data.frame(row.names(arg2[[1]]), stringsAsFactors = FALSE)
  train_cl_num  <- apply(train_cl_num,2, function(y) as.character(gsub("X", "", y)))
  ts_train_cl_num <-ts((rowMeans(trg_taxinfo.matrix[c(train_cl_num)])),start = c(2007))
  
  test_cl_num  <- as.data.frame(row.names(arg2[[1]]), stringsAsFactors = FALSE)
  test_cl_num  <- apply(test_cl_num,2, function(y) as.character(gsub("X", "", y)))
  ts_test_cl_num <-ts((rowMeans(test_taxinfo.matrix[c(test_cl_num)])),start = c(2013)) 
  
  
  Time <- c(seq(2007,2012))
  
  Test_Time <- c(seq(2013,2014))
  Test_Time <- data.frame(Time = Test_Time  )      
  
  
  
  lm_mkt_val <-lm(ts_train_cl_num[1:6] ~ poly(Time,poly_order))
  
   
  pred_model <- predict.lm(lm_mkt_val, newdata = Test_Time)
  
   
  df_mkt_val <- data.frame(pred_model, Test_Time)
  
  #pd <- funggcast(ts_train_cl_num, lm_mkt_val2[1:8])
  dn <- ts_test_cl_num
  fcast <- df_mkt_val
  # fuction is from here
  # http://davenportspatialanalytics.squarespace.com/blog/2012/3/14/plotting-forecast-objects-in-ggplot-part-1-extracting-the-da.html
  #require(zoo) #needed for the 'as.yearmon()' function
  #fcast<-as.vector(fcast)
  #en<-max(time(fcast$mean)) #extract the max date used in the forecast
  en<- max(Test_Time$Time)
  #Extract Source and Training Data
  ds<-as.data.frame(window(dn,end=en))
  names(ds)<-'observed'
  #ds$date<-as.Date(time(window(dn,end=en)))
  ds$date<-as.numeric(time(window(ts_test_cl_num,end=en)))
  
  #Extract the Fitted Values  
  dfit<-as.data.frame(fcast$pred_model)
  dfit$date<-as.numeric(fcast$Time)
  names(dfit)[1]<-'fitted'
  
  
  df_buffer_CENTER$DF_BUFFER_ZONE <-as.character(df_buffer_CENTER$DF_BUFFER_ZONE)
  
  ds<-merge(ds,dfit,all.x=TRUE) #Merge fitted values with source and training data
  
  len <- length(ds$observed)
  ds$poly_order<-unlist(rep(poly_order,times =len))
  ds$poly_order<-as.numeric(ds$poly_order)
  
  
  ds$clst_num<-unlist(rep(clst_num,times =len))
  ds$clst_num<-as.numeric(ds$clst_num)
  
  df_act_pred <- data.frame(ds)
  
  # Compute the mape 
  mape_val <-as.numeric(mape(ds$observed, ds$fitted))
  
  df_mape <- data.frame(as.numeric(mape_val), as.numeric(poly_order), as.numeric(clst_num))
  
  colnames(df_mape) <- c("mape", "poly_order","cluster")
  
  
  
 # return(df_mape)
 return(list(mape=df_mape,act_pred=df_act_pred ))
  
}

plot_act_pred_buffer <- function (clst_num, partvar, taxinfo.matrix,buffer_taxinfo.matrix, poly_order) {
   # Create a model using the training model
   arg2 <- partvar[clst_num]
   train_cl_num  <- as.data.frame(row.names(arg2[[1]]), stringsAsFactors = FALSE)
   train_cl_num  <- apply(train_cl_num,2, function(y) as.character(gsub("X", "", y)))
   ts_train_cl_num <-ts((rowMeans(taxinfo.matrix[c(train_cl_num)])),start = c(2007))
   
   ts_buffer_cl_num <-ts((rowMeans(buffer_taxinfo.matrix[c(train_cl_num)])),start = c(2007))
   
  
  Time <- c(seq(2007,2014))
  
  Future_Time <- c(seq(2007,2014))
  Future_Time <- data.frame(Time = Future_Time  )      
  
  
  # polynomial regression model is created here 
  lm_mkt_val2 <-lm(ts_train_cl_num[1:8] ~ poly(Time,poly_order))
  
  #plot(predict(lm_mkt_val2, Future_Time), ylab="MKT_TOTAL_VAL - row means", main=title)
  pred_model <- predict.lm(lm_mkt_val2, newdata = Future_Time)
  
   
  df_mkt_val2 <- data.frame(pred_model, Future_Time)
  
  dn <- ts_buffer_cl_num
  
  fcast <- df_mkt_val2
  # fuction is from here
  # http://davenportspatialanalytics.squarespace.com/blog/2012/3/14/plotting-forecast-objects-in-ggplot-part-1-extracting-the-da.html
  #require(zoo) #needed for the 'as.yearmon()' function
  #fcast<-as.vector(fcast)
  #en<-max(time(fcast$mean)) #extract the max date used in the forecast
  en <- max(Future_Time$Time)
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
  
  len <- length(ds)
  ds$poly_order<-unlist(rep(poly_order,times =len))
  ds$poly_order<-as.numeric(ds$poly_order)
  
  ds$clst_num<-unlist(rep(clst_num,times =len))
  ds$clst_num<-as.numeric(ds$clst_num)
  
  df_act_pred <- data.frame(ds)
  
  
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
    title <- paste("Mean of MKT_TOTAL_VAL for BUFFER ZONE  1st order  & Cluster ", clst_num, "MAPE - ", mape_val)
  }
  if ( poly_order == 2 ){
    title <- paste("Mean of MKT_TOTAL_VAL for  BUFFER ZONE 2nd order  & Cluster ", clst_num, "MAPE - ", mape_val)
  }
  if ( poly_order == 3 ){
    title <- paste("Mean of MKT_TOTAL_VAL for BUFFER ZONE 3rd order  & Cluster ", clst_num, "MAPE - ", mape_val)
  } 
  if ( poly_order > 3 ){
    title <- paste("Mean of MKT_TOTAL_VAL for BUFFER ZONE ", poly_order,"th order  & Cluster ", clst_num, "MAPE - ", mape_val)
  } 
  
  
  # Data Layer
  n2 <-(ggplot)
  # 
  # # Data + Aesthetics Mapping 
  n2 <-ggplot(pd,aes(y = observed, x= Time, alpha=0.7))
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
  n2 <- n2 + ylab(" mean BUFFER MKT_VAL in dollars ")
  # 
  # #Data + Aesthetics + Geoms + Facets + Statistics + Co-ordinates + Theme 
  # n <- n + theme(axis.text.x = element_text(angle=305))
  # 
  n2 <- n2 + ggtitle(title)
  print(n2)
  
  #return(df_mape)
  return(list(mape=df_mape,act_pred=df_act_pred ))
  
}

non_linear_regresion_model <- function (partvar, taxinfo.matrix, poly_order, max_clst, zone, df_mape_test_all) {
 
  df_final_mkt_val <- NULL
  data.frame(df_final_mkt_val) 
  for ( clst_num in c(seq(1:(as.numeric(max_clst))))) {
    
    
    arg2 <- partvar[clst_num]
    train_cl_num  <- as.data.frame(row.names(arg2[[1]]), stringsAsFactors = FALSE)
    train_cl_num  <- apply(train_cl_num,2, function(y) as.character(gsub("X", "", y)))
    
    # How many parcel_id in this cluster
    num_parcel_ids <- length(arg2[[1]])
    
    # Create a time series using the row means
    ts_train_cl_num <-ts((rowMeans(taxinfo.matrix[c(train_cl_num)])),start = c(2007))
    
    
    # here is the time for source data
    Time <- c(seq(2007,2014))
    
    
    
    # Moving on to Forecast - here is the period for forecast
    Forecast_Time <- c(seq(2015,2018))
    Forecast_Time <- data.frame(Time = Forecast_Time)    
  
    
    title <- paste("MKT_TOTAL_VAL for", zone,"(", poly_order," order plynomial)")
    
    
    dn <- ts_train_cl_num
    
    #fcast <- df_mkt_val3
    # fuction is from here
    # http://davenportspatialanalytics.squarespace.com/blog/2012/3/14/plotting-forecast-objects-in-ggplot-part-1-extracting-the-da.html
    
    en <- max(Time)
    #Extract Source and Training Data
    ds<-as.data.frame(window(dn,end=en))
    names(ds)<-'mkt_val'
    ds$date<-as.numeric(time(window(ts_train_cl_num,end=en)))
    
     
    len <- length(ds)
    ds$data_type <- unlist(rep("source",times = len))
    ds$data_type <-as.character(ds$data_type) 
    ds$num_parcel_ids <- unlist(rep(num_parcel_ids,times = len))
    ds$num_parcel_ids <-as.numeric(ds$num_parcel_ids)    
    ds$zone <- unlist(rep(zone,times = len))
    ds$zone <-as.character(ds$zone)        
    
    # 
    # Predict the Forecast values  
    #
     
    
    #build a forecast model for 6 years as we did for training set
    Trg_Time <- c(seq(2007,2012))
    Time <- Trg_Time
    df_mkt_val3 <-lm(ts_train_cl_num[1:6] ~ poly(Time,poly_order))
    
    # here is the time for source data
    Time <- c(seq(2007,2014))
    fcast <- df_mkt_val3
    # Here is the prediction for the Future Time
    pred_model <- predict.lm(df_mkt_val3, newdata = Forecast_Time)
    summary(pred_model)
    dfcastn <- data.frame(pred_model, Forecast_Time)
    names(dfcastn)<-c('mkt_val','date')
    
    len <- length(dfcastn)
    dfcastn$data_type <- unlist(rep("predicted",times = len))
    dfcastn$data_type <-as.character(dfcastn$data_type) 
    dfcastn$num_parcel_ids <- unlist(rep(num_parcel_ids,times = len))
    dfcastn$num_parcel_ids <-as.numeric(dfcastn$num_parcel_ids)      
    dfcastn$zone <- unlist(rep(zone,times = len))
    dfcastn$zone <-as.character(dfcastn$zone)     
                                                                                                                                                                                           
    #
    ## Merge the source and forecast values
    #
    
    #
    #This is what will be used : we will bind rows
    #
    
    data <-bind_rows(ds,dfcastn)
    
     
    
    
    
    
    #data <- data.frame(pred_model, Future_Time)
    
    data_len <- nrow(data)
    data$clst_num <- unlist(rep(clst_num,times = data_len))
    data$clst_num <- as.numeric(data$clst_num) 
    
    
    
    # init the df_data_all with the first cluster 
    if(clst_num == 1) {
      df_data_all <- data
      
    } 
    else{
    
    # now row bind the rest of data from the clusters 
    # 
    df_data_all <- bind_rows(df_data_all, data)
    }
    
    
    
    # plot if all clusters  are done
    #
    
    
    if ( clst_num == as.numeric(max_clst)) {
      
       
      # Data Layer
      n3 <-(ggplot)
      # 
      # # Data + Aesthetics Mapping 
      #n3 <-ggplot(df_data_all,aes(y = pred_model, x= as.factor(Time), alpha=0.7, color = as.factor(Time), fill = as.factor(Time)))
      n3 <- ggplot(df_data_all,aes(y = (mkt_val*num_parcel_ids), x= as.factor(date), fill = factor(date), color=factor(data_type)))
      
      # 
      # # Data + aes + Geometries 
      n3 <- n3 + geom_bar(stat="identity") 
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
      # n <- n + theme(axis.text.x = element_text(angle=305))
      # 
      n3 <- n3 + ggtitle(title)
      n3 <- n3 +facet_wrap( ~ clst_num)
      print(n3)
      
      
      
    }
    
    # form a final data frame  by selecting the poly with the least test mape
    # match the cust_num in the for loop 
    # for all the clusters find the minumum mape
    # if the poly matches for the minumum mape 
    # add to the final data from 
    #df_final_mkt_val <- df_data_all
    
    
     
    df_mape_clst <- data.frame(df_mape_test_all[(df_mape_test_all$cluster == clst_num),])
      if (df_mape_clst[which.min(df_mape_clst$mape),]$poly_order == poly_order){
        
        if(clst_num == 1) {
          
          data$min_mape_poly <- df_mape_clst[which.min(df_mape_clst$mape),]$poly_order
          data$min_mape <- df_mape_clst[which.min(df_mape_clst$mape),]$mape
          data$min_mape_clst <- df_mape_clst[which.min(df_mape_clst$mape),]$cluster
          
          df_final_mkt_val <- data  
          
        } else {
          
          # now row bind the rest of data from the clusters 
          # 
          
          data$min_mape_poly <- df_mape_clst[which.min(df_mape_clst$mape),]$poly_order
          data$min_mape <- df_mape_clst[which.min(df_mape_clst$mape),]$mape
          data$min_mape_clst <- df_mape_clst[which.min(df_mape_clst$mape),]$cluster
          
          df_final_mkt_val <- bind_rows(df_final_mkt_val, data)
          
          
        }
        
        
        
       
     }
    
    
    
    
  }# for each cluster
  
  
  
  
  return(df_final_mkt_val)
} #  non_linear_model


plot_actpred_chart<- function(df_actpred_all, type_of_validation, arg_poly_order) {
  title <- paste0("Actual vs. Fitted - ", type_of_validation, "poly_order: ", arg_poly_order)

df_actpred <- df_actpred_all %>% filter(poly_order == arg_poly_order)  
  
# Data Layer
n2 <-(ggplot)
# 
# # Data + Aesthetics Mapping 
#n2 <-ggplot(ds,aes(y = observed, x= Time, alpha=0.9))
n2 <-ggplot(df_actpred,aes(y = observed, x= Time, alpha=0.9))

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
# #Data  \+ Aesthetics + Geoms + Facets + Statistics
# # ... add a linear regression model here
#n2 <- n2 + geom_smooth(method="gam" ) 
# #Data + Aesthetics + Geoms + Facets + Statistics + Co-ordinates
# #n <- n + scale_y_discrete(limits=c("00000","120000"), breaks=seq(00000,120000,10000))
n2 <- n2 + xlab("Years")
n2 <- n2 + ylab(" mean MKT_VAL in dollars ")
# 
# #Data + Aesthetics + Geoms + Facets + Statistics + Co-ordinates + Theme 
 n <- n + theme(axis.text.x = element_text(angle=305))
# 
n2 <- n2 + ggtitle(title)
n2 <- n2 +facet_wrap(  ~ clst_num)

print(n2)
} # chart_act_pred_trg