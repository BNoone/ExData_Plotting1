#1st Step: Reading and Importing the Data. 2nd Step: naming the DatA for more comfort 3rd Step: doing the same for the Dates (1-2 of February 2007 through the subsetting function
PowerData <- read.table("~/Desktop/Online education/Exploratory DA/HPC.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
DataSubset<- subset(PowerData,PowerData$Date=="1/2/2007" | PowerData$Date =="2/2/2007")
str(DataSubset)
#it can be seen that in order to come to these parts of plot, we have to turn the characters into numeric

#setting the necessary measures as numerics
datetime <- strptime(paste(DataSubset$Date, DataSubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(DataSubset$Global_active_power)
globalReactivePower <- as.numeric(DataSubset$Global_reactive_power)
voltage <- as.numeric(DataSubset$Voltage)
subMetering1 <- as.numeric(DataSubset$Sub_metering_1)
subMetering2 <- as.numeric(DataSubset$Sub_metering_2)
subMetering3 <- as.numeric(DataSubset$Sub_metering_3)

#creating the png
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
