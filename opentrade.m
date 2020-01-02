%data retrieval and cleaning
pair= 'eur99';
ii= 1000; 
jj= 999;
[num, txt] = xlsread(pair);  
dates= txt(3:end,1); 
dates= datestr(datenum(dates, 'dd.mm.yyyy'), 'yyyymmdd'); 
dates = str2double(cellstr(dates)); 

%sets dates, high and low and sorts them
cls= num(:, 5);
open= num(:, 4);
high= num(:, 2);
low= num (:, 3);
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
ret= zeros(1,60); ret2= zeros(1,60);r=1;
entryrec= zeros(1,400);
closerec= zeros(1,400);

%The trade
n=1;
c=0;

for i= 3:length
  j=i;
  i=i;
%set condition for fractal
%if high(i)< high(i-1) %&& high(i-1)>high(i-2) 
  fractal= high(i-1);
  f=1;
%end
%set conditions for entry
if f==1 
 count= i
   if (i<ii)
       if high(i)> fractal
           %if high(i+1)> open(i+1)+0.0002
           frac(i)= fractal;
           entry(i)= open(i+1)+0.0002; %fractal;
           close(i)= cls(i+1);
           him(r)=open(i+1);
           her(r)=cls(i+1);
           e=1;
           
           r= r+1;
           
           f=0;
           %end
       end
   end
end

    
  
end
plong= zeros(360);
    plong= close - entry    



for q= 3:150
ret(q)= plong(q)/entryrec(q); 
end



cumret= cumprod(ret+1);
    cumplong= cumsum(plong);
    

 





   
    
      
        
        
    

      




   
      
          
      
      
      

