library(ggplot2)
#Reading the data sources
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#head(NEI)
#head(SCC)

NEIForBaltimore <- NEI[NEI$fips == "24510",]

#Aggregating the total emissions by year
EmissionsByType <- with(NEIForBaltimore, aggregate(NEIForBaltimore[,'Emissions'], by = list(type,year),sum,na.rm=TRUE))
names(EmissionsByType) <- c('Type','Year','TotalEmissions')
#head(EmissionsByType)

#Setting up the Printing device to store the graph
png(filename='ExData_Plotting1/Project2/plot3.png', width=720, height=720, units='px')
qplot(Year, TotalEmissions, data = EmissionsByType, facets = .~Type, geom = "line", color = Type, main ="Total Emissions by Type Broken By Year")

#Shutting off
dev.off()