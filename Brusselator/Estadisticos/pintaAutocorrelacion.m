% 
% Simulador de procesos naturales
% Borja Bordel
% Febrero 2016
%
% Funci�n que representa la autocorrelaci�n del sistema Brusselator

function [] = pintaAutocorrelacion (a, b, m, w, v1_0, v2_0, v3_0, comp)

    % Autocorrelaci�n 
    figure;
    [corr] = autocorrelacionBrusselator (a, b, m, w, v1_0, v2_0, v3_0, comp);
    plot(1:length(corr), corr);
    xlabel('tau');
    ylabel('Autocorrelaci�n');
    title('Autocorrelaci�n');
end