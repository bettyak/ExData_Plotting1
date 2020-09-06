#Dataset reference:
#This assignment uses data from the UC Irvine Machine Learning Repository, a popular repository 
#for machine learning datasets. In particular, we will be using the "Individual household electric 
#power consumption Data Set" 

##set the working directory to access data
setwd("C:/Users/betty/OneDrive/Documents/R")

##read in the data to a data table
electricPower<-read.table("./household_power_consumption.txt", header=TRUE, sep=";")

##convert the date to a usuable value for the date column
electricPower$Date<-strptime(electricPower$Date, "%d/%m/%Y")

##create a sub data frame that only holds the dates of interest
electricPowerSub2<-electricPower[electricPower$Date>="2007-02-01" & electricPower$Date<="2007-02-02",]


##convert the time to a character first, so that the converstion to time value works
electricPowerSub2$Time<-as.character(electricPowerSub2$Time)

electricPowerSub2$DT<-as.POSIXct(paste(electricPowerSub2$Date, electricPowerSub2$Time))

##convert the values within global active power from factors to characters
electricPowerSub2$Global_active_power<-as.character(electricPowerSub2$Global_active_power)

##convert the values within global active power from characters to numberic
electricPowerSub2$Global_active_power<-as.numeric(electricPowerSub2$Global_active_power)

##create the plot
plot(electricPowerSub2$DT, electricPowerSub2$Global_active_power, type="l", 
     ylab="Global Active Power (kilowatts)", xlab="")
