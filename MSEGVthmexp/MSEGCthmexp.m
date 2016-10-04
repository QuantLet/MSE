close all
clear
clc

disp('Please input number of draws n as') ;
disp(' ') ;
n  = input('[n]=');
y  = exprnd(1,n,1);            % Generate standard normal random numbers
y  = sort(y);
cdfplot(y)                     % Plot the empirical distribution function
hold on
f  = cdf('Exponential',y,1);   % Generate exponential cumulative distribution function

plot(y,f,'r','LineWidth',2.5)
legend('Empirical','Theoretical','Location','NW')
title('EDF and CFD')
xlabel('X')
ylabel('EDF(X), CDF(X)')
grid off

[g,y] = ecdf(y);
g     = g(2:(n+1));
[C,I] = max(abs(f-g))
hold off