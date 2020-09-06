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

##merge date and time to one new column
electricPowerSub2$DT<-as.POSIXct(paste(electricPowerSub2$Date, electricPowerSub2$Time))

##convert the values from factors to characters and then to numeric
electricPowerSub2$Global_active_power<-as.character(electricPowerSub2$Global_active_power)
electricPowerSub2$Global_active_power<-as.numeric(electricPowerSub2$Global_active_power)
electricPowerSub2$Sub_metering_1<-as.character(electricPowerSub2$Sub_metering_1)
electricPowerSub2$Sub_metering_1<-as.numeric(electricPowerSub2$Sub_metering_1)
electricPowerSub2$Sub_metering_2<-as.character(electricPowerSub2$Sub_metering_2)
electricPowerSub2$Sub_metering_2<-as.numeric(electricPowerSub2$Sub_metering_2)
electricPowerSub2$Sub_metering_3<-as.character(electricPowerSub2$Sub_metering_3)
electricPowerSub2$Sub_metering_3<-as.numeric(electricPowerSub2$Sub_metering_3)
electricPowerSub2$Global_reactive_power<-as.character(electricPowerSub2$Global_reactive_power)
electricPowerSub2$Global_reactive_power<-as.numeric(electricPowerSub2$Global_reactive_power)
electricPowerSub2$Voltage<-as.character(electricPowerSub2$Voltage)
electricPowerSub2$Voltage<-as.numeric(electricPowerSub2$Voltage)

##create two rows and two column plot display
par(mfrow=c(2,2))

##plot one global active power date time plot
plot(electricPowerSub2$DT, electricPowerSub2$Global_active_power,type="l", ylab="Global Active Power", xlab="")

##plot two voltage and date time plot
plot(electricPowerSub2$DT, electricPowerSub2$Voltage, type="l", xlab="datetime", ylab="Voltage")

##plot three energy sub metering and date time for three sub metering
plot(electricPowerSub2$DT, electricPowerSub2$Sub_metering_1, type="l", yaxt='n', ylim = c(0,40), 
     ylab="Energy sub metering", xlab="")
axis(side=2, at = seq(0,30, by=10),)
lines(electricPowerSub2$DT, electricPowerSub2$Sub_metering_2, col="red")
lines(electricPowerSub2$DT, electricPowerSub2$Sub_metering_3, col="blue")
legend("topright", bty ="n",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"),lty=1:1)

##plot 4 global reactive power and date time plot
plot(electricPowerSub2$DT, electricPowerSub2$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")