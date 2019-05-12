household_power_consumption <- read.csv("~/Data Scientist Course/Coursera/Course 4/Week 1/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
View(household_power_consumption)
#combine date and time
Date.Time <- paste(household_power_consumption$Date, household_power_consumption$Time)
#convert to date time format
Date.Time <- data.frame(Date.Time = strptime(Date.Time, "%d/%m/%Y %H:%M:%S"))
data <- cbind(Date.Time, household_power_consumption)
#Extract data with date "2007-02-01
new1 <- data[grep("^2007-02-01", data$Date.Time),]
#Extract data with date "2007-02-02
new2 <- data[grep("^2007-02-02", data$Date.Time),]
#row combine new1 and new2
data <- rbind(new1, new2)
#add days to data
library(lubridate)
day <- data.frame(day = wday(data$Date.Time, label = TRUE))
data <- cbind(data, day)
#open a png file with 480x480 pixels
png("plot2.png", width = 480, height = 480, units = "px")
with(data, plot(data$Date.Time, as.numeric(data$Global_active_power), xlab = " ", ylab = "Global Active Power(kilowatts)"))
dev.off()