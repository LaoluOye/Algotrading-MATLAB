
nyears= numb/nperyear;
y=trade;
cumtrade= cumsum(y);
% plot(cumtrade)

realreturn= trade ./ (disc*lotsize);
rr= realreturn;
dmax= cumtrade(end);
dyearlyprofit= dmax/(nyears);
sharperatio= (mean(y)/std(y))*sqrt(nperyear)
Kelly= mean(rr)/(std(rr)^2);
[daveragedd Drawdown duration dnoofdd] = Maxdd(cumtrade);


dbadrow= Drawdown/(disc*lotsize);
dexpddperiod= daveragedd/(disc*lotsize);



dOlaprofitratio= dyearlyprofit/Drawdown
dOlashareratio= 1/dbadrow
durationyears= duration/ nperyear;

Dprofitability= mean(trade>0)
%dubcorrelation= corr

a=nperyear+1;

for uu= 1: numb-nperyear*5
    yearly(uu)= mean(trade(a-nperyear:a)>0);
    a= a+1;
end
plot(yearly)



