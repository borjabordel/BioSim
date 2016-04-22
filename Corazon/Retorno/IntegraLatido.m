%
% Función que integra el sistema de dos Van Der Pol acoplados que
% representan el latido de un corazón
%
% Entradas:
% v1_0 : condición inicial para la primera coordenada del primer sistemas
% v2_0 : condición inicial para la segunda coordenada del primer sistema
% v3_0 : condición inicial para la primera coordenada del segundo sistema
% v4_0 : condición inicial para la segunda coordenada del segundo sistema
% T : instante máximo hasta el que se quiere integrar en segundos
% k_, w1_, w2_, a_, f_, b1_, b2_, c1_, c2_ : Parámetros del sistema
%
% Salidas:
% v1 : vector solución para la primera variable del primer sistema
% v2 : vector solución para la segunda variable del primer sistemas
% v3 : vector solución para la primera variable del segundo sistema
% v4 : vector solución para la segunda variable del segundo sistema
% tiempo : vector de instantes de tiempo donde se ha evaludo la solución
%
% Caos en circuitos electrónicos
% Borja Bordel Sánchez


function [v1, v2, v3, v4, tiempo] = IntegraLatido(k_, w1_, w2_, a_, f_, b1_, b2_, c1_, c2_, v1_0, v2_0, v3_0, v4_0, T)
    
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
    
    % vector de opciones para controlar el error de integración
    opciones = odeset('RelTol', 10^-7, 'AbsTol', [10^-7, 10^-7, 10^-7, 10^-7]);
    
    % integración numérica
    [tiempo, valores] = ode45(@heartBeat, [0 T], [v1_0 v2_0 v3_0 v4_0], opciones);
    
    % Separación de las columnas de la matriz solución en vectores
    v1 = valores(:,1);
    v2 = valores(:,2);
    v3 = valores(:,3);
    v4 = valores(:,4);
end

