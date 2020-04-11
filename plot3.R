#1st Step: Reading and Importing the Data. 2nd Step: naming the DatA for more comfort 3rd Step: doing the same for the Dates (1-2 of February 2007 through the subsetting function
PowerData <- read.table("~/Desktop/Online education/Exploratory DA/HPC.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
DataSubset<- subset(PowerData,PowerData$Date=="1/2/2007" | PowerData$Date =="2/2/2007")

#setting the days for the plot 3
datetime <- strptime(paste(DataSubset$Date, DataSubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(DataSubset$Global_active_power)
subMetering1 <- as.numeric(DataSubset$Sub_metering_1)
subMetering2 <- as.numeric(DataSubset$Sub_metering_2)
subMetering3 <- as.numeric(DataSubset$Sub_metering_3)

#Creating the plot3.png
png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
