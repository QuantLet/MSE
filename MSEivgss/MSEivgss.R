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
