
%data retrieval and cleaning

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
ret= zeros(1,60); ret2= zeros(1,60);r=1;
entryrec= zeros(1,400);
closerec= zeros(1,400);

%The trade
n=1;
c=0;

for i= 4:length-2
  j=i;
  i=i;
%set condition for fractal
if low(i)> low(i-1)%&& low(i-2)> low(i-1)%&& low(i-3)> low(i-1) && low(i-1)<low(i+1) %&& low(i-1)<low(i-3) && low(i-1)<low(i-4)
  fractal= low(i-1);
  
  f=1;
end

%set conditions for entry
if f==1 
 count= i;
   if (i<ii)
       if low(i)< fractal
           
           entryrec(n)= fractal;
         
           for j= i+1 : jj
            
           %diff= abs(factor*(high(i)- low(i)));    
           if high(j)> fractal + factor
               closerec(n)= fractal + factor;%fractal + diff ;
               %closerec(n)= cls(i-1);
               break
           
           else if low(j)< fractal-factor
               closerec(n)= fractal- factor;%fractal- diff;
               %closerec(n)=cls(i-1);
               break
            end
           
           end
           
           
          
           e=1;
           n= n+1;
           
          
           f=0;
          
       end
   end
end

end
end

for n= 3:trades
    pshort(n)= -1 * (closerec(n)-entryrec(n)); 
end
for n= 3:trades
    rshort(n)= -1 * (closerec(n)-entryrec(n))/entryrec(n); 
end




pshort= pshort *lotsize ;


    

 



Fractaltrade3

   
    
      
        
        
    

      




   
      
          
      
      
      

