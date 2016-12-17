### Exploratory Final Project

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(dplyr)
library(ggplot2)

## Question 6
la_balt <- filter(NEI, fips %in% c( "24510" , "06037"))
motor_la_balt <- filter(la_balt, SCC %in% motor)
motor_la_balt <- group_by(motor_la_balt, year, fips)
motor_la_balt_summary <- summarise(motor_la_balt, Total_PMI25 = sum(Emissions))
motor_la_balt_summary$fips <- as.factor(motor_la_balt_summary$fips)
levels(motor_la_balt_summary$fips) <- c("LA", "Baltimore")
png(filename = "plot6.png")
g <- ggplot(motor_la_balt_summary, aes(year, Total_PMI25))
g <- g + geom_bar(stat = "identity")
g <- g + facet_grid(.~fips)
g
dev.off()
