
%data retrieval and cleaning
trade= 0;
Account= zeros(1,10000000);

Account(1)= 1000;
%pair= 'aud80';
nperyear= 50;
lotsize= 10000;
ratio= 0.02;


%{
[num, txt] = xlsread(pair);  
dates= txt(3:end,1); 
dates= datestr(datenum(dates, 'dd.mm.yyyy'), 'yyyymmdd'); 
dates = str2double(cellstr(dates)); 


%sets dates, high2 and low2 and sorts them

high2= num(:,3);
low2= num (:,4);


[dates, sortindex] = sort(dates, 'ascend'); 
high2 = high2(sortindex); 
low2 = low2(sortindex);
%}
disc=(high2-low2);
disc= disc(disc>0);
discmean= mean(disc);
disc= discmean*0.9;

%derives variables for use
[length, ofprices]= size(high2);

retu= ones(1,numb);
for tt= 2: numb   
    if high2(tt)> high2(tt-1)
    retu(tt)= ((high2(tt)- low2(tt)) / low2(tt))+1;
    end
    
    if low2(tt)< low2(tt-1)
        retu(tt)= (high2(tt)- low2(tt))/ low2(tt)+1;
    end
end
retu= retu(retu~=1);
retu= retu(retu~=1);
[w ww]= size(retu);
degree= nthroot(prod(retu), ww);


ii= numb; 
jj= numb;
n= 1;
f= 0;
e= 0;
c= 0;
plong= zeros(1, 150);entry=0; fractal= 0; close= 0; 
ret= zeros(1,60); ret2= zeros(1,60);r=1;closerec= zeros(1,150);
entryrec= zeros(1,150);
%The trade 
trade(1)= 0;
n=2;
c=0;
count=0
for i= 3:numb
  j=i;
  i=i;
%set condition for fractal
%if high2(i)< high2(i-1) %&& high2(i-1)>high2(i-2) 
  fractal=  high2(i-1);
 
  f=1;
%end
%initial close
%{
if low2(i-1)<low2(i) && low2(i-1)< low2(i-2)
    close= low2(i-1);
    c=1;
end
%}
%set conditions for entry and calculating delta
if f==1 
 i= i+1
   if (i<ii)
       if high2(i)> fractal
           entry(i)= fractal;
           ubound= entry(i)*degree;
           lbound= entry(i)/ degree;
           delta= disc;
         %  delta= abs(high2(i) - low2(i));%disc; % abs(close-entry);
           %limit= ubound; 
           %stop= lbound; 
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
               if low2(j)< stop
                   trade(n)=  -1*step;
                   Account(n)= Account(n-1) .* (1- ratio);
                   break
               else if high2(j)> limit
                       trade(n)= step;
                       Account(n)= Account(n-1) .*(1+ ratio);
                       break
                   end 
               end
           end 
            n= n+1;   
       end
       end 
   end



  

  j2=i;
  i2=i;
%set condition for fractal
%if low2(i)> low2(i-1) %&& low2(i-1)<low2(i-2) 
  fractal2=  low2(i2-1);
 
  f2=1;
%end
%initial close
%{
if high2(i-1)>high2(i) && high2(i-1)> high2(i-2)
    close= high2(i-1);
    c=1;
end
%}
%set conditions for entry and calculatiing delta
if f2==1 
 i2= i2+1
   if (i2<ii)
       if low2(i2)< fractal2
           entry(i2)= fractal2;
           ubound2= entry(i2)*degree;
           lbound2= entry(i2) /degree;
           delta2= disc;
         %  delta2=abs(high2(i2) - low2(i2));% disc; % abs(close-entry);
           %limit2= lbound2 ; 
           %stop2= ubound2 ;
            limit2=  entry(i2) - (delta2);
            stop2= entry(i2) + (delta2);
            step2= delta2;
         %{
            if delta< 0.0075
               step= delta*2;
           end
           if delta> 0.0150
               step= delta/2;
           end
            %}
           f2=0;
  
           for j2= i2+1 : jj
               if high2(j2)> stop2
                   trade(n)= -1* step2;
                   Account(n)= Account(n-1) .* (1 - ratio);
                   break
               else if low2(j2)< limit2
                       trade(n)=step2;
                       Account(n)= Account(n-1) .* (1 + ratio);
                       break
                   end 
               end
           end
           n= n+1;
       end
       end 
end
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
           ubound= entry(i)*degree;
           lbound= entry(i)/ degree;
           delta= disc;
         %  delta= abs(high(i) - low(i));%disc; % abs(close-entry);
           %limit= ubound; 
           %stop= lbound; 
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
           
           for j= i+1 : numb
               if low(j)< stop
                   trade(n)=  -1*step;
                   Account(n)= Account(n-1) .* (1- ratio);
                   break
               else if high(j)> limit
                       trade(n)= step;
                       Account(n)= Account(n-1) .*(1+ ratio);
                       break
                   end 
               end
           end 
            n= n+1;   
       end
       end 
   end



  

  j2=i;
  i2=i;
%set condition for fractal
%if low(i)> low(i-1) %&& low(i-1)<low(i-2) 
  fractal2=  low(i2-1);
 
  f2=1;
%end
%initial close
%{
if high(i-1)>high(i) && high(i-1)> high(i-2)
    close= high(i-1);
    c=1;
end
%}
%set conditions for entry and calculatiing delta
if f2==1 
 i2= i2+1
   if (i2<ii)
       if low(i2)< fractal2
           entry(i2)= fractal2;
           ubound2= entry(i2)*degree;
           lbound2= entry(i2) /degree;
           delta2= disc;
         %  delta2=abs(high(i2) - low(i2));% disc; % abs(close-entry);
           %limit2= lbound2 ; 
           %stop2= ubound2 ;
            limit2=  entry(i2) - (delta2);
            stop2= entry(i2) + (delta2);
            step2= delta2;
         %{
            if delta< 0.0075
               step= delta*2;
           end
           if delta> 0.0150
               step= delta/2;
           end
            %}
           f2=0;
  
           for j2= i2+1 : numb
               if high(j2)> stop2
                   trade(n)= -1* step2;
                   Account(n)= Account(n-1) .* (1 - ratio);
                   break
               else if low(j2)< limit2
                       trade(n)=step2;
                       Account(n)= Account(n-1) .* (1 + ratio);
                       break
                   end 
               end
           end
           n= n+1;
       end
       end 
   end
end
trade= trade * lotsize;
   Account= Account(Account>0);

newfull2; 



   