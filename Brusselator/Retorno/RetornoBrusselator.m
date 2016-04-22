% 
% Simulador de procesos naturales
% Borja Bordel
% Abril 2016

function [] = RetornoBrusselator(a, b, m, w, v1_0,v2_0, v3_0, comp)
       
    % Inicializamos variables
    j=1;
    T = 10000;
    Z1 = zeros(1,10^6);
    
    % Integramos el sistema de Chua
    [v1,v2,v3, t] =IntegraBrusselator(a, b, m, w, v1_0, v2_0, v3_0, T);
    
    % Elección de la componente de la que deseamos calcular el mapa
    switch comp
        case 1
            var = v1; % Mapa para v1
        case 2
            var = v2; % Mapa para v2
        case 3
            var = v3; % Mapa para v3
    end
    
    %Veamos cuantos puntos ha ddevuelto la integración
    numPuntos = length(var);
    
    % Búsqueda de los máximos
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
    %Etiquetamos la gráfica
    title(['Mapa de retorno para a = ', num2str(a), ' b = ', num2str(b), ' w = ', num2str(w)]);
    xlabel('Máximo n-ésimo');
    ylabel('Máximo (n+1)-íesimo');
end