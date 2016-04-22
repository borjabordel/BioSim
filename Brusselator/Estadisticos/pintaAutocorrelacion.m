% 
% Simulador de procesos naturales
% Borja Bordel
% Febrero 2016
%
% Función que representa la autocorrelación del sistema Brusselator

function [] = pintaAutocorrelacion (a, b, m, w, v1_0, v2_0, v3_0, comp)

    % Autocorrelación 
    figure;
    [corr] = autocorrelacionBrusselator (a, b, m, w, v1_0, v2_0, v3_0, comp);
    plot(1:length(corr), corr);
    xlabel('tau');
    ylabel('Autocorrelación');
    title('Autocorrelación');
end