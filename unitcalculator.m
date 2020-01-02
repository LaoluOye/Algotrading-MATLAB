%Unit Calculator

%VARIABLE
AC= 99928.22;

%FIXED
leverage= 20; 
fraction= 0.02;
realfraction= 1.25* fraction;
profitlosspips= 142;
scalenumber= 107;

%CALCULATIONS
units= AC * fraction * scalenumber;
profitlosscash= AC * fraction;
tradesize= profitlosscash/ profitlosspips;

fprintf('\n\n number of units= %f \n size = %f lots \n profit/loss= %f\n\n',units,tradesize, profitlosscash );
