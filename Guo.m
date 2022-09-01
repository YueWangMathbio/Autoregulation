% Calculate the variance-to-mean ratio for genes BMP4 (column 5), 
% CREB312 (column 7), FN1 (column 15), HNF4A (column 23), 
% TCFAP2C (column 45) for three stages. Then calculate the 
% confidence interval for each stage.

A=xlsread("Guo.xls");

B=A(284:442,1:48);
vb=zeros(1,48);
for j=1:48
    clear temp
    c=0;
    for i=1:159
        if B(i,j)<28
            c=c+1;
            temp(c)=B(i,j);
        end
    end
    temp=max(temp)-temp;
    temp=2.^temp;
    vb(j)=var(temp)/mean(temp);
    if vb(j)>999
        vb(j)=999;
    end
end
vmr=vb([5 7 15 23 45])

n=159;
ci=gaminv([.025,.975],(n-1)/2,2/(n-1))

C=A(171:283,1:48);
vc=zeros(1,48);
for j=1:48
    clear temp
    c=0;
    for i=1:113
        if C(i,j)<28
            c=c+1;
            temp(c)=C(i,j);
        end
    end
    temp=max(temp)-temp;
    temp=2.^temp;
    vc(j)=var(temp)/mean(temp);
    if vc(j)>999
        vc(j)=999;
    end
end
vmr=vc([5 7 15 23 45])

n=113;
ci=gaminv([.025,.975],(n-1)/2,2/(n-1))

D=A(96:170,1:48);
vd=zeros(1,48);
for j=1:48
    clear temp
    c=0;
    for i=1:75
        if D(i,j)<28
            c=c+1;
            temp(c)=D(i,j);
        end
    end
    temp=max(temp)-temp;
    temp=2.^temp;
    vd(j)=var(temp)/mean(temp);
    if vd(j)>999
        vd(j)=999;
    end
end
vmr=vd([5 7 15 23 45])

n=75;
ci=gaminv([.025,.975],(n-1)/2,2/(n-1))

