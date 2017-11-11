#getting data
setwd("/Users/mebner/Documents/for_me/R_coursera/GitHub/ExData_Plotting1")
raw <- read.table("household_power_consumption.txt",header = T,stringsAsFactors=FALSE, sep =";")

#subset data
ds <- raw[raw$Date %in% c("1/2/2007","2/2/2007") ,]

#formatting date and time
ds$datetime <- strptime(paste(ds$Date, ds$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
ds$Date <- as.Date(ds$Date,"%d/%m/%Y")

#Creating plot
png("plot2.png", width=480, height=480)
plot(ds$datetime,ds$Global_active_power, type = "l",xlab = "", ylab="Global Active Power (kilowatts)")
dev.off()