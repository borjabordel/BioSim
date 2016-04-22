% 
% Simulador de procesos naturales
% Borja Bordel
% Febrero 2016
%
% Funci�n que representa la autocorrelaci�n del sistema de Van Der Pol

function [] = pintaAutocorrelacion (mu, A, omega, v1_0, v2_0, v3_0, comp)

    % Autocorrelaci�n 
    figure;
    [corr] = autocorrelacionVanDerPol (mu, A, omega, v1_0, v2_0, v3_0, comp);
    plot(1:length(corr), corr);
    xlabel('tau');
    ylabel('Autocorrelaci�n');
    title('Autocorrelaci�n');

    % Autocorrelaci�n por Fourier
    figure;
    [corr] = autocorrelacionVanDerPol_Fourier (mu, A, omega, v1_0, v2_0, v3_0, comp);
    plot(1:length(corr), corr);
    xlabel('tau');
    ylabel('Autocorrelaci�n');
    title('Autocorrelaci�n calculada a trav�s de Fourier');

end