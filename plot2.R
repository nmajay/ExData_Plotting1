# Reading the file in as a dataset
dataFile <- "./household_power_consumption.txt"
dsPowerConsumption <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
dsSubsetPowerConsumption <- dsPowerConsumption[dsPowerConsumption$Date %in% c("1/2/2007","2/2/2007") ,]
#head(dsPowerConsumption)
dateTimeForPlot <- strptime(paste(dsSubsetPowerConsumption$Date,dsSubsetPowerConsumption$Time), "%d/%m/%Y %H:%M:%S")
globalActivePowerForPlot <- as.numeric(dsSubsetPowerConsumption$Global_active_power)
#head(dateTimeForPlot)
png("plot2.png", width=480, height=480)
plot(dateTimeForPlot,globalActivePowerForPlot, type="l", col="black", xlab="",ylab = "Global Active Power (kilowatts)")
dev.off()



