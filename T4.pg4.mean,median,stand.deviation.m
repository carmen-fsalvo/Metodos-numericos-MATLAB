clear all
close all
clc

%calculate the mean, standard deviation and median of temp of Madrid.pg 4.
% compare it to the temp of London.

TM= [8.5, 11.0, 14.9, 18.4, 21.2, 26.9, 30.8, 29.5, 25.0, 18.5, 12.8, 8.8];

%mean:
meanM=sum(TM)/length(TM);

%standard deviation:

for i=1:length(TM)
    sum=sum((TM(i)-meanM).^2);
end
standM=sqrt(sum./(length(TM)-1));

%median:
sortedM=sort(TM);
if rem(length(TM),2)>0
medianM=TM(floor(lenght/2)+1);%%%%%%
else 
    medianM=(TM(length/2)+TM(length/2+1))./2;
