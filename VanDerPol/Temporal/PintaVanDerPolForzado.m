% Borja Bordel Sánchez
%
% Esta función presenta en pantalla la respuesta temporal del oscilador de 
% Van Der Pol(superponiendo en una gráfica las 3 soluciones temporales)
%
% Entradas:
% x0 : condición inicial para la primera coordenada
% y0 : condición inicial para la segunda coordenada
% z0 : condición inicial para la tercera coordenada
% T : instante máximo hasta el que se quiere representar
% mu : Coeficiente de amortiguamiento
% A : Amplitud de la fuerza
% omega : Frecuencia de la fuerza
% caso: Caso de pintura que queremos realizar
%
% Caos en circuitos electrónicos
% Borja Bordel Sánchez

function [] = PintaVanDerPolForzado(mu, A, omega, x0, y0, z0, T, caso)

    % Integramos el sistema
    [x, y, z, tiempo] = IntegraVanDerPolForzado(mu, A, omega, x0, y0, z0, T);

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

