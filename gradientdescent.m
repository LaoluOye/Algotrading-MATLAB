n=1
m=1000
th= zeros(2,1)
for i= 1:10
    for k= 1:10
        th(1)=i;
        th(2)=k;
        [j, grad]= costfunction(th);
        if j<m
            m= j ;
            thet= [i k] ;
        end 
        [j, grad]= costfunction(thet);
       
    end
end
