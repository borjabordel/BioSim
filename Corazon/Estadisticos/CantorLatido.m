%
% Función que calcula la comparación de la PDH en dos tiempos distintos
%
% Entradas:
% v1_0 : condición inicial para la primera coordenada del primer sistemas
% v2_0 : condición inicial para la segunda coordenada del primer sistema
% v3_0 : condición inicial para la primera coordenada del segundo sistema
% v4_0 : condición inicial para la segunda coordenada del segundo sistema
% T : instante máximo hasta el que se quiere integrar en segundos
% k_, w1_, w2_, a_, f_, b1_, b2_, c : Parámetros del sistema
% comp : Componente de la que calculamos la autocorrelación
%
% Salidas:
% corr : autocorrelación
%
% Caos en circuitos electrónicos
% Borja Bordel Sánchez

function [y, x] = CantorLatido (k, w1, w2, a, f, b1, b2, c1,c2, v1_0, v2_0, v3_0, v4_0, comp)
    
    % Integración
    T = 1000;
    [v1,v2, v3, v4, t] = IntegraLatido(k, w1, w2, a, f, b1, b2, c1, c2, v1_0, v2_0, v3_0, v4_0, T);
    
    % Selección de la componente
    switch comp
        case 1
            var = v1;
        case 2
            var = v2;
        case 3
            var = v3;
        case 4
            var = v4;
    end
    
    % Cálculo y normalización
    [y, ~] = hist(var, 300);
    x = y/max(y);
    
    % Integración
    T = 2400;
    [v1,v2, v3, t] =  IntegraLatido(k, w1, w2, a, f, b1, b2, c1, c2, v1_0, v2_0, v3_0, v4_0, T);
    
    % Selección de la componente
    switch comp
        case 1
            var = v1;
        case 2
            var = v2;
        case 3
            var = v3;
        case 4
            var = v4;
    end
    
    % Cálculo y normalización
    [y, ~] = hist(var, 300);
    y = y/max(y);
end