function [cumplong cumret]= trade(pair) 
%data retrieval and cleaning

[num, txt] = xlsread(pair);  
dates= txt(3:end,1); 
dates= datestr(datenum(dates, 'dd.mm.yyyy'), 'yyyymmdd'); 
dates = str2double(cellstr(dates)); 

%sets dates, high and low and sorts them
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
plong= zeros(1, 150);entry=0; fractal= 0; close= 0; 
ret= zeros(1,60); ret2= zeros(1,60);r=1;closerec= zeros(1,150);
entryrec= zeros(1,150);
%The trade
n=1;
c=0;
count=0
for i= 3:length
  j=i;
  i=i;
%set condition for fractal
if high(i)< high(i-1) && high(i-1)>high(i-2) 
  fractal=  high(i-1);
  hhigh= high(i-1);
  f=1;
end

if c==0
    close= low(i)
end
%set conditions for entry
if f==1 
 i= i+1
   if (i<1000)
       if high(i)> fractal
           entry= fractal;
           
           
           r= r+1;
           count=count+1
           f=0;
           e=1;
       end
   end
end
if e==1
    j= i+1;
    while(j<999)
    if low(j-1)<low(j) && low(j-1)< low(j-2)
    close= low(j-1);
    c=1;
    end
    if low(j+1)< close
        closerec(r)= close;
        entryrec(r)= entry;
        break
    else
    j= j+1;
    end
    end
end
for n= 3:150
    plong(n)= closerec(n-1)-entryrec(n);
    ret(n)= plong(n)/entryrec(n);  
end
end

plong= plong * 100;

cumret= cumprod(ret+1);
    cumplong= cumsum(plong);
    

 





   
    function [cumplong cumret]= trade(pair) 
%data retrieval and cleaning

[num, txt] = xlsread(pair);  
dates= txt(3:end,1); 
dates= datestr(datenum(dates, 'dd.mm.yyyy'), 'yyyymmdd'); 
dates = str2double(cellstr(dates)); 

%sets dates, high and low and sorts them
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
plong= zeros(1, 150);entry=0; fractal= 0; close= 0; 
ret= zeros(1,60); ret2= zeros(1,60);r=1;closerec= zeros(1,150);
entryrec= zeros(1,150);
%The trade
n=1;
c=0;
count=0
for i= 3:length
  j=i;
  i=i;
%set condition for fractal
if high(i)< high(i-1) && high(i-1)>high(i-2) 
  fractal=  high(i-1);
  hhigh= high(i-1);
  f=1;
end

if c==0
    close= low(i)
end
%set conditions for entry
if f==1 
 i= i+1
   if (i<1000)
       if high(i)> fractal
           entry= fractal;
           
           
           r= r+1;
           count=count+1
           f=0;
           e=1;
       end
   end
end
if e==1
    j= i+1;
    while(j<999)
    if low(j-1)<low(j) && low(j-1)< low(j-2)
    close= low(j-1);
    c=1;
    end
    if low(j+1)< close
        closerec(r)= close;
        entryrec(r)= entry;
        break
    else
    j= j+1;
    end
    end
end
for n= 3:150
    plong(n)= closerec(n-1)-entryrec(n);
    ret(n)= plong(n)/entryrec(n);  
end
end

plong= plong * 100;

cumret= cumprod(ret+1);
    cumplong= cumsum(plong);
    

 





   
    
      
        
        
    

      




   
      
          
      
      
      


      
        
        
    

      




   
      
          
      
      
      

