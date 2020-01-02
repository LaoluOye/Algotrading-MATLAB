

cumprofit= (((plong(3:trades)) + (pshort(3:trades))));

cumreturn= (1+rlong(3:trades)).*(1+rshort(3:trades));

totalprofit= cumsum((cumprofit));
totalreturn= cumprod(cumreturn+1)-1;

average= (mean(plong>0) + mean(pshort>0))/2
pnet = totalprofit(trades-10)
[drawdown, downtime] =Maxdd(totalprofit(50:trades-50))



figure(1);
plot(totalprofit(3:trades-10))

%{
figure(2);
plot(totalreturn(1:trades-10));
%}



srprofit= mean(cumprofit)/ std(cumprofit)*sqrt(75);
%srret= (mean(cumreturn)/ std(cumreturn))*sqrt(75)

