#Plot3
#get data
#get data
powerConsumptionData <- read.table("household_power_consumption.txt", header=TRUE, sep=";",dec=".",na.strings = "?")

#combine date and time column
powerConsumptionData$DateTime <- paste(powerConsumptionData$Date, powerConsumptionData$Time,sep=" ")

#convert date column to type date
powerConsumptionData$Date <- as.Date(powerConsumptionData$Date , "%d/%m/%Y")

#convert datetime column to type datetime
library(lubridate)
powerConsumptionData$DateTime <-dmy_hms(powerConsumptionData$DateTime)

#filter out unwanteddata
powerConsumptionData  <- subset(powerConsumptionData , Date == "2007-02-01" | Date == "2007-02-02",select=c(Date, DateTime,Global_active_power,Global_reactive_power, Voltage, Global_intensity, Sub_metering_1,Sub_metering_2,Sub_metering_3))

#created plotted
png(filename = "plot3.png",width = 480, height = 480, units = "px")

#create graph
plot(powerConsumptionData$DateTime,powerConsumptionData$Sub_metering_1, type="n", xlab="",ylab="Energy Sub Metering")
lines(powerConsumptionData$DateTime,powerConsumptionData$Sub_metering_1, type="l", col="black")
lines(powerConsumptionData$DateTime,powerConsumptionData$Sub_metering_2, type="l", col="red")
lines(powerConsumptionData$DateTime,powerConsumptionData$Sub_metering_3, type="l", col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))


#remove connection to png
dev.off()


