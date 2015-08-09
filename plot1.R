plot1 = function() {
  ## Reading data.
  file = "./house_power/household_power_consumption.txt"
  x = read.table(file, header = TRUE, sep = ";", colClasses = "character")
  
  ## Extracting what we want and changing it to necessary form
  x[,1] = as.Date(x[,1], "%d/%m/%Y")
  X = subset(x, x[,1] == "2007-2-1" | x[,1] == "2007-2-2")
  
  ## Getting explicit vector we need.
  y = as.numeric(X[,"Global_active_power"])
  
  ## Creating histogram.
  par(bg = "transparent")
  hist(y, col = "Red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", cex.main = 0.75, cex.axis = 0.75, cex.lab = 0.75)
  
  dev.copy(png, "./ExData_Plotting1/plot1.png")
  dev.off()
}