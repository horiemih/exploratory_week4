##2) Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips=="24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

NEI<- readRDS ("C:\\XX\\Desktop\\corsera\\exdata\\summarySCC_PM25.rds")
library(dplyr)

## filter for baltimore city
NEI2 <- filter(NEI, fips == "24510")
new2 <- aggregate(NEI2$Emissions, by=list(year = NEI2$year), FUN =sum)
## print the graph
png("C:\\XX\\Desktop\\corsera\\week4plot2.png", width=480, height=480)
with(new2, plot(year, x, ylab= "Emissons"))
## Compraing 1999 and 2008, 2008 emission is lower than 1999
dev.off()
