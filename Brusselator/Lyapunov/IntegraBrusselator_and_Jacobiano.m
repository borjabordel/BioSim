% 
% Simulador de procesos naturales
% Borja Bordel
% Abril 2016
%
% Función para integrar el sistema forzado de Brusselator


function [valores, tiempo] = IntegraBrusselator_and_Jacobiano(a_, b_, m_, w_,ci, T)
    
    global a;
    global b;
    global w;
    global m;
    
    a = a_;
    b = b_;
    m = m_;
    w = w_;


    % vector de opciones para controlar el error de integración
    opciones = odeset('RelTol', 10^-6, 'AbsTol', [10^-7, 10^-7, 10^-7, 10^-7, 10^-7, 10^-7, 10^-7, 10^-7, 10^-7, 10^-7, 10^-7, 10^-7]);
    
    % integración numérica
    [tiempo, valores] = ode45(@SistemaBrusselatorForzado_and_Jacobiano, T, ci, opciones);
end

