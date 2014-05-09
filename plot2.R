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
png("plot2.png", width=480, height=480)
plot(hpc$Global_active_power ~ hpc$DateTime, 
     ylab="Global Active Power (kilowatts)", 
     xlab="", 
     type="l")

dev.off()

