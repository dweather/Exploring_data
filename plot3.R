### Exploratory Final Project

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(dplyr)
library(ggplot2)

## Question 3
NEI <- group_by(NEI, year, type)
baltimore <- filter(NEI, fips == "24510")
baltimore <- summarise(baltimore, Total_PMI25 = sum(Emissions))

g <- ggplot(baltimore, aes(year, Total_PMI25))
g <- g + geom_bar(stat = "identity")
g <- g + facet_grid(.~type)
png(filename = "plot3.png")
g
dev.off()






