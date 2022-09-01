% Calculate the variance-to-mean ratio for genes EIF2B1 (column 5), 
% HOXD8 (column 21), POLR2A (column 37). Then calculate the sample
% size and confidence interval for each gene.

A=xlsread('Moignard.xlsx', 'dCt_values.txt');
%size(A)


vb=zeros(1,46);
co=zeros(1,46);
for j=1:46
    clear temp
    c=0;
    
    for i=1:3934
        if A(i,j)>-14
            c=c+1;
            temp(c)=A(i,j);
        end
    end
    co(j)=c;
    if c<2
        vb(j)=999;
        continue;
    end
    temp=temp-min(temp);
    temp=2.^temp;
    vb(j)=var(temp)/mean(temp);
    if vb(j)>998
        vb(j)=998;
    end
end
vmr=vb([5 21 37])
n=co([5 21 37])
for i=1:3
    ci=gaminv([.025,.975],(n(i)-1)./2,2./(n(i)-1))
end
