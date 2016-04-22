% 
% Simulador de procesos naturales
% Borja Bordel
% Febrero 2016
%
% Funci�n para calcular y pintar la PDH y su composici�n

function [] = pintaPDH (mu, A, omega, v1_0, v2_0, v3_0, comp)
    % PDH
    figure;
    [y, x] = PDHVanDerPol (mu, A, omega, v1_0, v2_0, v3_0, comp);
    plot(x,y,'-');
    title('PDH');
    xlabel('Tensi�n (V)');
    ylabel('Probabilidad');

    % B�squeda del conjunto de Cantor
    figure;
    [y, x] = CantorVanDerPol (mu, A, omega, v1_0, v2_0, v3_0, comp);
    plot(x, y, 'bo', 'MarkerSize', 1.5, 'MarkerFaceColor', 'b');
    title('PDH(t)-PDH(t+tau)');
    xlabel('PDH(t)');
    ylabel('PDH(t+tau)');
end