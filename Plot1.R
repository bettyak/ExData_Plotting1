#Exploratory Data Analysis Course Project 1

#Dataset reference:
#This assignment uses data from the UC Irvine Machine Learning Repository, a popular repository 
#for machine learning datasets. In particular, we will be using the "Individual household electric 
#power consumption Data Set" 

##set the working directory to access data
setwd("C:/Users/betty/OneDrive/Documents/R")

##read in the data to a data table
electricPower<-read.table("./household_power_consumption.txt", header=TRUE, sep=";")

##convert the time to a usuable value for the date column
electricPower$Date<-strptime(electricPower$Date, "%d/%m/%Y")

##create a sub data frame that only holds the dates of interest
electricPowerSub<-electricPower[electricPower$Date>="2007-02-01" & electricPower$Date<="2007-02-02",]

##convert the values within global active power from factors to characters
electricPowerSub$Global_active_power<-as.character(electricPowerSub$Global_active_power)

##convert the values within global active power from characters to numberic
electricPowerSub$Global_active_power<-as.numeric(electricPowerSub$Global_active_power)

##Generate historgram without x axis
hist(electricPowerSub$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red",xlim=c(0,6), breaks = 12, xaxt='n')

#add desired x axis
axis(side = 1, at = seq(0, 6, by = 2))

