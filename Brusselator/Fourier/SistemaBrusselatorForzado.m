% 
% Simulador de procesos naturales
% Borja Bordel
% Abril 2016
%
% Sistema forzado de Brusselator

function [dv] = SistemaBrusselatorForzado(t, v)

    global a;
    global b;
    global m;
    global w;
     

   dv = zeros(3,1);
   
   dv(1) = a+v(1)^2*v(2)-b*v(1)-v(1)+m*cos(v(3));
   dv(2) = b*v(1)-v(1)^2*v(2);
   dv(3) = w;
   
end
