%
% Función que integra el sistema de dos Van Der Pol acoplados que
% representan el latido de un corazón y su versión linealizada
%
% Entradas:
% v1_0 : condición inicial para la primera coordenada del primer sistemas
% v2_0 : condición inicial para la segunda coordenada del primer sistema
% v3_0 : condición inicial para la primera coordenada del segundo sistema
% v4_0 : condición inicial para la segunda coordenada del segundo sistema
% T : instante máximo hasta el que se quiere integrar en segundos
% k_, w1_, w2_, a_, f_, b1_, b2_, c : Parámetros del sistema
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


function [valores, tiempo] = IntegraLatido_and_Jacobiano(k_, w1_, w2_, a_, f_, b1_, b2_, c1_, c2_, ci, T)
    
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
    opciones = odeset('RelTol', 10^-7, 'AbsTol', [10^-7, 10^-7, 10^-7, 10^-7, 10^-7, 10^-7, 10^-7, 10^-7, 10^-7, 10^-7, 10^-7, 10^-7, 10^-7, 10^-7, 10^-7, 10^-7, 10^-7, 10^-7, 10^-7, 10^-7]);
    
    % integración numérica
    [tiempo, valores] = ode45(@heartBeat_and_Jacobiano, T, ci, opciones);
end

