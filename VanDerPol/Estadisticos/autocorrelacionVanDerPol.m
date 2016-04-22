% Borja Bordel S�nchez
%
% Funci�n que calcula la autocorrelaci�n de la soluci�n al sistema de
% Van Der Pol
%
% Entradas:
% v1_0 : condici�n inicial para la primera coordenada
% v2_0 : condici�n inicial para la segunda coordenada
% v3_0 : condici�n inicial para la tercera coordenada
% mu : Amortiguamiento 
% A : Amplitud de la fuerza
% omega : Frecuencia de la fuerza
% comp : Componente de la que calculamos la autocorrelaci�n
%
% Salidas:
% corr : autocorrelaci�n
%
% Caos en circuitos electr�nicos
% Borja Bordel S�nchez

function [corr] = autocorrelacionVanDerPol (mu, A, omega, v1_0, v2_0, v3_0, comp)
    
    % Integraci�n en el tiempo
    T = 1000;
    [v1,v2, v3, t] = IntegraVanDerPolForzado(mu, A, omega, v1_0, v2_0, v3_0, T);
    
    % Selecci�n de la componente
    switch comp
        case 1
            var = v1;
        case 2
            var = v2;
        case 3
            var = v3;
    end
    
    % Inicializaci�n
    corr = zeros(length(var), 1);
    
    % C�lculo de la correlaci�n
    for i = 1:length(var)
        for j = 1:length(var)-i
            corr(i) = corr(i) + var(j)*var(j+i);
        end
    end
    
    % Normalizamos
    corr = corr/max(corr);
end