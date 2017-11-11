#getting data
setwd("/Users/mebner/Documents/for_me/R_coursera/GitHub/ExData_Plotting1")
raw <- read.table("household_power_consumption.txt",header = T,stringsAsFactors=FALSE, sep =";")

#subset data
ds <- raw[raw$Date %in% c("1/2/2007","2/2/2007") ,]

#formatting date and time
ds$datetime <- strptime(paste(ds$Date, ds$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
ds$Date <- as.Date(ds$Date,"%d/%m/%Y")

#changing data type of ESM
ds$Sub_metering_1 <- as.numeric(ds$Sub_metering_1)
ds$Sub_metering_2 <- as.numeric(ds$Sub_metering_2)
ds$Sub_metering_3 <- as.numeric(ds$Sub_metering_3)

#Creating plot
png("plot3.png", width=480, height=480)
plot(ds$datetime,ds$Sub_metering_1, type = "l",ylab="Energy sub metering", xlab = "")
lines(ds$datetime,ds$Sub_metering_2, type = "l",col = "red")
lines(ds$datetime,ds$Sub_metering_3, type = "l",col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=2.5,col=c("black","red","blue"))

dev.off()
