# Reading the file in as a dataset
dataFile <- "./household_power_consumption.txt"
dsPowerConsumption <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
dsSubsetPowerConsumption <- dsPowerConsumption[dsPowerConsumption$Date %in% c("1/2/2007","2/2/2007") ,]
#head(dsPowerConsumption)
dateTimeForPlot <- strptime(paste(dsSubsetPowerConsumption$Date,dsSubsetPowerConsumption$Time), "%d/%m/%Y %H:%M:%S")
subMetering1 <- dsSubsetPowerConsumption$Sub_metering_1
subMetering2 <- dsSubsetPowerConsumption$Sub_metering_2
subMetering3 <- dsSubsetPowerConsumption$Sub_metering_3

#head(dateTimeForPlot)
png("plot3.png", width=480, height=480)
plot(dateTimeForPlot,subMetering1, type="l", col="black", xlab="",ylab = "Energy sub metering")
lines(dateTimeForPlot,subMetering2, type="l", col="red")
lines(dateTimeForPlot,subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()



