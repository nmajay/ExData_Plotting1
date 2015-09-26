library(ggplot2)
#Reading the data sources
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#head(NEI)
#head(SCC)

#Restricting the dataset for Baltimore
NEIForBaltimoreAndOnRoad <- NEI[NEI$fips == "24510" & (NEI$type=="ON-ROAD"),]
#head(NEIForBaltimoreAndOnRoad)

#Aggregating the total emissions by year
EmissionsByYear <- with(NEIForBaltimoreAndOnRoad, aggregate(NEIForBaltimoreAndOnRoad[,'Emissions'], by = list(year),sum,na.rm=TRUE))
names(EmissionsByYear) <- c('Year','TotalEmissions')
#head(EmissionsByYear)

#Setting up the Printing device to store the graph
png(filename='ExData_Plotting1/Project2/plot5.png', width=480, height=480, units='px')
qplot(Year, TotalEmissions, data = EmissionsByYear, geom = "line", main ="Total Emissions for On-Road Motor Vehicles - Baltimore")

#Shutting off
dev.off()