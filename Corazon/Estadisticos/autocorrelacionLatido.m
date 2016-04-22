%
% Función que calcula la autocorrelación de la solución 
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

function [corr] = autocorrelacionLatido (k, w1, w2, a, f, b1, b2, c1, c2, v1_0, v2_0, v3_0, v4_0, comp)
    
    % Integración en el tiempo
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
    
    % Inicialización
    corr = zeros(length(var), 1);
    
    % Cálculo de la correlación
    for i = 1:length(var)
        for j = 1:length(var)-i
            corr(i) = corr(i) + var(j)*var(j+i);
        end
    end
    
    % Normalizamos
    corr = corr/max(corr);
end