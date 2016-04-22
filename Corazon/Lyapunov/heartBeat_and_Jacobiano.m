% Función que devuelve el valor de las derivadas de dos sistemas de Van Der
% Pol acoplados en un punto temporal dado así como el valor del sistema
% linealizado
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

function [dv] = heartBeat_and_Jacobiano (t, v) 
    
    global k;
    global w1;
    global w2;
    global a;
    global f;
    global b1;
    global b2;
    global c1;
    global c2;
    
    dv = zeros(20,1);

    % Primer Van Der Pol
    dv(1) = v(2);
    dv(2) = k*(v(1)-w1)*(v(1)-w2)*v(2)-b1*v(1)+a*sin(f*t)+c1*(v(3)-v(1));

    % Segundo Van Der pol
    dv(3) = v(4);
    dv(4) = k*(v(3)-w1)*(v(3)-w2)*v(4)-b2*v(3)+c2*(v(1)-v(3));
    
   Jac = [0 1 0 0 ; k*v(2)*(2*v(1)-w1-w2)-b1-c1 k*(v(1)^2+w1*w2-(w1+w2)*v(1)) c1 0 ;...
          0 0 0 1 ; c2 0 k*v(4)*(2*v(3)-w1-w2)-b2-c2 k*(v(3)^2+w1*w2-(w1+w2)*v(3))];
       
   Jac_ci= [v(5), v(9), v(13), v(17);
            v(6), v(10), v(14), v(18);
            v(7), v(11), v(15), v(19);
            v(8), v(12), v(16), v(20)];
   
   % Nuevos valores linealizados
   dv(5:20) = Jac*Jac_ci;
    
end