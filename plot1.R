household_power_consumption <- read.csv("~/Data Scientist Course/Coursera/Course 4/Week 1/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
View(household_power_consumption)
#Convert character to date
household_power_consumption$Date <- as.Date(household_power_consumption$Date, "%d/%m/%Y")
#Extract data with date "2007-02-01
new1 <- household_power_consumption[grep("2007-02-01", household_power_consumption$Date),]
#Extract data with date "2007-02-02
new2 <- household_power_consumption[grep("2007-02-02", household_power_consumption$Date),]
#row combine new1 and new2
data <- rbind(new1, new2)
#open a png file with 480x480 pixels
png("plot1.png", width = 480, height = 480, units = "px")
with(data, hist(as.numeric(data$Global_active_power), main = "Global Active Power", xlab = "Global Active Power(kilowatts)", col = "red"))
dev.off()
