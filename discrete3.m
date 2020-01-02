
totaltrade= trade(1:trades) +trade2(1:trades);

y= totaltrade;
cumtrade= cumsum(y);
handle= plot(cumtrade)
[a b]= size(y);
realreturn= totaltrade ./ (dischat*lotsize);
rr= realreturn;
dmax= cumtrade(trades)

sharperatio= (mean(y)/std(y))*sqrt(50)
Kelly= mean(rr)/(std(rr)^2)
[Drawdown duration] = Maxdd(cumtrade);