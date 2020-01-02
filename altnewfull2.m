
%data retrieval and cleaning
trade2= 0;

lotsize= 10000;
ratio= 0.02;

%derives variables for use
[length, ofprices]= size(high2);
disc= high2- low2;
disc= disc(disc>0);
discmean= mean(disc);
disc= discmean;

%{
 %for mean return
retu= ones(1,length);
for tt= 2: length   
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
trade2(1)= 0;
n=2;
c=0;
count=0;
for i= 3:length
  j=i;
  i=i;
%set condition for fractal
  fractal=  high2(i-1);
  f=1;
%end


%set conditions for entry and calculating delta
if f==1 
 i= i+1;
   if (i<numb)
       if spread(i)< spread(i-1)
       if high2(i)> fractal
           entry(i)= fractal;
           %ubound= entry(i)*degree;
           %lbound= entry(i)/ degree;
           delta= disc;
           limit= entry(i) + (delta);
           stop= entry(i)-( delta);
           step= delta;
        
           f=0;
           
           for j= i+1 : jj
               if low2(j)< stop
                   trade2(n)= -1* step;
                   break
               else if high2(j)> limit
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


  j2=i;
  i2=i;
%set condition for fractal

  fractal2=  low2(i2-1);
 
  f2=1;

%set conditions for entry and calculatiing delta
if f2==1 
 i2= i2+1
   if (i2<numb)
       if spread(i2) > spread(i2-1)
       if low2(i2)< fractal2
           entry(i2)= fractal2;
           %ubound2= entry(i2)*degree;
           %lbound2= entry(i2) /degree;
           delta2= disc;
         
            limit2=  entry(i2) - (delta2);
            stop2= entry(i2) + (delta2);
            step2= delta2;
         
           f2=0;
  
           for j2= i2+1 : jj
               if high2(j2)> stop2
                   trade2(n)= -1* step2;
                   break
               else if low2(j2)< limit2
                       trade2(n)=step2;
                       break
                   end 
               end
           end
           n= n+1;
       end
       end 
   end
end
end
length= numb; % for use in newfull2

trade2= trade2 * lotsize;

   trade= trade(1:numb/2.2);
   trade2= trade2(1:numb/2.2);
   trades(1:2:numb*0.909)= trade;
   trades(2:2:numb*0.909)= trade2;
   trade= trades;
   %trade= trade(1:2800) + trade2(1:2800);
newfull2



   