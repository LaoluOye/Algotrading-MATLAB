a=0;
pair= 'audweek80';
nperyear= 50;
[num, txt] = xlsread(pair);  
dates= txt(3:end,1); 
dates= datestr(datenum(dates, 'dd.mm.yyyy'), 'yyyymmdd'); 
dates = str2double(cellstr(dates)); 

%sets dates, high and low and sorts them

high= num(:,3);
low= num (:,4);

[dates, sortindex] = sort(dates, 'ascend'); 
high = high(sortindex); 
low = low(sortindex);

pair2= 'chfweek80';

[num, txt] = xlsread(pair2);  
dates= txt(3:end,1); 
dates= datestr(datenum(dates, 'dd.mm.yyyy'), 'yyyymmdd'); 
dates = str2double(cellstr(dates)); 

%sets dates, high and low and sorts them

high2= num(:,3);
low2= num (:,4);


[dates, sortindex] = sort(dates, 'ascend'); 
high2 = high2(sortindex); 
low2 = low2(sortindex);

yy= high;
zz= low;

yy2= high2;
zz2= low2;

yy= yy(yy>0);
zz= zz(zz>0);

yy2= yy2(yy2>0);
zz2= zz2(zz2>0);

numb= 999;% use numb-1 or numb +1 when error message shows



corr= corrcoef(yy(1:numb),yy2(1:numb));
%plot(yy(1:numb),yy2(1: numb),'o');

spread = (yy(1:numb))- yy2(1:numb); % the twenty here is just a shift to avoid negative nos


%plot(spread);

%plot(spread2);

%dual
altnewfull
