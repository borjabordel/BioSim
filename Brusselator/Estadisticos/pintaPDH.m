% 
% Simulador de procesos naturales
% Borja Bordel
% Abril 2016
%
% Función para calcular y pintar la PDH y su composición

function [] = pintaPDH (a, b, m, w, v1_0, v2_0, v3_0, comp)
    % PDH
    figure;
    [y, x] =  PDHBrusselator (a, b, m, w, v1_0, v2_0, v3_0, comp);
    plot(x,y,'-');
    title('PDH');
    xlabel('Tensión (V)');
    ylabel('Probabilidad');

    % Búsqueda del conjunto de Cantor
    figure;
    [y, x] = CantorBrusselator(a, b, m, w, v1_0, v2_0, v3_0, comp);
    plot(x, y, 'bo', 'MarkerSize', 1.5, 'MarkerFaceColor', 'b');
    title('PDH(t)-PDH(t+tau)');
    xlabel('PDH(t)');
    ylabel('PDH(t+tau)');
end