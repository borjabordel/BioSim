% 
% Simulador de procesos naturales
% Borja Bordel
% Abril 2016
%
% Función para pintar la evolución temporal del sistema forzado de
% Brusselator

function [] = PintaEvolucionTemporal(a, b, m, w, v1_0, v2_0, v3_0, T, caso)

    % Integramos el sistema
    [x, y, z, tiempo] = IntegraBrusselator(a, b,m, w, v1_0, v2_0, v3_0, T);

     x = x(8000:end);
     y = y(8000:end);
     z = z(8000:end);
     tiempo = tiempo(8000:end);

    % Pintamos en el tiempo
    figure;
    
    % Pintamos en el tiempo
    switch caso
        case 1
            plot(tiempo, x);
        case 2
            plot(tiempo, y);
        case 3
            plot(tiempo, z);
        case 4
            plot(tiempo, x, tiempo, y);
            legend('x','y');
        case 5
            plot(tiempo, x, tiempo, z);
            legend('x','theta');
        case 6
            plot(tiempo, y, tiempo, z);
            legend('y','theta');
        case 7
            plot(tiempo, x, tiempo, y, tiempo, z);
            legend('x','y','theta');
    end
    title('Señal temporal');
    xlabel('Tiempo');
    ylabel('Amplitud');
end