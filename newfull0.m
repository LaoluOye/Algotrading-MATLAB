xx= 1;
for x= 0.01:0.005:0.15
    %newfull
    spreadtrader;
    
temp(xx)= Drawdowna;
tempo(xx)= dyearlyprofita;
tempa(xx)= durationa;
xx= xx+1;
end

xxx=  0.01:0.005:0.15;
figure(1)
plot(xxx,tempo)
hold on
grid on
figure(2)
plot(xxx, tempa)
grid on
hold on
figure(3)
plot(xxx,temp)
grid on
hold on
figure(4)
plot(xxx,tempo./temp);
hold on
grid on
