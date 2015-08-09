plot2 = function() {
  ## Reading data, extracting what we need
  file = "./house_power/household_power_consumption.txt"
  x = read.table(file, header = TRUE, sep = ";", colClasses = "character")
  X = subset(x, x[,1] == "1/2/2007" | x[,1] == "2/2/2007")
  
  ## Creating variable merging date and time, converting it.
  t = paste(X[,1], X[,2], sep = " ")
  t = strptime(t, "%d/%m/%Y %H:%M:%S")
  
  ## Getting explicit vector we need.
  y = as.numeric(X[,"Global_active_power"])
  
  ## Creating plot.
  par(bg = "transparent")
  plot(t, y, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", cex.lab = 0.75, cex.axis = 0.75)
  
  dev.copy(png, "./ExData_Plotting1/plot2.png")
  dev.off()
}
