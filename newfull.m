
%data retrieval and cleaning
trade= 0;
Account= zeros(1,10000000);

Account(1)= 1;
pair= 'gbpweek80';
nperyear= 50;
lotsize= 10000;
ratio= 0.02;


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

disc=(high-low);
disc= disc(disc>0);
discmean= mean(disc);
disc= discmean*0.9;

%derives variables for use
[length, ofprices]= size(high);
%{
%for calculating mean returns
retu= ones(1,length);
for tt= 2: length   
    if high(tt)> high(tt-1)
    retu(tt)= ((high(tt)- low(tt)) / low(tt))+1;
    end
    
    if low(tt)< low(tt-1)
        retu(tt)= (high(tt)- low(tt))/ low(tt)+1;
    end
end
retu= retu(retu~=1);
retu= retu(retu~=1);
[w ww]= size(retu);
degree= nthroot(prod(retu), ww);
%}

ii= length; 
jj= length;
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
for i= 3:length
  j=i;
  i=i;
%set condition for fractal 
  fractal=  high(i-1);
  f=1;
%end

%set conditions for entry and calculating delta
if f==1 
 i= i+1
   if (i<ii)
       if high(i)> fractal
           entry(i)= fractal;
           %ubound= entry(i)*degree;
           %lbound= entry(i)/ degree;
           delta= disc;
           %limit= ubound; 
           %stop= lbound; 
           limit= entry(i) + (delta);
           stop= entry(i)-( delta);
           step= delta;
          
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



  

  j2=i;
  i2=i;
%set condition for fractal
  fractal2=  low(i2-1);
 
  f2=1;
%end

%set conditions for entry and calculatiing delta
if f2==1 
 i2= i2+1
   if (i2<ii)
       if low(i2)< fractal2
           entry(i2)= fractal2;
           %ubound2= entry(i2)*degree;
           %lbound2= entry(i2) /degree;
           delta2= disc;
           %limit2= lbound2 ; 
           %stop2= ubound2 ;
            limit2=  entry(i2) - (delta2);
            stop2= entry(i2) + (delta2);
            step2= delta2;
            
           f2=0;
  
           for j2= i2+1 : jj
               if high(j2)> stop2
                   trade(n)= -1* step2;
                   break
               else if low(j2)< limit2
                       trade(n)=step2;
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


newfull2; 



   