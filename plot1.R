# plot1.R

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
                     header=TRUE, sep=";", dec=".", 
                     stringsAsFactors=FALSE)

# filter days 1 and 2 februery 2007
data2 <- data1[data1$Date %in% c("1/2/2007", "2/2/2007"), ]

# filter column for graphic
data3 <- as.numeric(data2$Global_active_power)

# generate graphic
png("plot1.png", width=480, height=480)
hist(data3, 
     col="red", 
     main="GLOBAL ACTIVE POWER - days 1 and 2 fev. 2007", 
     xlab="Global Active Power (kilowatts)")
dev.off()
