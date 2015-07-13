# Reading the file in as a dataset
dataFile <- "./household_power_consumption.txt"
dsPowerConsumption <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
dsSubsetPowerConsumption <- dsPowerConsumption[dsPowerConsumption$Date %in% c("1/2/2007","2/2/2007") ,]
#head(dsPowerConsumption)
globalActivePowerForPlot <- as.numeric(dsSubsetPowerConsumption$Global_active_power)
#head(globalActivePowerForPlot)
png("plot1.png", width=480, height=480)
hist(globalActivePowerForPlot, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()


