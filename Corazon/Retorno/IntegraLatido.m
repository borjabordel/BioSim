%
% Funci�n que integra el sistema de dos Van Der Pol acoplados que
% representan el latido de un coraz�n
%
% Entradas:
% v1_0 : condici�n inicial para la primera coordenada del primer sistemas
% v2_0 : condici�n inicial para la segunda coordenada del primer sistema
% v3_0 : condici�n inicial para la primera coordenada del segundo sistema
% v4_0 : condici�n inicial para la segunda coordenada del segundo sistema
% T : instante m�ximo hasta el que se quiere integrar en segundos
% k_, w1_, w2_, a_, f_, b1_, b2_, c1_, c2_ : Par�metros del sistema
%
% Salidas:
% v1 : vector soluci�n para la primera variable del primer sistema
% v2 : vector soluci�n para la segunda variable del primer sistemas
% v3 : vector soluci�n para la primera variable del segundo sistema
% v4 : vector soluci�n para la segunda variable del segundo sistema
% tiempo : vector de instantes de tiempo donde se ha evaludo la soluci�n
%
% Caos en circuitos electr�nicos
% Borja Bordel S�nchez


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
    
    % vector de opciones para controlar el error de integraci�n
    opciones = odeset('RelTol', 10^-7, 'AbsTol', [10^-7, 10^-7, 10^-7, 10^-7]);
    
    % integraci�n num�rica
    [tiempo, valores] = ode45(@heartBeat, [0 T], [v1_0 v2_0 v3_0 v4_0], opciones);
    
    % Separaci�n de las columnas de la matriz soluci�n en vectores
    v1 = valores(:,1);
    v2 = valores(:,2);
    v3 = valores(:,3);
    v4 = valores(:,4);
end

