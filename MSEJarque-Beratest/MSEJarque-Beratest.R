# Close windows and clear variables
rm(list = ls(all = TRUE))
graphics.off()

# install/load packages
libraries = c("tseries", "foreign")
lapply(libraries, function(x) if (!(x %in% installed.packages())) {
    install.packages(x)
})
lapply(libraries, library, quietly = TRUE, character.only = TRUE)

DAX = read.csv("data_DAX091222-111222.csv")
dax1 = DAX[2:(length(DAX[, 7]) - 1), 7]
dax2 = DAX[3:length(DAX[, 7]), 7]
z = log(dax1) - log(dax2)  # log returns
z = (z - mean(z))/sd(z)  # standardisation

jarque.bera.test(z) 
