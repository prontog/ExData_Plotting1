hpc_header <- read.csv("household_power_consumption.txt", 
                       sep=";", 
                       nrows=1, 
                       header=TRUE)
# Read the rows for the two dates of interest.
hpc <- read.csv("household_power_consumption.txt", 
                sep=";", 
                skip=66637, 
                nrows=2880,
                col.names = colnames(hpc_header))
# Remove header object. Not needed anymore.
rm(hpc_header)

# Create a DateTime column from Date and Time columns.
hpc$DateTime <- as.POSIXct(strptime(paste(hpc$Date, hpc$Time), 
                                    "%d/%m/%Y %H:%M:%S"))

# Plot to a PNG device.
png("plot4.png", width=480, height=480)

par(mfcol = c(2, 2))
curr.cex <- 0.75
par(cex.axis = curr.cex, 
    cex.lab = curr.cex,
    cex.sub = curr.cex)

# First plot
plot(hpc$Global_active_power ~ hpc$DateTime, 
     ylab="Global Active Power", 
     xlab="", 
     type="l")

# Second plot
plot(hpc$Sub_metering_1 ~ hpc$DateTime, 
     ylab="Energy sub metering", 
     xlab="", 
     type="n")

# Add the lines separately.
lines(hpc$DateTime, hpc$Sub_metering_1)
lines(hpc$DateTime, hpc$Sub_metering_2, col="red")
lines(hpc$DateTime, hpc$Sub_metering_3, col="blue")

# Add the legend.
legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1, 1, 1), 
       col = c("black", "red", "blue"),
       cex = 0.75,
       bty = "n")

# Third plot
plot(hpc$Voltage ~ hpc$DateTime, 
     ylab="Voltage", 
     xlab="datetime", 
     type="l")

plot(hpc$Global_reactive_power ~ hpc$DateTime, 
     ylab="Global_reactive_power", 
     xlab="datetime", 
     type="l")

dev.off()

