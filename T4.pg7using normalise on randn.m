clear all
close all
clc

%TEMA 4.pg7 using normalise on randn.

data=randn([1 100000]);
[N,x]=hist(data,50);
p= normalise(N,x);

bar(x,p)