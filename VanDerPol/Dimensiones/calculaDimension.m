% 
% Simulador de procesos naturales
% Borja Bordel
% Diciembre 2015
%
% Función para el cálculo de las dimensiones

function [dim] = calculaDimension (mu, A, omega, v1_0, v2_0, v3_0, tipo)

if (tipo == 3)
    cd('Lyapunov');
    lambda = exponentesLyapunov (mu, A, omega, [v1_0, v2_0, v3_0]);
    dim = calculaDimensionL(lambda);
    cd('..');
else
    cd('Fractales');
    T = 250;
    [valores, tiempo] = IntegraVanDerPolForzado(mu, A, omega, v1_0, v2_0, v3_0, T);
    valores = valores(1000:end,:);
    [dim,rq]=fdim(tipo,valores,0); 
    cd('..');
end