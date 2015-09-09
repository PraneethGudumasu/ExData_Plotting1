plot2 <- function(){
  
  ### download and unzip the file required for assignment to the default working directory
  
  ## pipe and grep are used in the below line to select only the lines required
  
  data <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),sep = ";",na.strings = "?",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
  
  
  ## change the column names to meaningful names
  
  names(data) <- c("Date","Time","activep","reactivep","voltage","intensity","metering1","metering2","metering3")
  
  ## creating an additional variable to capture date and time
  
  
  DateTime <- strptime(paste(data$Date,data$Time,sep = ""),"%d/%m/%Y %H:%M:%S")
  
  active <- (data$activep)
  
  ##generate the png for the plot
  
  dev.copy(png,file = "plot_2.png")
  
  plot(DateTime, active, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  
  dev.off()
  
  return
  
  
}