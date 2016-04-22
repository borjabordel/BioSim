% Esta función pinta el atractor de los sistemas de Van De Pol
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

function [] = PintaAtractor(k, w1, w2, a, f, b1, b2, c1, c2, v1_0, v2_0, v3_0, v4_0, T, caso)

% Integramos el sistema
[v1, v2, v3, v4, tiempo] = IntegraLatido(k, w1, w2, a, f, b1, b2, c1, c2, v1_0, v2_0, v3_0, v4_0, T);

%Eliminamos transitorio
v1 = v1 (500:end);
v2 = v2 (500:end);
v3 = v3 (500:end);
v4 = v4(500:end);

% Pintamos en el tiempo
figure;
    
    % Pintamos en el tiempo
    switch caso           
        case 1
            plot(v1, v2);
            xlabel('x1');
            ylabel('x2');
        case 2
            plot(v1, v3);
            xlabel('x1');
            ylabel('x3');
        case 3
            plot(v1, v4);
            xlabel('x1');
            ylabel('x4');
        case 4
            plot(v2, v3);
            xlabel('x2');
            ylabel('x3');
        case 5
            plot(v2, v4);
            xlabel('x2');
            ylabel('x4');
        case 6
            plot(v3, v4);
            xlabel('x3');
            ylabel('x4');
        case 7
            plot3(v1, v2, v3);
            xlabel('v1');
            ylabel('v2');
            zlabel('v3');
        case 8
            plot3(v1, v2, v4);
            xlabel('v1');
            ylabel('v2');
            zlabel('v4');
         case 9
            plot3(v1, v3, v4);
            xlabel('v1');
            ylabel('v3');
            zlabel('v4');
         case 10
            plot3(v2, v3, v4);
            xlabel('v2');
            ylabel('v3');
            zlabel('v4');
    end
    title('Espacio de las fases');




