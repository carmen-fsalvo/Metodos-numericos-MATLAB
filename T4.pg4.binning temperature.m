clear all
close all
clc

%T4.pg4.binning the temp in Madrid and London.four bins(four seasons).
%(tengo que hacer hist a mano):
% > bin both the temperature in Madrid and London into the four seasons
% > plot the mean in each bin as a function of season
% > use the standard deviation of the values in each bin as error bars

% I need to number the seasons:1= spring,2=summer,3=autumn,4=winter.

% datos de Londres:
TL=[6.4 ,7.1, 10.1, 13.3, 16.9, 20.3, 21.8, 21.5, 18.5, 14.2, 10.1, 7.4];
meanL=mean(TL);
stdL=std(TL);
medianL=median(TL);

% datos de Madrid:

TM= [8.5, 11.0, 14.9, 18.4, 21.2, 26.9, 30.8, 29.5, 25.0, 18.5, 12.8, 8.8];
meanM=mean(TM);
stdM=std(TM);
medianM=median(TM);

% numerical distribution:


