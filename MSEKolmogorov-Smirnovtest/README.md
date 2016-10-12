
[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="880" alt="Visit QuantNet">](http://quantlet.de/index.php?p=info)

## [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **MSEKolmogorov-Smirnovtest** [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/d3/ia)

```yaml

Name of QuantLet : MSEKolmogorov-Smirnovtest

Published in : 'Modern Mathematical Statistics: Exercise and Solution'

Description : 'Performs a Kolmogorov-Smirnov test on the DAX log return data from 2009-12-21 to
2011-12-22'

Keywords : Kolmogorov-Smirnov test, testing, test, normal-distribution, normal, normality test

Author : Wolfgang Karl Haerdle, Vladimir Panov, Vladimir Spokoiny, Weining Wang

Submitted : Tue, November 13 2012 by Dedy Dwi Prastyo

Example : 'Performes a Kolmogorov-Smirnov normality test on DAX log returns from 2009-12-21 to
2011-12-22 based on 500 simulations of the standard normal distribution. Test results indicate
rejection of the normality hypothesis at 1 percent significance level'

```


### R Code:
```r
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

```
