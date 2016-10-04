# clear history
rm(list = ls(all = TRUE))
graphics.off()

# install/load packages
libraries = c("foreign", "stats")
lapply(libraries, function(x) if (!(x %in% installed.packages())) {
    install.packages(x)
})
lapply(libraries, library, quietly = TRUE, character.only = TRUE)

DAXall = read.csv("DAX20000101-20111231.csv")
time = seq(from = as.Date("2000-01-03"), to = as.Date("2011-12-27"), length.out = 626)
DAX = DAXall[1:626, 8]

plot(DAX ~ time, xlab = "Time", ylab = "DAX30 Weekly Return", type = "l", pch = 20, cex = 1, cex.axis = 1.2, cex.lab = 1.5, 
    lab = c(3, 3, 0), main = "", col = "blue4")

DAX1 = DAXall[2:209, 8]
DAX2 = DAXall[210:417, 8]
DAX3 = DAXall[418:626, 8]

var.test(DAX1, DAX2)
var.test(DAX2, DAX3)
var.test(DAX1, DAX3) 
