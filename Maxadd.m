function [aveDD, maxDD, maxDDD, highest]= Maxadd(cumret)
% max dd = max ((peak/troph)of returns)
highwatermark= zeros(size(cumret));% to be used to set the high watermark as an array (of high cumulative points) per day
drawdown= zeros(size(cumret));% to be used to set an array of max drawdowns per day
drawdownduration= zeros(size(cumret));% to be used to set an array of drawdown durations
for t=2: length(cumret)
    highwatermark(t)= max(highwatermark(t-1), cumret(t));% make the value of cumret at day t = highwater mark if it is a new high 
    drawdown(t)= (highwatermark(t)- cumret(t))/highwatermark(t);% calculates the drawdown OF RETURNS each day 
    if (drawdown(t)==0)
        drawdownduration(t)= 0;
    else 
        drawdownduration(t) = drawdownduration(t-1) + 1 ;% adding a day to the drawdown duration each time the for loop the for loop is executed but resetting when a highwatermark is set and drawdon becomes 0
    end
   drawdown= drawdown(drawdown>0);
end

aveDD= mean(drawdown);
maxDD= max(drawdown);
maxDDD= max(drawdownduration);
highest= highwatermark(t);
end
    
    
    

