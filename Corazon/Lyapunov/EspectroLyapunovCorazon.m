%
% Borja Bordel Sánchez
%
% Esta función pinta el espectro de Lyapunov del latido del corazón
% Abril 2016
%

function [] = EspectroLyapunovCorazon (param, min, max, n, ci)
    
    global k;
    global w1;
    global w2;
    global a;
    global f;
    global b1;
    global b2;
    global c1;
    global c2;
    
    exponentes = zeros(4, n);
    Vparam = linspace(max, min, n);    
     
    if (isnan(param(1)))
        for i =  1:n
            lambda = exponentesLyapunov (k, w1, w2, a, f, b1, b2, Vparam(i), c2, ci);
            exponentes(:,i) = lambda;
        end
        else if (isnan(param(2)))
            for i =  1:n
                lambda = exponentesLyapunov (k, w1, w2, a, f, b1, b2, c1, Vparam(i), ci);
                exponentes(:,i) = lambda;
            end        
        end
    end
    
    figure;
    % Pintura
    plot(Vparam, exponentes(1, :), Vparam, exponentes(2,:), Vparam, exponentes(3,:), 2.4:0.00001:2.6, 0);
    xlabel('Parámetro de control');
    ylabel('Valor del exponente');
    title('Exponentes de Lyapunov del circuito de Van Der Pol Forzado');
        
end