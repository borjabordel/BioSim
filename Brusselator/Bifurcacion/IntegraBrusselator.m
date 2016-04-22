% 
% Simulador de procesos naturales
% Borja Bordel
% Abril 2016
%
% Función para integrar el sistema forzado de Brusselator


function [v1, v2, v3, tiempo] = IntegraBrusselator(a_, b_, m_, w_, v1_0, v2_0, v3_0, T)
    
    global a;
    global b;
    global w;
    global m;
    
    a = a_;
    b = b_;
    m = m_;
    w = w_;


    % vector de opciones para controlar el error de integración
    opciones = odeset('RelTol', 10^-6, 'AbsTol', [10^-6, 10^-6, 10^-6]);
    
    % integración numérica
    [tiempo, valores] = ode45(@SistemaBrusselatorForzado, [0 T], [v1_0 v2_0 v3_0], opciones);
    
    % Separación de las columnas de la matriz solución en vectores
    v1 = valores(:,1);
    v2 = valores(:,2);
    v3 = valores(:,3);
end

