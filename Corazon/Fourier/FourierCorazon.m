% Borja Bordel S�nchez
%
% Funci�n que integra el sistema de Van Der Pol forzado en el periodo de tiempo indicado.
% Emplea el sistema normalizado definido en VanDerPolForzado (ver descripci�n)
%
% Entradas:
% v1_0 : condici�n inicial para la primera coordenada del primer sistemas
% v2_0 : condici�n inicial para la segunda coordenada del primer sistema
% v3_0 : condici�n inicial para la primera coordenada del segundo sistema
% v4_0 : condici�n inicial para la segunda coordenada del segundo sistema
% T : instante m�ximo hasta el que se quiere integrar en segundos
% k_, w1_, w2_, a_, f_, b1_, b2_, c : Par�metros del sistema
% ventana : Tipo de ventana que vamos a aplicar
% comp : componente de la que se desea calcular la FFT
%
% Salidas:
% TF : valores de la transformada de Fourier
% frecuencias : vector de frecuencias
%
% Caos en circuitos electr�nicos
% Borja Bordel S�nchez

function [TF, frecuencias] = FourierCorazon (k, w1, w2, a, f, b1, b2, c1, c2, v1_0, v2_0, v3_0, v4_0, comp, ventana)

    T = 1000;
    [v1,v2, v3, v4, t] = IntegraLatido(k, w1, w2, a, f, b1, b2, c1, c2, v1_0, v2_0, v3_0, v4_0, T);

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
         case 4
            var = v4;
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
