%
% Borja Bordel Sánchez
%
% Esta función pinta el diagrama de bifurcación del sistema Brusselator
%
%

function [] = BifurcacionBrusselator(param, min, max, n, v1_0,v2_0, v3_0, sennal)
    
    % Inicializamos variables
    j=1;
    T = 10000;
    Z1 = zeros(1,10^6);
    Z2 = zeros(1,10^6);
    
    % Recorremos el bucle de parÃ¡metro de control
    for p = linspace(max, min, n)
		if (isnan(param(1)))

			[v1,v2,v3, t] = IntegraBrusselator(p, param(2), param(3), param(4), v1_0, v2_0, v3_0, T);
            else if (isnan(param(2)))
                [v1,v2,v3, t] = IntegraBrusselator(param(1), p, param(3), param(4), v1_0, v2_0, v3_0, T);
                else if (isnan(param(3)))
                    [v1,v2,v3, t] = IntegraBrusselator(param(1), param(2), p, param(4), v1_0, v2_0, v3_0, T);
                    else
                        [v1,v2,v3, t] = IntegraBrusselator(param(1), param(2), param(3), p, v1_0, v2_0, v3_0, T);
                    end
            end
        end
        
		switch sennal
			case 1
				var = v1;  % Diagrama de bifurcación para v1
			case 2
				var = v2;  
			case 3
				var = v3;  
        end
        
        numPuntos = length(var);
        
        for i = 5000:numPuntos-1  %Eliminamos los primeros instantes por el transitorio
            if ((var(i)>var(i-1)) && (var(i)>=var(i+1))) 
                Z1(j)= p;
                Z2(j)=var(i);
                j=j+1;
            end
        end
        % Reevaluación de las condiciones iniciales
        v1_0 = var(numPuntos);
        v2_0 = v2(numPuntos);
        v3_0 = v3(numPuntos);
    end
    % Pintamos los resultados en forma de diagrama de bifurcacion
    figure;
    for h=1:j-1
        plot(Z1(h),Z2(h));
        hold on;
    end
    title('Diagrama de bifurcación Brusselator Forzado');
    xlabel('Parámetro control');
    ylabel('Amplitud máxima (V)');
end
