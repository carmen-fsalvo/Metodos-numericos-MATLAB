clear all
close all
clc

% T4. Pg 9. calcular la trayectoria del conejo, que se mueve por saltos
% hacia delante, atrás izq o dcha.La trayectoria comienza desde el (0,0)y
% realiza 1000 saltos.
posrabbit=[0,0];
% las probabilidades de cada dirección de saltos no son las mismas:
 pr=0.3;  %(probability of right jump)
 pl=0.4;   %(p of left jump)
 pu=0.1;   %(p of up jump)
 pd=0.2;   %(p of down jump)

% las distancias que recorre en cada salto:
 dr=5;    %(distance of right jump in cm)
 dl=-4;    
 du=20;
 dd=-10;
 
 % para calcular la direccion de cada salto se calcula: eligo un numero
 % random r y veo en que intervalo de entre las probabilidades está contenido.
 
 for % for-loop para sumar los resultados del siguiente loop
     
 for r(i)=1:1000-------> NO ESTOY SEGURA %
 
 r=rand(1)
 
 if 0<=r<=pu
     
     posrabbit=[0,du]
     
 else if pu<=r<=(pu+pd)
         
         posrabbit=[0,dd]
         
     else if (pu+pd)<=r<=(pu+pd+pr)
             
          posrabbit=[dr,0]
             
         else  
             
             posrabbit=[dl,0]
             
         end
         
     end
     
 end
 
 posrabbit=posrabbit+
 
 %% ejercicio del profe
 
 % probabilidades de movimiento:
 
 p=[0.1,0.2, 0.3, 0.4];
 
 d=[20];
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 