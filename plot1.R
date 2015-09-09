plot1 <- function(){
  
  ### download and unzip the file required for assignment to the default working directory
  
  ## pipe and grep are used in the below line to select only the lines required
  
  data <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),sep = ";",na.strings = "?",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
  
  ## coercing the first and second fields to date format

  
  data <- transform(data,V1 = as.Date(V1,"%d/%m/%Y"))
  
  data <- transform(data,V2 = as.Date(V2,"%H:%M:%S"))
  
  ## change the column names to meaningful names
  
  names(data) <- c("Date","Time","activep","reactivep","voltage","intensity","metering1","metering2","metering3")
  
  ##setting the device to copy from screen to png
  
  dev.copy(png,file = "plot_1.png")
  
  ## generating the histogram
  
  hist(data$activep,col = "red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)")
  
  ## trun off the device configured
  
  dev.off()
  
  return
  
  
}