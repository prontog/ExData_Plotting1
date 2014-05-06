# Read the whole thing.
hpc <- read.csv("household_power_consumption.txt", sep=";")
# Convert the Date column from factor to date.
hpc$Date <-as.Date(hpc$Date, format="%d/%m/%Y")
# Subset the observations from 2007-02-01 to 2007-02-01.
hpc_part <- subset(hpc, Date >= "2007-02-01" & Date <= "2007-02-02")
# Remove the huge object.
rm(hpc)

gap <- as.numeric(levels(hpc_part$Global_active_power)[hpc_part$Global_active_power])

png("plot1.png", width=480, height=480)
hist(gap, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
