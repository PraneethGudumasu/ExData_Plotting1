plot3 <- function(){
  
  ### download and unzip the file required for assignment to the default working directory
  
  ## pipe and grep are used in the below line to select only the lines required
  
  data <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),sep = ";",na.strings = "?",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
  
  
  ## change the column names to meaningful names
  
  names(data) <- c("Date","Time","activep","reactivep","voltage","intensity","metering1","metering2","metering3")
  
  ## creating an additional variable to capture date and time
  
  
  DateTime <- strptime(paste(data$Date,data$Time,sep = ""),"%d/%m/%Y %H:%M:%S")
  
  ## bind the datetime variable to the data data frame
  
  data <- cbind(data,DateTime)
  
  ##generate the png for the plot
  
  dev.copy(png,file = "plot_3.png",width = 500,heigh = 500)
  plot(data$DateTime, data$metering1, type="l", ylab="Energy sub metering", xlab="")
  lines(data$DateTime, data$metering2, type="l", col="red")
  lines(data$DateTime, data$metering3, type="l", col="blue")
  legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
  dev.off()
  
  return
  
  
}