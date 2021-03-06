plot3 <- function()
{
  ## Load data (I assume that the file "household_power_consumption.txt" is in working directory).
  myDataText <- read.table("household_power_consumption.txt", sep = ";")
  namesTitle <-  head(myDataText,1)
  
  ## Filter data by period 2007-02-01 and 2007-02-02
  initDate <- as.Date("2007-02-01")
  endDate  <- as.Date("2007-02-02")
  myDataText$V1 <- as.Date(myDataText$V1,format="%d/%m/%Y")
  filterDataText <- myDataText[myDataText$V1>=initDate & myDataText$V1<=endDate,]
  filterDataText <- filterDataText[-c(1),]
  
  ## Make a plotle
  png(filename = "plot3.png")
  plot(as.numeric(as.vector.factor((filterDataText$V7))), type = "l", ylab = "Energy sub metering", xlab = "", xaxt="n")
  lines(as.numeric(as.vector.factor((filterDataText$V8))), col="red")
  lines(as.numeric(as.vector.factor((filterDataText$V9))), col= "blue")
  axis(1, at=c(0, 1450, 2900) , labels=c("Thu", "Fri", "Sat"))
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "green"))
  dev.off()
}