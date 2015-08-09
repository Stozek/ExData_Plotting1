plot3 = function() {
  ## Reading data, extracting what we need.
  file = "./house_power/household_power_consumption.txt"
  x = read.table(file, header = TRUE, sep = ";", colClasses = "character")
  X = subset(x, x[,1] == "1/2/2007" | x[,1] == "2/2/2007")
  
  ## Crating variable merging date and time, converting it.
  t = paste(X[,1], X[,2], sep = " ")
  t = strptime(t, "%d/%m/%Y %H:%M:%S")
  
  ## Creating sub metering variables.
  sm1 = as.numeric(X[, "Sub_metering_1"])
  sm2 = as.numeric(X[, "Sub_metering_2"])
  sm3 = as.numeric(X[, "Sub_metering_3"])
  
  ## Creating plot.
  par(bg = "transparent")
  plot(t, sm1, xlab = "", ylab = "Energy sub metering", main="", type = "l", cex.lab = 0.75, cex.axis = 0.75)
  lines(t, sm2, col = "Red", typ = "l")
  lines(t, sm3, col = "Blue", typ = "l")
  legend("topright", col = c("Black", "Red", "Blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, y.intersp = 0.5, cex = 0.6)
  
  dev.copy(png, "./ExData_Plotting1/plot3.png")
  dev.off()
  
}