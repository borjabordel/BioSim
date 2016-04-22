%
% Esta funci�n pinta el mapa de retorno del sistema de Van Der Pol
% acoplados que representan el latido
%
% ENTRADAS
%
% v1_0 : condici�n inicial para la primera coordenada del primer sistemas
% v2_0 : condici�n inicial para la segunda coordenada del primer sistema
% v3_0 : condici�n inicial para la primera coordenada del segundo sistema
% v4_0 : condici�n inicial para la segunda coordenada del segundo sistema
% T : instante m�ximo hasta el que se quiere integrar en segundos
% k_, w1_, w2_, a_, f_, b1_, b2_, c1_, c2_ : Par�metros del sistema
%

function [] = RetornoLatido(k, w1, w2, a, f, b1, b2, c1, c2, v1_0, v2_0, v3_0, v4_0, comp)
       
    % Inicializamos variables
    j=1;
    T = 10000;
    Z1 = zeros(1,10^6);
    
    % Integramos el sistema de Chua
    [v1,v2,v3, v4, t] = IntegraLatido(k, w1, w2, a, f, b1, b2, c1, c2, v1_0, v2_0, v3_0, v4_0, T);
    
    % Elecci�n de la componente de la que deseamos calcular el mapa
    switch comp
        case 1
            var = v1; % Mapa para v1
        case 2
            var = v2; % Mapa para v2
        case 3
            var = v3; % Mapa para v3
        case 4
            var = v4; % Mapa para v4
    end
    
    %Veamos cuantos puntos ha ddevuelto la integraci�n
    numPuntos = length(var);
    
    % B�squeda de los m�ximos
    for i = 5000:numPuntos-1  %Eliminamos los primeros instantes por el transitorio
        if ((var(i)>var(i-1)) && (var(i)>=var(i+1))) 
            Z1(j)=var(i);
            j=j+1;
        end
    end       
    
    % Pintamos los resultados en forma de mapa de retorno
    fig = figure;
    for h=1:j-2
        plot(Z1(h),Z1(h+1));
        hold on;
    end
    %Etiquetamos la gr�fica
    title('Mapa de retorno');
    xlabel('M�ximo n-�simo');
    ylabel('M�ximo (n+1)-�esimo');
end