# -*- coding: utf-8 -*-
"""
@author: Yue Wang
Simulation file 3 for the paper "Inference on autoregulation in gene 
expression with variance-to-mean ratio", arXiv 2201.03164
"""

import numpy as np
from scipy.stats import gamma

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


#n=100 # sample size
#n=1000
n=10000
ci=gamma.ppf([0.025,0.975],a=(n-1)/2,loc=0,scale=2/(n-1)) # confidence interval
m=10000 # number of experiments
small=0 # number of vmr that are outside of ci (left)
medium=0 # number of vmr that are inside of ci
large=0 # number of vmr that are outside of ci (right)
for i in range(m): # calculate success rate
    sample=[]
    for j in range(n):
        if np.random.randint(2)==0:
            sample.append(np.random.poisson(1,1))
        else:
            sample.append(np.random.poisson(2,1))
    ratio=vmr(sample)
    if ratio<ci[0]:
        small+=1
    elif ratio<=ci[1]:
        medium+=1
    else:
        large+=1
print(small/m,medium/m,large/m)