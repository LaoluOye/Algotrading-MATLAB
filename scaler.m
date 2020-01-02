n=1;
for q= 1: 1000
    scaled(q)= 0.5*sum(trade(n:n+5));
    n=n+5;
end
    
for x=1: 1000
    scaledA(x)= Account(5*x);
end
    
