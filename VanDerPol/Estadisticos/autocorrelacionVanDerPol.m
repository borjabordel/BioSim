% Borja Bordel Sánchez
%
% Función que calcula la autocorrelación de la solución al sistema de
% Van Der Pol
%
% Entradas:
% v1_0 : condición inicial para la primera coordenada
% v2_0 : condición inicial para la segunda coordenada
% v3_0 : condición inicial para la tercera coordenada
% mu : Amortiguamiento 
% A : Amplitud de la fuerza
% omega : Frecuencia de la fuerza
% comp : Componente de la que calculamos la autocorrelación
%
% Salidas:
% corr : autocorrelación
%
% Caos en circuitos electrónicos
% Borja Bordel Sánchez

function [corr] = autocorrelacionVanDerPol (mu, A, omega, v1_0, v2_0, v3_0, comp)
    
    % Integración en el tiempo
    T = 1000;
    [v1,v2, v3, t] = IntegraVanDerPolForzado(mu, A, omega, v1_0, v2_0, v3_0, T);
    
    % Selección de la componente
    switch comp
        case 1
            var = v1;
        case 2
            var = v2;
        case 3
            var = v3;
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