%data retrieval and cleaning
pair= 'aud80';
lotsize= 10000;
days= 6;
ii= 6000; 
jj= 5999;
trades= 400;

[num, txt] = xlsread(pair);  
dates= txt(3:end,1); 
dates= datestr(datenum(dates, 'dd.mm.yyyy'), 'yyyymmdd'); 
dates = str2double(cellstr(dates)); 

%sets dates, high and low and sorts them
cls= num(:, 5);
open= num(:, 2);
high= num(:, 3);
low= num (:, 4);
[dates, sortindex] = sort(dates, 'ascend'); 
high = high(sortindex); 
low = low(sortindex);

%derives variables for use
[length, ofprices]= size(high);
n= 1;
f= 0;
e= 0;
c= 0;
entry=0; fractal= 0; close= 0; 
ret= zeros(1,60); ret2= zeros(1,55);r=1;
entryrec= zeros(1,400);
closerec= zeros(1,400);

%The trade
n=1;
c=0;

for i= 4:length-2
  j=i;
  i=i;
%set condition for fractal
if  high(i)< high(i-1) && high(i-1)>high(i-2) && high(i-1)>high(i+1) && high(i-1)>high(i-3)  
  fractal= high(i-1);
 
  f=1;
end

%set conditions for entry
if f==1 
 count= i
   if (i<ii)
       if high(i)> fractal
           
           entryrec(n)= fractal;
           closerec(n)= cls(i+days);
           for j= i+1 : i+days
           if cls(j)< low(i)
               closerec(n)= low(i);
               break
           end
           end
           
          
              % daycount=0;
               %j=i+1;
               
                  % daycount= daycount +1;
                   % nodays(r)= daycount;
                  % if cls(j)> cls(i:j-1)
                   % maxday(r)= daycount;
                  % end
                  % j=j+1;
                   % if daycount== 14
                   %    break
                  % end
                  
               %end 
             r=r+1;
             
          
           e=1; 
           n= n+1;
           
          
           f=0;
          
       end
   end
end

    end

for n= 3:trades
    plong(n)= (closerec(n)-entryrec(n));    
end
for n= 3:trades
    rlong(n)= (closerec(n)-entryrec(n))/entryrec(n);    
end



plong= plong *lotsize;


    

 
Fractaltrade2




   
    
      
        
        
    

      




   
      
          
      
      
      

