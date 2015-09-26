library(ggplot2)
#Reading the data sources
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#head(NEI)
#head(SCC)

coalData <- grep("coal",SCC$Short.Name, ignore.case=T)
coalSource <- SCC[coalData,]
#head(coalSource)

NEI_Coal <- NEI[NEI$SCC %in% coalSource$SCC,]

#Aggregating the total emissions by year
EmissionsByYearForCoal <- with(NEI_Coal, aggregate(NEI_Coal[,'Emissions'], by = list(year),sum,na.rm=TRUE))
names(EmissionsByYearForCoal) <- c('Year','TotalEmissions')
#head(EmissionsByYearForCoal)

#Setting up the Printing device to store the graph
png(filename='ExData_Plotting1/Project2/plot4.png', width=480, height=480, units='px')
qplot(Year, TotalEmissions, data = EmissionsByYearForCoal,geom = "line", main ="Total Emissions from coal combustion-related sources by Year")

#Shutting off
dev.off()