% 
% Simulador de procesos naturales
% Borja Bordel
% Abril 2016
% Caos en circuitos electrónicos
% Borja Bordel Sánchez

function [y, x] = CantorBrusselator(a, b, m, w, v1_0, v2_0, v3_0, comp)
    
    % Integración
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
    
    % Cálculo y normalización
    [y, ~] = hist(var, 300);
    x = y/max(y);
    
    % Integración
    T = 14000;
    [v1,v2, v3, t] =  IntegraBrusselator(a, b, m, w, v1_0, v2_0, v3_0, T);
    
    % Selección de la componente
    switch comp
        case 1
            var = v1;
        case 2
            var = v2;
        case 3
            var = v3;
    end
    
    % Cálculo y normalización
    [y, ~] = hist(var, 300);
    y = y/max(y);
end