# -*- coding: utf-8 -*-
"""
@author: Yue Wang
Simulation file 2 for the paper "Inference on autoregulation in gene 
expression with variance-to-mean ratio", arXiv 2201.03164
"""

from scipy.stats import gamma
import random
def vmr(sample): # calculate the variance=to-mean ratio
    l=len(sample)
    moment1=0.0 # first moment
    moment1=sum(sample)/l
    moment2=0.0 # second moment
    for i in range(l):
        moment2+=sample[i]**2
    moment2=moment2/l
    ratio=moment2/moment1-moment1
    return ratio



cdf=[0]*100 # cdf of the stationary distribution
for i in range(100):
    cdf[i]=1-2**(-1-i)

def samp(n): # generate samples of size n from the cdf
    sample=[]
    for i in range(n):
        rand=random.uniform(0, 1)
        for j in range(100):
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