# plot3.R

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

# filter days 1 and 2 februery 2007
data2<- subset(data1, (data1$Date == "1/2/2007" | data1$Date== "2/2/2007")) 
# change the date format
data2$Date <- as.Date(data2$Date, format = "%d/%m/%Y")
# create variable DateTime
data2$DateTime <- as.POSIXct(paste(data2$Date, data2$Time))

# generate graphic
png("plot3.png", width = 480, height = 480)
plot(data2$DateTime, 
     data2$Sub_metering_1, 
     type="l", 
     ylab= "Energy sub metering", 
     xlab="")
lines(data2$DateTime, 
      data2$Sub_metering_2, 
      type="l", 
      col="red")
lines(data2$DateTime, 
      data2$Sub_metering_3, 
      type="l", 
      col="blue")
legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, 
       col=c("black", "red", "blue"))
dev.off()
