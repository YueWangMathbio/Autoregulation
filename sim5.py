# -*- coding: utf-8 -*-
"""
@author: Yue Wang
Simulation file 5 for the paper "Inference on autoregulation in gene 
expression with variance-to-mean ratio", arXiv 2201.03164
"""

#import numpy as np
from scipy.stats import gamma
import random

def vmr(sample): # calculate the variance-to-mean ratio
    l=len(sample)
    moment1=0.0 # first moment
    moment1=sum(sample)/l
    moment2=0.0 # second moment
    for i in range(l):
        moment2+=sample[i]**2
    moment2=moment2/l
    ratio=moment2/moment1-moment1
    return ratio


# calculate the true variance-to-mean ratio
[k1,b1,c1]=[10.0,1.0,4.0] # parameters
[k2,b2,c2]=[10.0,1.0,5.0] # parameters
ex1=(k1/(c1-b1)+k2/(c2-b2))/2 # first moment
ex2=(k1*(c1+k1)/(c1-b1)/(c1-b1)+k2*(c2+k2)/(c2-b2)/(c2-b2))/2 # second moment
true_vmr=ex2/ex1-ex1
#print(true_vmr)

cdf1=[0]*11 # cdf of the stationary distribution
cdf1[0]=1
for i in range(1,11):
    cdf1[i]=cdf1[i-1]*(9+i)/i/4
for i in range(1,11):
    cdf1[i]=cdf1[i-1]+cdf1[i]
for i in range(11):
    cdf1[i]=cdf1[i]/cdf1[10]
    
cdf2=[0]*11 # cdf of the stationary distribution
cdf2[0]=1
for i in range(1,11):
    cdf2[i]=cdf2[i-1]*(9+i)/i/5
for i in range(1,11):
    cdf2[i]=cdf2[i-1]+cdf2[i]
for i in range(11):
    cdf2[i]=cdf2[i]/cdf2[10]

cdf=[0]*11
for i in range(11):
    cdf[i]=(cdf1[i]+cdf2[i])/2
 

def samp(n): # generate samples of size n from the cdf
    sample=[]
    for i in range(n):
        rand=random.uniform(0, 1)
        for j in range(11):
            if rand<=cdf[j]:
                sample.append(j)
                break
    return sample


#n=100 # sample size
#n=1000
n=10000
ci=gamma.ppf([0.025,0.975],a=(n-1)/2,loc=0,scale=2/(n-1)) # confidence interval
m=10000 # number of experiments
small=0 # number of vmr that are outside of ci (left)
medium=0 # number of vmr that are inside of ci
large=0 # number of vmr that are outside of ci (right)
for i in range(m): # calculate success rate
    sample=samp(n)
    ratio=vmr(sample)
    if ratio<ci[0]:
        small+=1
    elif ratio<=ci[1]:
        medium+=1
    else:
        large+=1
print(small/m,medium/m,large/m)