###Creates plot1

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
png(filename = "plot1.png", width = 480, height = 480)

hist(powertbl$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", 
	main = "Global Active Power")
	
dev.off()