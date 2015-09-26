#Reading the data sources
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#head(NEI)
#head(SCC)

NEIForBaltimore <- NEI[NEI$fips == "24510",]

#Aggregating the total emissions by year
SummedUpEmissions <- with(NEIForBaltimore, aggregate(NEIForBaltimore[,'Emissions'], by = list(year),sum,na.rm=TRUE))
names(SummedUpEmissions) <- c('Year','TotalEmissions')
#head(SummedUpEmissions)

#Setting up the Printing device to store the graph
png(filename='ExData_Plotting1/Project2/plot2.png', width=480, height=480, units='px')
plot(SummedUpEmissions,type = "l", xlab = "Year", ylab = "Total PM2.5 Emissions"
        ,xaxt = "n", main = "Total PM2.5 Emission Trend Across Years for Baltimore", col = "red")

#Plotting only the years required on X-Axis
axis(1, at=as.integer(SummedUpEmissions$Year), las=1)


#Shutting off
dev.off()