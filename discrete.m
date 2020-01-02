%data retrieval and cleaning
trade= 0
pair= 'eurweek80';
ii= 1500; 
jj= 1499;
disc= 0.0263; 
lotsize= 10000;
trades= 600;

[num, txt] = xlsread(pair);  
dates= txt(3:end,1); 
dates= datestr(datenum(dates, 'dd.mm.yyyy'), 'yyyymmdd'); 
dates = str2double(cellstr(dates)); 

%sets dates, high and low and sorts them
high= iii;
low= jjj;

%derives variables for use
[length, ofprices]= size(high);
n= 1;
f= 0;
e= 0;
c= 0;
plong= zeros(1, 150);entry=0; fractal= 0; close= 0; 
ret= zeros(1,60); ret2= zeros(1,60);r=1;closerec= zeros(1,150);
entryrec= zeros(1,150);
%The trade   
n=1;
c=0;
count=0
for i= 3:1300
  j=i;
  i=i;
%set condition for fractal
%if high(i)< high(i-1) %&& high(i-1)>high(i-2) 
  fractal=  high(i-1);
 
  f=1;
%end
%initial close
%{
if low(i-1)<low(i) && low(i-1)< low(i-2)
    close= low(i-1);
    c=1;
end
%}
%set conditions for entry and calculating delta
if f==1 
 i= i+1
   if (i<ii)
       if high(i)> fractal
           entry(i)= fractal;
           delta= disc;
          % delta= abs(high(i) - low(i));%disc; % abs(close-entry);
           limit= entry(i) + (delta);
           stop= entry(i)-( delta);
           step= delta;
          %{
            if delta< 0.0075
               step= delta*2;
           end
           if delta> 0.0150
               step= delta/2;
           end
           %}
           f=0;
           
           for j= i+1 : jj
               if low(j)< stop
                   trade(n)=  -1*step;
                   break
               else if high(j)> limit
                       trade(n)= step;
                       break
                   end 
               end
           end 
            n= n+1;   
       end
       end 
   end
end
dischat= high-low;
dischat= mean(dischat(10:end));
trade= trade*lotsize;
   
discrete2
  
   

   