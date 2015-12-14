# plot4.R

# set folder of project
setwd("C:/EDA_PROJECT1")

# if file not exist, download and unzip in subfolder "/data"
if(!file.exists("data/household_power_consumption.txt")) {
   url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
   download.file(url, destfile="data.zip")
   unzip(zipfile="data.zip", exdir="data")
}

# load file to workspace
data1 <- read.table("C:/EDA_PROJECT1/data/household_power_consumption.txt", 
                    header=TRUE, 
                    sep=";", 
                    dec=".", 
                    stringsAsFactors=FALSE)

# filter days 1 and 2 february 2007 
data2<- subset(data1, (data1$Date == "1/2/2007" | data1$Date== "2/2/2007")) 
# create variable DateTime
data2 <- transform(data2, DateTime=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
# convert character to numeric
data2$Sub_metering_1 <- as.numeric(as.character(data2$Sub_metering_1))
data2$Sub_metering_2 <- as.numeric(as.character(data2$Sub_metering_2))
data2$Sub_metering_3 <- as.numeric(as.character(data2$Sub_metering_3))

attach(data2) # use the variables of data2

# 4 graphics in 2 x 2
par(mfrow = c(2, 2))
# generate graphic top-left
plot(DateTime, Global_active_power, 
     type = "l",
     xlab = "", 
	 ylab = "Global Active Power")
# generate graphic top-right
plot(DateTime, Voltage,
     type = "l",
     xlab = "datetime", 
	 ylab = "Voltage")
# generate graphic bottom-left
plot(DateTime, Sub_metering_1, 
	 type="l", 
	 ylab= "Energy sub metering", 
	 xlab="")
lines(DateTime, Sub_metering_2, 
	  type="l", 
	  col="red")
lines(DateTime, Sub_metering_3, 
	  type="l", 
	  col="blue")
legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, 
       col=c("black", "red", "blue"))
# generate graphic bottom-right
plot(DateTime, Global_reactive_power, 
     type = "l",
     col = "black",
     xlab = "datetime", 
	 ylab = colnames(data2)[4])
# generate output
dev.copy(png, file="plot4.png", with=480, height=480)
dev.off()

detach(data2)

