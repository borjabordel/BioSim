% 
% Simulador de procesos naturales
% Borja Bordel
% Febrero 2016
%
% Función que pinta las resultados del estudio de los números de torsión

function [] = pintaTorsion (w_min, w_max, n, A, u, ci, comp)

    % Parámetro de barrido
    w = linspace(w_min, w_max, n);

    % Vector de pulsaciones de torsion
    pulsacion = zeros(1, length(w));
    periodo = zeros(1, length(w));

    for i=1:length(w)
            pulsacion(i) = PulsacionTorsion (A, w(i), u, ci);
            periodo(i) = analisisPeriodos (A, w(i), u, ci,comp,0);
    end

    % Widing number
    torison = periodo.*(pulsacion./w);
    widing = pulsacion./w;

    % Pintura
    figure;
    plot(w, periodo);
    title('Evolución de los periodos');
    xlabel('omega (rad/s)');
    ylabel('Número de periodos)');
   
    figure;
    plot(w, widing);
    title('Widing number para');
    xlabel('omega (rad/s)');
    ylabel('W (winding number)');

    figure;
    plot(w, torison);
    title('Número de torsion');
    xlabel('omega (rad/s)');
    ylabel('n (numero de torsion)');
end