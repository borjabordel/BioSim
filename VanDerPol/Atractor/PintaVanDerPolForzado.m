% Borja Bordel S�nchez
%
% Esta funci�n presenta en pantalla la respuesta en el espacio de fases 
%
% Entradas:
% x0 : condici�n inicial para la primera coordenada
% y0 : condici�n inicial para la segunda coordenada
% z0 : condici�n inicial para la tercera coordenada
% T : instante m�ximo hasta el que se quiere representar
% mu : Coeficiente de amortiguamiento
% A : Amplitud de la fuerza
% omega : Frecuencia de la fuerza
% caso: Caso de pintura que queremos realizar
%
% Caos en circuitos electr�nicos
% Borja Bordel S�nchez

function [] = PintaVanDerPolForzado(mu, A, omega, x0, y0, z0, T, caso)

    % Integramos el sistema
    [x, y, z, tiempo] = IntegraVanDerPolForzado(mu, A, omega, x0, y0, z0, T);

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

