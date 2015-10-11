# plot2.R

# set folder of project
setwd("C:/EDA_PROJECT1")

# if file not exist, download and unzip in subfolder "/data"
if(!file.exists("data/household_power_consumption.txt")) {
    url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(url, destfile="data.zip")
    unzip(zipfile="data.zip", exdir="data")
}
# load file to workspace
data1 <- read.table("C:/EDA_PROJECT1/data/household_power_consumption.txt", header=TRUE, sep=";", dec=".", stringsAsFactors=FALSE)

# filter days 1 and 2 february 2007 
data2<- subset(data1, (data1$Date == "1/2/2007" | data1$Date== "2/2/2007")) 

# change date and time format
data2$Date <- as.Date(data2$Date, format = "%d/%m/%Y")
data2$DateTime <- as.POSIXct(paste(data2$Date, data2$Time))

# generate graphic
png("plot2.png", width=480, height= 480)
plot(data2$DateTime, data2$Global_active_power, type= "l", lwd=1, ylab= "Global Active Power (kilowatts)", xlab="")
dev.off()
