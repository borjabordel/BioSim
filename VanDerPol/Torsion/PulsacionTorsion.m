% Borja Bordel S�nchez
%
% Funci�n que calcula la freceuncai de toris�n de la �rbita del sistema de
% Van Der Pol
%
% Entradas:
% A_, omega_, mu_ : Par�metros del sistema de Van Der Pol forzado
% ci : Condiciones iniciales
%
% Salidas:
% pulsacion : pulsaci�n de torsion 
%
% Caos en circuitos electr�nicos
% Borja Bordel S�nchez

function [pulsacion] = PulsacionTorsion (A_, omega_, mu_, ci)
    
    % Par�metros    
    global mu;
    global A;
    global omega;
    
    A = A_;
    mu = mu_;
    omega = omega_;
    
    % N�mero de evaluaciones
    N = 60000;
    
    opciones = odeset('RelTol', 10^-7, 'AbsTol', [10^-7, 10^-7, 10^-7, 10^-7, 10^-7]);
    
    % Salto temporal para evaluar las respuestas
    dt = 0.01;
    
    % Integraci�n
    [t, x] = ode45(@VanDerPolForzadoTorsion,0:1:10, [ci, 0.1 0.1], opciones);
    [t, x] = ode45(@VanDerPolForzadoTorsion, 0:dt:(N*dt), [x(end, 1); x(end,2); x(end,3) ;  x(end,4); x(end,5)], opciones);
    
    % C�lculo de las variables necesarias
    u1 = x(:,4);
    u2 = x(:,5);    
    u1d = u2;
    u2d = -(2*mu*x(:,1).*x(:,2)+1).*u1-(mu*x(:,1).^2-mu).*u2;   
    
    % Integraci�n y c�lculo de la pulsaci�n
    beta = (u1.*u2d-u1d.*u2)./(u1.^2+u2.^2);    
    integral = dt*trapz(beta);    
    pulsacion = abs(integral)/(N*dt);
end