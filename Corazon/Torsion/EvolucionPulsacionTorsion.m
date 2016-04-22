%
% Función que calcula y pinta la evoluciónd el ratio de las frecuencias de
% torsión
%
% Entradas:
% k, w1, w2, a, f, b1, b2, c1, c2 : Parámetros del sistema
% ci : Condiciones iniciales
%
% Caos en circuitos electrónicos
% Borja Bordel Sánchez

function [] = EvolucionPulsacionTorsion (c1_, c2_, k_, w1_, w2_, a_, f_, b1_, b2_, ci, c_min, c_max, numPuntos)
    
    c = linspace(c_min, c_max, numPuntos);
    pulsacion1 = zeros(1, numPuntos);
    pulsacion2 = zeros(1, numPuntos);
    
    for i = 1:numPuntos
        if (isnan(c1_))
            [p1, p2] = PulsacionTorsion (k_, w1_, w2_, a_, f_, b1_, b2_, c(i), c2_, ci);
        else
            [p1, p2] = PulsacionTorsion (k_, w1_, w2_, a_, f_, b1_, b2_, c1_, c(i), ci);
        end        
        pulsacion1(i) = p1;
        pulsacion2(i) = p2;
    end
    
    figure;
    plot(c, pulsacion2./pulsacion1);
    title('Ratio entre las frecuencias de torsión');
    xlabel('Parámetro de acoplamiento');
    ylabel('Ratio');
end