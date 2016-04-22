% 
% Simulador de procesos naturales
% Borja Bordel
% Abril 2016
%
% Caos en circuitos electrónicos
% Borja Bordel Sánchez

function [corr] = autocorrelacionBrusselator (a, b, m, w, v1_0, v2_0, v3_0, comp)
    
    % Integración en el tiempo
    T = 10000;
    [v1,v2, v3, t] = IntegraBrusselator(a, b, m, w, v1_0, v2_0, v3_0, T);
    
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