%
% Función que calcula las pulsaciones de torsion de los sistemas de Van Der
% Pol acoplado
%
% Entradas:
% k, w1, w2, a, f, b1, b2, c1, c2 : Parámetros del sistema
% ci : Condiciones iniciales
%
% Salidas:
% pulsacion1, pulsacion2 : pulsación de torsion 
%
% Caos en circuitos electrónicos
% Borja Bordel Sánchez

function [pulsacion1, pulsacion2] = PulsacionTorsion (k_, w1_, w2_, a_, f_, b1_, b2_, c1_, c2_, ci)

    global k;
    global w1;
    global w2;
    global a;
    global f;
    global b1;
    global b2;
    global c1;
    global c2;
    
    k = k_;
    w1 = w1_;
    w2 = w2_;
    a = a_;
    f = f_;
    b1 = b1_;
    b2 = b2_;
    c1 = c1_;
    c2 = c2_;
    
    dt = 0.1;
    N = 6000;
    
    % vector de opciones para controlar el error de integración
    opciones = odeset('RelTol', 10^-7, 'AbsTol', [10^-7, 10^-7, 10^-7, 10^-7]);
    
    [t, x] = ode45(@heartBeat,0:0.1:10, ci, opciones);
    [t, x] = ode45(@heartBeat, 0:dt:(N*dt), [x(end, 1); x(end,2); x(end,3) ;  x(end,4)], opciones);
    
    x1 = x(:,1);    
    x2 = x(:,2);
    x3 = x(:,3);
    x4 = x(:,4);
    
    beta = (1./x3)./(1+(x4./x3).^2).*(k*(x3-w1).*(x3-w2).*x4-b2*x3+c2*(x1-x3))-1./(1+(x3./x4).^2);     
    integral = dt*trapz(beta);    
    pulsacion2 = abs(integral)/(N*dt);
    
    beta = (1./x1)./(1+(x2./x1).^2).*(k*(x1-w1).*(x1-w2).*x2-b1*x1+a*sin(f*t)+c1*(x3-x1))-1./(1+(x1./x2).^2);    
    integral = dt*trapz(beta);    
    pulsacion1 = abs(integral)/(N*dt);
end
