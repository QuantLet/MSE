close all
clear
clc

disp('Please input number of draws n as') ;
disp(' ') ;
n = input('[n]=');

y = normrnd(0,1,n,1); %Generate standard normal random numbers
cdfplot(y)            %Plot the empirical distribution function

hold on

x = -3:0.1:3;
f = normcdf(x,0,1);   %Generate normal cumulative distribution function

plot(x,f,'r','LineWidth',2.5)
legend('Empirical','Theoretical','Location','NW')
title('EDF and CFD')
xlabel('X')
ylabel('EDF(X), CDF(X)')

hold off
