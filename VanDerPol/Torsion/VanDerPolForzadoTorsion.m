% Borja Bordel Sánchez
%
% Función que, dado un punto (x, y) del oscilador de Van Der Pol forzado
% calcula sus derivadas, y las derivadas del sistema auxiliar necesario
% para calcular la frecuencia de torsion
%
% Entradas:
% t : instante de tiempo en segundos en el que nos encontramos
% v : vector trimensional de (x, y)
%
% Salidas:
% dv : vector con los valores de las derivadas (dx, dy)
%
% Caos en circuitos electrónicos
% Borja Bordel Sánchez

function [dv] = VanDerPolForzadoTorsion(t, v)

% Parámetro de amortiguamiento
global mu;

%Terminos de forzado
global omega;
global A;

% Inicializamos
dv = zeros(5,1);

% Sistema diferencial
dv(1) = v(2);
dv(2) = -v(1)+mu*(1-v(1)^2)*v(2)+A*sin(v(3));
dv(3) = omega;

dv(4) = v(5);
dv(5) = -(2*mu*v(1)*dv(1)+1)*v(4)-(mu*v(1)^2-mu)*v(5);

end

