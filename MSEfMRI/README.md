
[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **MSEfMRI** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet : MSEfMRI

Published in : 'Modern Mathematical Statistics : Exercises and Solutions'

Description : 'Estimates the risk aversion parameter based on the data given in the table and using
a logit model.'

Keywords : binomial, logit, model, regression, risk aversion, parameter

Author : Wolfgang Karl Haerdle, Vladimir Panov, Vladimir Spokoiny, Weining Wang

Submitted : Fri, May 03 2013 by Franziska Schulz

```


### R Code:
```r
y<-c(1, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, 0, 1, 0, 1, 0, 1)
x1<-c(11.74, 5.97, 8.88, 8.69, 5.83, 12.00, 5.62, 9.00, 11.92, 5.97, 11.74, 8.88, 8.69, 12.00, 5.83, 9.00, 11.92, 5.62, 5.97, 11.74, 8.88, 5.83, 12.00, 8.69, 11.92, 5.62, 9.00)
x2<-c(7.19, 1.93, 4.69, 8.63, 7.54, 1.14, 10.62, 1.21, 3.67, 1.93, 7.19, 4.69, 8.63, 1.49, 7.54, 1.21, 3.67, 10.62, 1.93, 7.19, 4.69, 7.54, 1.14, 8.63, 3.67, 10.62, 1.21)
x1<-x1-5
glm(y ~ 0+ x2, offset = x1, family = binomial(link = "logit"))
```
