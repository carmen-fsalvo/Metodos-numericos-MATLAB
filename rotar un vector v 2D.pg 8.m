clear all
close all
clc
%rotating a vector.PAG 8
v =[1;1];
M=[cos(pi),-sin(pi);sin(pi),cos(pi)];
vr=M*v
%demostrar q v y vr tienen el mismo módulo
norm(v)-norm(vr)==eps
%graficar v y vr con quiver
quiver(v,vr)
