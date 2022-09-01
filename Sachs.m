% For 14 different cell groups, calculate the variance-to-mean
% ratio for gene PIP3 (5th column of each table), its sample 
% size, and the confidence interval


A1=xlsread("Sachs1.xls");
var(A1(:,5))./mean(A1(:,5))
[n,m]=size(A1);
n
gaminv([.025,.975],(n-1)./2,2./(n-1))

A2=xlsread("Sachs2.xls");
var(A2(:,5))./mean(A2(:,5))
[n,m]=size(A2);
n
gaminv([.025,.975],(n-1)./2,2./(n-1))

A3=xlsread("Sachs3.xls");
var(A3(:,5))./mean(A3(:,5))
[n,m]=size(A3);
n
gaminv([.025,.975],(n-1)./2,2./(n-1))

A4=xlsread("Sachs4.xls");
var(A4(:,5))./mean(A4(:,5))
[n,m]=size(A4);
n
gaminv([.025,.975],(n-1)./2,2./(n-1))

A5=xlsread("Sachs5.xls");
var(A5(:,5))./mean(A5(:,5))
[n,m]=size(A5);
n
gaminv([.025,.975],(n-1)./2,2./(n-1))

A6=xlsread("Sachs6.xls");
var(A6(:,5))./mean(A6(:,5))
[n,m]=size(A6);
n
gaminv([.025,.975],(n-1)./2,2./(n-1))

A7=xlsread("Sachs7.xls");
var(A7(:,5))./mean(A7(:,5))
[n,m]=size(A7);
n
gaminv([.025,.975],(n-1)./2,2./(n-1))

A8=xlsread("Sachs8.xls");
var(A8(:,5))./mean(A8(:,5))
[n,m]=size(A8);
n
gaminv([.025,.975],(n-1)./2,2./(n-1))

A9=xlsread("Sachs9.xls");
var(A9(:,5))./mean(A9(:,5))
[n,m]=size(A9);
n
gaminv([.025,.975],(n-1)./2,2./(n-1))

A10=xlsread("Sachs10.xls");
var(A10(:,5))./mean(A10(:,5))
[n,m]=size(A10);
n
gaminv([.025,.975],(n-1)./2,2./(n-1))

A11=xlsread("Sachs11.xls");
var(A11(:,5))./mean(A11(:,5))
[n,m]=size(A11);
n
gaminv([.025,.975],(n-1)./2,2./(n-1))

A12=xlsread("Sachs12.xls");
var(A12(:,5))./mean(A12(:,5))
[n,m]=size(A12);
n
gaminv([.025,.975],(n-1)./2,2./(n-1))

A13=xlsread("Sachs13.xls");
var(A13(:,5))./mean(A13(:,5))
[n,m]=size(A13);
n
gaminv([.025,.975],(n-1)./2,2./(n-1))

A14=xlsread("Sachs14.xls");
var(A14(:,5))./mean(A14(:,5))
[n,m]=size(A14);
n
gaminv([.025,.975],(n-1)./2,2./(n-1))