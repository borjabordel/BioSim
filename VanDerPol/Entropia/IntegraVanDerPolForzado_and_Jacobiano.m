% Borja Bordel S�nchez
%
% Funci�n que integra el oscilador de Van Der Pol forzado en el periodo de tiempo 
% indicado.
% Emplea el oscilador definido en VanDerPolForzado (ver descripci�n)
%
% Entradas:
% x0 : condici�n inicial para la primera coordenada
% y0 : condici�n inicial para la segunda coordenada
% z0 : condici�n inicial para la tercera coordenada
% T : instante m�ximo hasta el que se quiere integrar en segundos
% mu_ : Coeficiente de amortiguamiento
% A_ : Amplitud de la fuerza
% omega_ : Frecuencia de la fuerza
%
% Salidas:
% x  : vector soluci�n para la primera variable
% y  : vector soluci�n para la segunda variable
% y  : vector soluci�n para la tercera variable
% tiempo : vector de instantes de tiempo donde se ha evaludo la soluci�n
%
% Caos en circuitos electr�nicos
% Borja Bordel S�nchez

function [valores, tiempo] = IntegraVanDerPolForzado_and_Jacobiano(mu_, A_, omega_, ci, T)
    
    global mu;
    global A;
    global omega;
    
    mu = mu_;
    A = A_;
    omega = omega_;

    % Opciones para controlar el error
    opciones = odeset('RelTol', 10^-7, 'AbsTol', [10^-7, 10^-7, 10^-7, 10^-7, 10^-7, 10^-7, 10^-7, 10^-7, 10^-7, 10^-7, 10^-7, 10^-7]);
    
    % integraci�n num�rica
    [tiempo, valores] = ode45(@VanDerPolForzado_and_Jacobiano, T, ci);
end

