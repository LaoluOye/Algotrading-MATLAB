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
%if low(i)> low(i-1) %&& low(i-1)<low(i-2) 
  fractal=  low(i-1);
 
  f=1;
%end
%initial close
%{
if high(i-1)>high(i) && high(i-1)> high(i-2)
    close= high(i-1);
    c=1;
end
%}
%set conditions for entry and calculatiing delta
if f==1 
 i= i+1
   if (i<ii)
       if low(i)< fractal
           entry(i)= fractal;
           delta= disc;
         %  delta=abs(high(i) - low(i));% disc; % abs(close-entry);
           limit= entry(i) - (delta);
           stop= entry(i) + (delta);
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
               if high(j)> stop
                   trade2(n)= -1* step;
                   break
               else if low(j)< limit
                       trade2(n)=step;
                       break
                   end 
               end
           end 
            n= n+1;   
       end
       end 
   end
end
trade2= trade2 * lotsize;
   

 discrete3 
   

   
   








   
    
      
        
        
    

      




   
      
          
      
      
      

