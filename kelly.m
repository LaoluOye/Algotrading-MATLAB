j=20;
for n= 1:200
    yp(n)=sum(portfolio(j:j+5));
    j= j+5
end
yyp= yp;
hist(yyp,25)

Sharpe= sqrt(1)*mean(yyp)/ std(yyp)
%plot(cumsum(yyp))
