% 
% Simulador de procesos naturales
% Borja Bordel
% Abril 2016
%
% Caos en circuitos electr�nicos
% Borja Bordel S�nchez

function [corr] = autocorrelacionBrusselator (a, b, m, w, v1_0, v2_0, v3_0, comp)
    
    % Integraci�n en el tiempo
    T = 10000;
    [v1,v2, v3, t] = IntegraBrusselator(a, b, m, w, v1_0, v2_0, v3_0, T);
    
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