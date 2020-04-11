#1st Step: Reading and Importing the Data. 2nd Step: naming the DatA for more comfort 3rd Step: doing the same for the Dates (1-2 of February 2007 through the subsetting function
PowerData <- read.table("~/Desktop/Online education/Exploratory DA/HPC.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
DataSubset<- subset(PowerData,PowerData$Date=="1/2/2007" | PowerData$Date =="2/2/2007")

#Getting the first plot
hist(as.numeric(as.character(DataSubset$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
globalActivePower <- as.numeric(DataSubset$Global_active_power)

#Saving the plot as PNG
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
