%
% Borja Bordel Sánchez
%
% Esta función pinta el diagrama de bifurcación del sistema de Van Der Pol
% acoplados

function [] = BifurcacionCorazon(k, w1, w2, a, f, b1, b2, c1, c2, pMax, pMin, n, v1_0,v2_0, v3_0, v4_0, sennal)
      
    % Inicializamos variables
    j=1;
    T = 1000;
    Z1 = zeros(1,10^6);
    Z2 = zeros(1,10^6);
    
    % Recorremos el bucle de parámetro de control
    for c = linspace(pMax, pMin, n)
        if (isnan(c1))
            [v1,v2,v3, v4, t] = IntegraLatido(k, w1, w2, a, f, b1, b2, c, c2, v1_0, v2_0, v3_0, v4_0, T);
        else
            [v1,v2,v3, v4, t] = IntegraLatido(k, w1, w2, a, f, b1, b2, c1, c, v1_0, v2_0, v3_0, v4_0, T);
        end
        
        switch sennal
			case 1
				var = v1;  % Diagrama de bifurcación para v1
			case 2
				var = v2;  
			case 3
				var = v3;  
            case 4
				var = v4;  
        end
        
        numPuntos = length(var);
        for i = 5000:numPuntos-1  %Eliminamos los primeros instantes por el transitorio
            if ((var(i)>var(i-1)) && (var(i)>=var(i+1))) 
                Z1(j)= c;
                Z2(j)= var(i);
                j=j+1;
            end
        end
        % Reevaluación de las condiciones iniciales
        v1_0 = v1(numPuntos);
        v2_0 = v2(numPuntos);
        v3_0 = v3(numPuntos);
        v4_0 = v4(numPuntos);
    end
    
    % Pintamos los resultados en forma de diagrama de bifurcacion
    fig = figure;
    for h=1:j-1
        plot(Z1(h),Z2(h));
        hold on;
    end
    
    title('Diagrama de bifurcación del Latido');
    xlabel('Parámetro control');
    ylabel('Amplitud máxima (V)');
end
