%
% Borja Bordel Sánchez
%
% Esta función pinta el espectro de Lyapunov del sistema Brusselator
%
%

function [] = EspectroLyapunovBrusselator(param, min, max, n, ci)

    exponentes = zeros(3, n);
    Vparam = linspace(max, min, n);    
     
    if (isnan(param(1)))
        for i =  1:n
            lambda = exponentesLyapunov (Vparam(i), param(2), param(3), param(4), ci);
            exponentes(:,i) = lambda;
        end
        else if (isnan(param(2)))
            for i =  1:n
                lambda = exponentesLyapunov (param(1), Vparam(i), param(3), param(4), ci);
                exponentes(:,i) = lambda;
            end
            else
            if (isnan(param(2)))
                for i =  1:n
                    lambda = exponentesLyapunov (param(1), param(2), Vparam(i), param(4), ci);
                    exponentes(:,i) = lambda;
                end
            else
                for i =  1:n
                    lambda = exponentesLyapunov (param(1), param(2), param(4), Vparam(i), ci);
                    exponentes(:,i) = lambda;
                end
            end
        end
    end
    
    figure;
    % Pintura
    plot(Vparam, exponentes(1, :), Vparam, exponentes(2,:), Vparam, exponentes(3,:), linspace(max, min, 100*n), 0);
    xlabel('Parámetro de control');
    ylabel('Valor del exponente');
    title('Exponentes de Lyapunov del sistema Brusselator');
        
end