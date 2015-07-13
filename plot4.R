# Reading the file in as a dataset
dataFile <- "./household_power_consumption.txt"
dsPowerConsumption <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
dsSubsetPowerConsumption <- dsPowerConsumption[dsPowerConsumption$Date %in% c("1/2/2007","2/2/2007") ,]
#head(dsPowerConsumption)
dateTimeForPlot <- strptime(paste(dsSubsetPowerConsumption$Date,dsSubsetPowerConsumption$Time), "%d/%m/%Y %H:%M:%S")
globalActivePowerForPlot <- as.numeric(dsSubsetPowerConsumption$Global_active_power)

voltageForPlot <- dsSubsetPowerConsumption$Voltage

Global_reactive_power_ForPlot <- dsSubsetPowerConsumption$Global_reactive_power

subMetering1 <- dsSubsetPowerConsumption$Sub_metering_1
subMetering2 <- dsSubsetPowerConsumption$Sub_metering_2
subMetering3 <- dsSubsetPowerConsumption$Sub_metering_3

#head(dateTimeForPlot)
png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))

#First Plot
plot(dateTimeForPlot,globalActivePowerForPlot, type="l", col="black", xlab="",ylab = "Global Active Power")

#Second Plot
plot(dateTimeForPlot,voltageForPlot, type="l", col="black", xlab="datetime",ylab = "Voltage")

#Third Plot
plot(dateTimeForPlot,subMetering1, type="l", col="black", xlab="",ylab = "Energy sub metering")
lines(dateTimeForPlot,subMetering2, type="l", col="red")
lines(dateTimeForPlot,subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

#Fourth Plot
plot(dateTimeForPlot,Global_reactive_power_ForPlot, type="l", col="black", xlab="datetime",ylab = "Global_reactive_power")

dev.off()



