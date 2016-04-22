% Borja Bordel Sánchez
%
% Función que devuelve el valor de las derivadas de dos sistemas de Van Der
% Pol acoplados en un punto temporal dado 
%
% Entradas:
% t : instante de tiempo en segundos
% v : vector trimensional de (x, y,z)
%
% Salidas:
% dv : vector con los valores de las derivadas (dx, dy, dz) y el jacobiano
%
% Caos en circuitos electrónicos
% Borja Bordel Sánchez

function [dv] = heartBeat (t, v) 
    
    global k;
    global w1;
    global w2;
    global a;
    global f;
    global b1;
    global b2;
    global c1;
    global c2;
    
    dv = zeros(4,1);

    % Primer Van Der Pol
    dv(1) = v(2);
    dv(2) = k*(v(1)-w1)*(v(1)-w2)*v(2)-b1*v(1)+a*sin(f*t)+c1*(v(3)-v(1));

    % Segundo Van Der pol
    dv(3) = v(4);
    dv(4) = k*(v(3)-w1)*(v(3)-w2)*v(4)-b2*v(3)+c2*(v(1)-v(3));
    
end