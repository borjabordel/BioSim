% Borja Bordel Sánchez
%
% Función que integra el sistema de Van Der Pol forzado en el periodo de tiempo indicado.
% Emplea el sistema normalizado definido en VanDerPolForzado (ver descripción)
%
% Entradas:
% v1_0 : condición inicial para la primera coordenada
% v2_0 : condición inicial para la segunda coordenada
% v3_0 : condición inicial para la tercera coordenada
% ventana : Tipo de ventana que vamos a aplicar
% mu : Amortiguamiento
% A : Amplitud
% omega : Pulsación
% comp : componente de la que se desea calcular la FFT
%
% Salidas:
% TF : valores de la transformada de Fourier
% frecuencias : vector de frecuencias
%
% Caos en circuitos electrónicos
% Borja Bordel Sánchez

function [TF, frecuencias] = FourierVanDerPol (mu, A, omega, v1_0, v2_0, v3_0, comp, ventana)

    T = 1000;
    [v1,v2, v3, t] = IntegraVanDerPolForzado(mu, A, omega, v1_0, v2_0, v3_0, T);

    % Estiamción de la frecuencia de muestreo
    fmuestreo = length(t)/T;  
    
    % Puntos de cálculo de la FFT
    NFFT = 2^20;
    L = length(t);
    
    % Elección de la componente de la que calculamos la FFT
    switch comp
        case 1
            var = v1;
        case 2
            var = v2;
        case 3
            var = v3;
    end
    
    %Aplicación de la ventana
    switch ventana
        case 'r'
            %Ya se rectangular
        case 'hm'
            var = hamming(length(var)).*var;
        case 'hn'
            var = hann(length(var)).*var;
        case 'b'
            var = bartlett(length(var)).*var;
    end
    
    % Cáluculo de la FFT y restricción al número de muestras que componen
    % en realidad la transfroamda de Fourier. 
    Y = fft(var,NFFT)/L;
    frecuencias = fmuestreo/2*linspace(0,1,NFFT/2+1);
    TF = Y(1:NFFT/2+1);
end
