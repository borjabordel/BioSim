% Esta función pinta la evolución temporal de los sistemas de Van De Pol
% acoplados que representan los latidos
%
% Entradas:
% v1_0 : condición inicial para la primera coordenada del primer sistemas
% v2_0 : condición inicial para la segunda coordenada del primer sistema
% v3_0 : condición inicial para la primera coordenada del segundo sistema
% v4_0 : condición inicial para la segunda coordenada del segundo sistema
% T : instante máximo hasta el que se quiere representar
% k, w1, w2, a, f, b1, b2, c : Parámetros del sistema
%
% Caos en circuitos electrónicos
% Borja Bordel Sánchez

function [] = PintaEvolucionTemporal(k, w1, w2, a, f, b1, b2, c1, c2, v1_0, v2_0, v3_0, v4_0, T)

% Integramos el sistema
[v1, v2, v3, v4, tiempo] = IntegraLatido(k, w1, w2, a, f, b1, b2, c1, c2, v1_0, v2_0, v3_0, v4_0, T);

%Eliminamos transitorio
v1 = v1 (500:end);
v2 = v2 (500:end);
v3 = v3 (500:end);
v4 = v4(500:end);
tiempo = tiempo(500:end);

% Pintamos en el tiempo
figure;

subplot(1,2,1);
plot(tiempo, v1, tiempo, v3);
xlabel('Tiempo (s)');
ylabel('Amplitud (v)');
legend('x1', 'x3');
title('Evolución de las señales x1 y x3 en el tiempo');

subplot(1,2,2);
plot(tiempo,v2, tiempo,v4);
xlabel('Tiempo (s)');
ylabel('Amplitud (v)');
legend('x2', 'x4');
title('Evolución de las señales x2 y x4 en el tiempo');




