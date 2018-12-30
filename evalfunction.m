function [Vaf,MSE,ED,MAE,MMRE, RMSE, r2]= evalfunction(y,ym);

n = length(y);
r = y-ym;

Vaf = vaf(y,ym);
MSE = sum(r.^2)/n;
RMSE = sqrt (MSE);
ED  = sqrt(sum(r.^2));
MAE  = sum(abs(r))/n;
for k=1:n
    error(k) = abs(y(k)-ym(k))/y(k);
end
MMRE = (1/n)*sum(error);

sprintf('Vaf= %0.5g, MSE= %0.5g, ED= %0.5g',Vaf,MSE,ED)
sprintf('MAE= %0.5g, MMRE= %0.5g, RMSE= %0.5g',MAE,MMRE, RMSE)

% sprintf('Vaf= %0.5g',Vaf)
% sprintf('MSE= %0.5g',MSE)
% sprintf('ED= %0.5g',ED)
% sprintf('MD= %0.5g',MD)       
% sprintf('MMRE= %0.5g',MMRE)       


p= polyfit(y,ym,1);
Ymeasure=y;
Ycalculate=ym; %(p(1)*y)+p(2); 
meanY=mean(Ymeasure);
deltaY2=sum((Ycalculate-Ymeasure).^2);
distanceY2=sum((Ymeasure-meanY).^2);
r2=1-(deltaY2/distanceY2)