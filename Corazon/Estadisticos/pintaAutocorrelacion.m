% 
% Simulador de procesos naturales
% Borja Bordel
% Abril 2016
%
% Función que representa la autocorrelación del sistema del latido del
% Corazón

function [] = pintaAutocorrelacion (k, w1, w2, a, f, b1, b2, c1, c2, v1_0, v2_0, v3_0, v4_0, comp)

    % Autocorrelación 
    figure;
    [corr] = autocorrelacionLatido (k, w1, w2, a, f, b1, b2, c1, c2, v1_0, v2_0, v3_0, v4_0, comp);
    plot(1:length(corr), corr);
    xlabel('tau');
    ylabel('Autocorrelación');
    title('Autocorrelación');
end