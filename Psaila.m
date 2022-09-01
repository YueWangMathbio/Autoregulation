% Calculate the variance-to-mean ratio for genes BIM (column 5), 
% CCND1 (column 8), ECT2 (column 38), PFKP (column 72), TGFB2 (column 86). 
%Then calculate the sample size and confidence interval for each gene.

A=xlsread('Psaila.xlsx', 'Suppl. Table 3');


co=zeros(1,90);
vb=zeros(1,90);
for j=1:90
    clear temp
    c=0;
    
    for i=1:807
        if A(j,i)<40
            c=c+1;
            temp(c)=A(j,i);
        end
    end
    co(j)=c;
    if c<2
        vb(j)=999;
        continue;
    end
    temp=max(temp)-temp;
    temp=2.^temp;
    vb(j)=var(temp)/mean(temp);
    if vb(j)>998
        vb(j)=998;
    end
end
vmr=vb([5,8,38,72,86])
n=co([5,8,38,72,86])
for i=1:5
    ci=gaminv([.025,.975],(n(i)-1)./2,2./(n(i)-1))
end

