% 
% Simulador de procesos naturales
% Borja Bordel
% Abril 2016
%
% Caos en circuitos electr�nicos
% Borja Bordel S�nchez

function [TF, frecuencias] = FourierBrusselator (a, b, m, w, v1_0, v2_0, v3_0, comp, ventana)

    T = 10000;
    [v1,v2, v3, t] = IntegraBrusselator(a, b, m, w, v1_0, v2_0, v3_0, T);

    % Estiamci�n de la frecuencia de muestreo
    fmuestreo = length(t)/T;  
    
    % Puntos de c�lculo de la FFT
    NFFT = 2^20;
    L = length(t);
    
    % Elecci�n de la componente de la que calculamos la FFT
    switch comp
        case 1
            var = v1;
        case 2
            var = v2;
        case 3
            var = v3;
    end
    
    %Aplicaci�n de la ventana
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
    
    % C�luculo de la FFT y restricci�n al n�mero de muestras que componen
    % en realidad la transfroamda de Fourier. 
    Y = fft(var,NFFT)/L;
    frecuencias = fmuestreo/2*linspace(0,1,NFFT/2+1);
    TF = Y(1:NFFT/2+1);
end