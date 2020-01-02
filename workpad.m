profitlong= zeros(1, 150);entry=0; fractal= 0; close= 0;e=0;f=0;n=1; 

   for i= 3:length

%set condition for fractal
if high(i)< high(i-1)& high(i-1) > high(i-2)
  fractal=  high(i-1);
  f=1;
  j=i;
%condition for entry
  if f==1
      j= j+ 1;
      if (j<1000)
      if high(j)> fractal
          entry = fractal;
          e= 1;
  %condition for close         
      if e==1
       k= j;
      while(k<900)
         k= k+ 1
          if low(k) > low(k-1)&& low(k-1)< low(k-2)
            close = low(k-1);
          end
          if low(k+2)< close
            profitlong(n)= (close - entry)* 100;
            ret2(n)= (close- entry)/entry;
            n= n+1
            break
          end
      end
      end
      end
  end
end
end
   end       


   cumprofitshort= cumsum(profitshort);
   cumprofitlong= cumsum(profitlong);
 %  z= cumprofitshort+cumprofitlong;
  
   cumret= cumprod(1+ret)
   cumret2= cumprod(1+ret2)
   
   %plot(z);
  
   %figure(2) ;
   %plot((cumret + cumret2)-1);

 