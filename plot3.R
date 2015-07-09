###Creates plot3

##read in only data for two day period from table, then clean it
headvct <- as.vector(read.table("household_power_consumption.txt", header = FALSE, 
	nrows = 1, sep = ";"))
	
powertbl <- read.table("household_power_consumption.txt", header = FALSE, 
	col.names = unname(unlist(headvct)), skip = 66637, nrows = 2880, sep = ";")
	
#create datetime row
dates <- powertbl$Date
times <- powertbl$Time

datetm <- strptime(paste(dates, times), "%d/%m/%Y %H:%M:%S")

powertbl$DateTime <- datetm
	
##open png device, creates plot, closes device
png(filename = "plot3.png", width = 480, height = 480)

with(testtbl, plot(DateTime, Sub_metering_1, type = "l", col = "black", 
	ylab = "Energy sub metering", xlab = ""))
with(testtbl, lines(DateTime, Sub_metering_2, type = "l", col = "red"))
with(testtbl, lines(DateTime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", col = c("black", "red", "blue"), lty = c(1,1) , 
	legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
	
dev.off()