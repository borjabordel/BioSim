% 
% Simulador de procesos naturales
% Borja Bordel
% Abril 2016
%
% Caos en circuitos electrónicos
% Borja Bordel Sánchez

function [] = PintaBrusselatorForzado(a, b, m, w, v1_0, v2_0, v3_0, T, caso)

    % Integramos el sistema
    [x, y, z, tiempo] = IntegraBrusselator(a, b, m, w, v1_0, v2_0, v3_0, T);
    
    x = x(8000:end);
    y = y(8000:end);
    z = z(8000:end);
    
    figure;
    
    % Pintamos en el tiempo
    switch caso           
        case 4
            plot(x, y);
            xlabel('x');
            ylabel('y');
        case 5
            plot(x, z);
            xlabel('x');
            ylabel('z');
        case 6
            plot(y, z);
            xlabel('y');
            ylabel('z');
        case 7
            plot3(x, y, z);
            xlabel('x');
            ylabel('y');
            zlabel('z');
    end
    title('Espacio de las fases');
end

