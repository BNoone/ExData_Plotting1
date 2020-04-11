#1st Step: Reading and Importing the Data. 2nd Step: naming the DatA for more comfort 3rd Step: doing the same for the Dates (1-2 of February 2007 through the subsetting function
PowerData <- read.table("~/Desktop/Online education/Exploratory DA/HPC.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
DataSubset<- subset(PowerData,PowerData$Date=="1/2/2007" | PowerData$Date =="2/2/2007")

#setting the days for the plot 2
datetime <- strptime(paste(DataSubset$Date, DataSubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(DataSubset$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
