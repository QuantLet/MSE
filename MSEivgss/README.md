
[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **MSEivgss** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet : MSEivgss

Published in : 'Modern Mathematical Statistics : Exercise and Solution'

Description : 'Performs a linear regression with data from The General Social Survey (GSS) using an
instrumental variable.'

Keywords : regression, linear-regression, estimation, variable, multivariate

Author : Wolfgang Karl Haerdle, Vladimir Panov, Vladimir Spokoiny, Weining Wang

Submitted : Sat, November 10 2012 by Dedy Dwi Prastyo

Datafile : 2010 GSS.sav

```


### R Code:
```r
# install.packages("foreign")
# install.packages("MASS")
# install.packages("matrixcalc")
# install.packages("sem")

rm(list=ls())

library(foreign)
library(MASS)
library(matrixcalc)
library(sem)

dataIV=read.spss("2010 GSS.sav",to.data.frame=T)
y=dataIV$logconrinc
x=dataIV$educ
w=dataIV$sibs

lm.sol=lm(y~x)
summary(lm.sol)
lm.educ=lm(x~w)
summary(lm.educ)
IV=tsls(y~x,instruments=~w)
summary(IV)

```
