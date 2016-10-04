
[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="880" alt="Visit QuantNet">](http://quantlet.de/index.php?p=info)

## [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **MSEJarque-Beratest** [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/d3/ia)

```yaml

Name of QuantLet : MSEJarque-Beratest

Published in : 'Modern Mathematical Statistics: Exercise and Solution'

Description : 'Performs a Jarque-Bera test on the DAX log return data from 2009-12-21 to 2011-12-22
based on skewness and kurtosis'

Keywords : jarque-bera-test, Testing, test, normal-distribution, normal, normality test

Author : Shih-Kang Chao

Submitted : Tue, November 13 2012 by Dedy Dwi Prastyo

Example : 'Performes a Jarque-Bera normality test on DAX log return data from 2009-12-21 to
2011-12-22 based on skewness and kurtosis. Test results indicate rejection of the normality
hypothesis at any common significance level'

```


### R Code:
```r
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

```
