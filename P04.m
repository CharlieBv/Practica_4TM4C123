%% P04

clear; close all; clc;

%% Parametros de vincuacion

s = serialport('COM3' ,57600, 'timeout', 1); %Comado para vincular el puerto serial

M = 10000; %Cantidad de muestras
i = 1;  %valor inicial de condicion
%% Grafica general
figure;
title('ADC');
xlabel('Muestras');
ylabel('Voltaje (V)');
grid on;
hold on;
ylim([0 10]);
xlim([0 100]);
%% Obtencion de datos
while i<= M %Mientras i sea menor a la cantidad de muestras
   if mod(i,100) == 0 %Si i modulo 25 es igual a '0'
       xlim([i i+100])  %Aumenta el rango de 'x' 100 mas
   end
   Cadena_1 = readline(s);
   Cadena_2 = readline(s);
   Cadena_3 = readline(s);
   Cadena_4 = readline(s);
   Cadena_5 = readline(s);
   Cadena_6 = readline(s);
   
   ADC_1 = str2double(Cadena_1);
   ADC_2 = str2double(Cadena_2);
   ADC_3 = str2double(Cadena_3);
   ADC_4 = str2double(Cadena_4);
   ADC_5 = str2double(Cadena_5);
   ADC_6 = str2double(Cadena_6);
   
   V_1(i) = (ADC_1*3.3)/4095;
   V_2(i) = (ADC_2*3.3)/4095;
   V_3(i) = (ADC_3*3.3)/4095;
   V_4(i) = (ADC_4*3.3)/4095;
   V_5(i) = (ADC_5*3.3)/4095;
   V_6(i) = (ADC_6*3.3)/4095;
   
   %% Grafica de resultados
   plot(V_1,'r');
   drawnow
   plot(V_2,'b');
   drawnow
   plot(V_3,'g');
   drawnow
   plot(V_4,'p');
   drawnow
   plot(V_5,'r');
   drawnow
   plot(V_6,'b');
   drawnow
end