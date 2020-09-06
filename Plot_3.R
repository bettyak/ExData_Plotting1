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

electricPowerSub2$Sub_metering_1<-as.character(electricPowerSub2$Sub_metering_1)
electricPowerSub2$Sub_metering_1<-as.numeric(electricPowerSub2$Sub_metering_1)
electricPowerSub2$Sub_metering_2<-as.character(electricPowerSub2$Sub_metering_2)
electricPowerSub2$Sub_metering_2<-as.numeric(electricPowerSub2$Sub_metering_2)
electricPowerSub2$Sub_metering_3<-as.character(electricPowerSub2$Sub_metering_3)
electricPowerSub2$Sub_metering_3<-as.numeric(electricPowerSub2$Sub_metering_3)

##create the plot
plot(electricPowerSub2$DT, electricPowerSub2$Sub_metering_1, type="l", yaxt='n', ylim = c(0,40), 
     ylab="Energy sub metering", xlab="")
axis(side=2, at = seq(0,30, by=10),)
lines(electricPowerSub2$DT, electricPowerSub2$Sub_metering_2, col="red")
lines(electricPowerSub2$DT, electricPowerSub2$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"),lty=1:1)

