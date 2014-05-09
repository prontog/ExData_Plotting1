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

png("plot1.png", width=480, height=480)
hist(hpc$Global_active_power, 
     col="red", 
     xlab="Global Active Power (kilowatts)", 
     main="Global Active Power")
dev.off()

