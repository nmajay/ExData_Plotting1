library(ggplot2)
#Reading the data sources
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#head(NEI)
#head(SCC)



#Restricting the dataset for Baltimore
NEIForBaltimoreAndLAForOnRoad <- NEI[NEI$fips %in% c("24510","06037") & (NEI$type=="ON-ROAD"),]
#head(NEIForBaltimoreAndOnRoad)

#Aggregating the total emissions by year
EmissionsByYearAndFips <- with(NEIForBaltimoreAndLAForOnRoad, aggregate(NEIForBaltimoreAndLAForOnRoad[,'Emissions'], by = list(year,fips),sum,na.rm=TRUE))
names(EmissionsByYearAndFips) <- c('Year','City', 'TotalEmissions')
#head(EmissionsByYearAndFips)

#Setting up the Printing device to store the graph
png(filename='ExData_Plotting1/Project2/plot6.png', width=480, height=480, units='px')

g <- ggplot(EmissionsByYearAndFips, aes(Year, TotalEmissions, color = City))
g + geom_line(stat = "summary", fun.y="sum") + 
  ylab("Total Emissions") + 
  ggtitle("Total Emission From Motor Vehicles\n in Baltimore and Los Angeles County\n from 1999 until 2008") +
  scale_colour_discrete(name="Cities", label=c("Los Angeles", "Baltimore"))

#Shutting off
dev.off()