% 
% Simulador de procesos naturales
% Borja Bordel
% Abril 2016
% Caos en circuitos electr�nicos
% Borja Bordel S�nchez

function [y, x] = CantorBrusselator(a, b, m, w, v1_0, v2_0, v3_0, comp)
    
    % Integraci�n
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
    
    % C�lculo y normalizaci�n
    [y, ~] = hist(var, 300);
    x = y/max(y);
    
    % Integraci�n
    T = 14000;
    [v1,v2, v3, t] =  IntegraBrusselator(a, b, m, w, v1_0, v2_0, v3_0, T);
    
    % Selecci�n de la componente
    switch comp
        case 1
            var = v1;
        case 2
            var = v2;
        case 3
            var = v3;
    end
    
    % C�lculo y normalizaci�n
    [y, ~] = hist(var, 300);
    y = y/max(y);
end