
[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="880" alt="Visit QuantNet">](http://quantlet.de/index.php?p=info)

## [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **MSElinregvocab** [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/d3/ia)

```yaml

Name of QuantLet : MSElinregvocab

Published in : 'Modern Mathematical Statistics : Exercises and Solutions'

Description : 'Computes a linear regression in a model that explains the vocabulary score in a
grade by using the vocabulary scores of the two previous grades (vocabulary.rda).'

Keywords : regression, linear-regression, estimation, R-squared, F-statistic

Author : Shih-Kang Chao

Submitted : Fri, May 03 2013 by Franziska Schulz

Datafile : vocabulary.rda

```


### R Code:
```r
# clear variables, close windows
rm(list=ls(all=TRUE))
graphics.off()

load("vocabulary.rda")

names(vocabulary)=c("grade8","grade9","grade10","grade11","mean")

res1=lm(grade11~grade8+grade9+grade10,data=vocabulary)
res2=lm(grade11~grade9+grade10,data=vocabulary)

print(summary(res1))
print(summary(res2))

```
