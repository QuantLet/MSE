# Close windows and clear variables
rm(list = ls(all = TRUE))
graphics.off()

# install/load packages
libraries = c("truncgof", "foreign")
lapply(libraries, function(x) if (!(x %in% installed.packages())) {
    install.packages(x)
})
lapply(libraries, library, quietly = TRUE, character.only = TRUE)

DAX = read.csv("data_DAX091222-111222.csv")
dax1 = DAX[2:(length(DAX[, 7]) - 1), 7]
dax2 = DAX[3:length(DAX[, 7]), 7]
z = log(dax1) - log(dax2)  # log returns

ks.test(z, "pnorm", list(mean = 0, sd = 1), H = NA, sim = 500, tol = 1e-05, estfun = NA) 
