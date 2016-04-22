% Borja Bordel Sánchez
%
% Función que integra el oscilador de Van Der Pol forzado en el periodo de tiempo 
% indicado.
% Emplea el oscilador definido en VanDerPolForzado (ver descripción)
%
% Entradas:
% x0 : condición inicial para la primera coordenada
% y0 : condición inicial para la segunda coordenada
% z0 : condición inicial para la tercera coordenada
% T : instante máximo hasta el que se quiere integrar en segundos
% mu_ : Coeficiente de amortiguamiento
% A_ : Amplitud de la fuerza
% omega_ : Frecuencia de la fuerza
%
% Salidas:
% x  : vector solución para la primera variable
% y  : vector solución para la segunda variable
% y  : vector solución para la tercera variable
% tiempo : vector de instantes de tiempo donde se ha evaludo la solución
%
% Caos en circuitos electrónicos
% Borja Bordel Sánchez

function [x, y, z, tiempo] = IntegraVanDerPolForzado(mu_, A_, omega_, x0, y0, z0, T)
    
    global mu;
    global A;
    global omega;
    
    mu = mu_;
    A = A_;
    omega = omega_;

    % Opciones para controlar el error
    opciones = odeset('RelTol', 10^-7, 'AbsTol', [10^-7, 10^-7, 10^-7]);
    
    % integración numérica
    [tiempo, valores] = ode45(@VanDerPolForzado, [0 T], [x0, y0 z0], opciones);
    
    % Separación de las columnas de la matriz solución en vectores
    x = valores(:,1);
    y = valores(:,2);
    z = valores(:,3);
    z = z-2*pi*fix(z/(2*pi)); 
    % Restringimos la fase a [0,2*pi] para que el atráctor sea limitado en
    % el espacio de fases
end

