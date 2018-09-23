##1)Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

##read file
NEI<- readRDS ("C:\\Users\\mhorie\\Desktop\\corsera\\exdata\\summarySCC_PM25.rds")
##sum the yearly emissions 
new <- aggregate(NEI$Emissions, by=list(year = NEI$year), FUN =sum)
## print the graph
png("C:\\Users\\mhorie\\Desktop\\corsera\\week4plot1.png", width=480, height=480)
with(new, plot(year, x, ylab= "Emissons"))

## Emission decreased over time
 dev.off()
