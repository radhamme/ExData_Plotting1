setwd("C:\\Coursera\\Data Specialization Track\\Repositories\\ExData_Plotting1")
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,"project1.zip")
filename <- unzip("project1.zip")
install.packages("sqldf")
library(sqldf)
mySql <- "Select * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myData <- read.csv.sql(filename,mySql,sep=";")
dateFr <- as.data.frame(paste(myData$Date,myData$Time), stringasFactors=FALSE)
newdateFr <- strptime(dateFr[,1],format="%d/%m/%Y %H:%M:%S")
finalData <- cbind(newdateFr, myData[3:9])
png("plot12.png",width=480,height=480)
hist(finalData$Global_active_power,col="Red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()

            