retu= ones(1, length);
for tt= 2: length   

%{
if high(tt)> high(tt-1)
    retu(tt)= ((high(tt)- high(tt-1)) / high(tt-1))+1;
    end
    
    if low(tt)< low(tt-1)
        retu(tt)= (abs(low(tt)- low(tt-1)))/ low(tt-1)+1;
    end
end
    %}
    if high(tt)> high(tt-1)
    retu(tt)= ((high(tt)- low(tt)) / low(tt))+1;
    end
    
    if low(tt)< low(tt-1)
        retu(tt)= (high(tt)- low(tt))/ low(tt)+1;
    end
end
retu= retu(retu~=1);
[w ww]= size(retu);
nthroot(prod(retu), ww);
[l ll]= size(trade);

a=0;
for nn= 2: ll
if Account(nn)> Account(nn-1)
    a= a+1;
end
end
a= a/ll
    