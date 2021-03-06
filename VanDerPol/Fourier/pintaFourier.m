% Borja Bordel S�nchez
%
%
% Caos en circuitos electr�nicos
% Borja Bordel S�nchez

function [] = pintaFourier (mu, A, omega, v1_0, v2_0, v3_0, comp, ventana, tipo)
    [TF, frecuencias] = FourierVanDerPol (mu, A, omega, v1_0, v2_0, v3_0, comp, ventana);
    
    figure;
    
    switch tipo
        case 1
            plot(frecuencias, abs(TF)/max(abs(TF)));
            title('Modulo transformada Fourier');
            xlabel('Frecuencia (Hz)');
            ylabel('Amplitud normalizada');
        case 2
            plot(frecuencias, 20*log10(abs(TF)/max(abs(TF))));
            title('Modulo transformada Fourier');
            xlabel('Frecuencia (Hz)');
            ylabel('Amplitud normalizada (dB)');
        case 3
            plot(frecuencias, TF.*conj(TF)/max(TF.*conj(TF)));
            title('Espectro de potencia');
            xlabel('Frecuencia (Hz)');
            ylabel('Potencia normalizada');
        case 4
            plot(frecuencias, 10*log10(TF.*conj(TF)/max(TF.*conj(TF))));
            title('Espectro de potencia');
            xlabel('Frecuencia (Hz)');
            ylabel('Potencia normalizada (dB)');
    end
end