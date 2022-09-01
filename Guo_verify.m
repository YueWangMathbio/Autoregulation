% check if our inference results on the data set from Guo et al.
% is significantly better than a random guess, compared to
% the results by Sanchez-Castillo et al.
% they found 17 of 39 genes have ar
% in these 39 genes, we found 5 genes with ar, where 3 are in those 17


A=zeros(32,7);
for i=1:32
    %te=i;
    te=i+31;
    s=dec2base(te,2);
    for j=1:5
        A(i,j)=str2num(s(j+1));
    end

    A(i,6)=sum(A(i,1:5));
    
    a=17;
    n=22;
    to=39;
    p=1;
    for j=1:5
        if A(i,j)==1
            p=p*a/to;
            a=a-1;
        else
            p=p*n/to;
            n=n-1;
        end
        to=to-1;
    end
    A(i,7)=p;
end

pr=zeros(1,6);
for i=1:32
    if abs(A(i,6)-0)<0.1
        pr(1)=pr(1)+A(i,7);
    end
    if abs(A(i,6)-1)<0.1
        pr(2)=pr(2)+A(i,7);
    end
    if abs(A(i,6)-2)<0.1
        pr(3)=pr(3)+A(i,7);
    end
    if abs(A(i,6)-3)<0.1
        pr(4)=pr(4)+A(i,7);
    end
    if abs(A(i,6)-4)<0.1
        pr(5)=pr(5)+A(i,7);
    end
    if abs(A(i,6)-5)<0.1
        pr(6)=pr(6)+A(i,7);
    end
end
pr 
% the probability that a random guess correctly finds 0,1,2,3,4,5
% genes wiht autoregulation