% 
% Simulador de procesos naturales
% Borja Bordel
% Febrero 2016
%
% Función que representa la autocorrelación del sistema de Van Der Pol

function [] = pintaAutocorrelacion (mu, A, omega, v1_0, v2_0, v3_0, comp)

    % Autocorrelación 
    figure;
    [corr] = autocorrelacionVanDerPol (mu, A, omega, v1_0, v2_0, v3_0, comp);
    plot(1:length(corr), corr);
    xlabel('tau');
    ylabel('Autocorrelación');
    title('Autocorrelación');

    % Autocorrelación por Fourier
    figure;
    [corr] = autocorrelacionVanDerPol_Fourier (mu, A, omega, v1_0, v2_0, v3_0, comp);
    plot(1:length(corr), corr);
    xlabel('tau');
    ylabel('Autocorrelación');
    title('Autocorrelación calculada a través de Fourier');

end