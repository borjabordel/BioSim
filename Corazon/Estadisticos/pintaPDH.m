% 
% Simulador de procesos naturales
% Borja Bordel
% Abril 2016
%
% Funci�n para calcular y pintar la PDH y su composici�n

function [] = pintaPDH (k, w1, w2, a, f, b1, b2, c1, c2, v1_0, v2_0, v3_0, v4_0, comp)
    % PDH
    figure;
    [y, x] = PDHLatido (k, w1, w2, a, f, b1, b2, c1, c2, v1_0, v2_0, v3_0, v4_0, comp);
    plot(x,y,'-');
    title('PDH');
    xlabel('Tensi�n (V)');
    ylabel('Probabilidad');

    % B�squeda del conjunto de Cantor
    figure;
    [y, x] = CantorLatido (k, w1, w2, a, f, b1, b2, c1, c2, v1_0, v2_0, v3_0, v4_0, comp);
    plot(x, y, 'bo', 'MarkerSize', 1.5, 'MarkerFaceColor', 'b');
    title('PDH(t)-PDH(t+tau)');
    xlabel('PDH(t)');
    ylabel('PDH(t+tau)');
end