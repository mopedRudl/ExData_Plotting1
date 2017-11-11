#getting data
setwd("/Users/mebner/Documents/for_me/R_coursera/GitHub/ExData_Plotting1")
raw <- read.table("household_power_consumption.txt",header = T,stringsAsFactors=FALSE, sep =";")

#subset data
ds <- raw[raw$Date %in% c("1/2/2007","2/2/2007") ,]

#formatting date and time
ds$datetime <- strptime(paste(ds$Date, ds$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
ds$Date <- as.Date(ds$Date,"%d/%m/%Y")

#changing data type of GAP
ds$Global_active_power <- as.numeric(ds$Global_active_power)

#Creating plot
png("plot1.png", width=480, height=480)
hist(ds$Global_active_power, main="Global Active Power",ylab="Frequency", xlab="Global Active Power (kilowatts)",col="red")
dev.off()