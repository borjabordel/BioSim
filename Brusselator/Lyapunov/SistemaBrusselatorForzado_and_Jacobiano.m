% 
% Simulador de procesos naturales
% Borja Bordel
% Abril 2016
%
% Sistema forzado de Brusselator

function [dv] = SistemaBrusselatorForzado_and_Jacobiano(t, v)

    global a;
    global b;
    global m;
    global w;
     

   dv = zeros(12,1);
   
   dv(1) = a+v(1)^2*v(2)-b*v(1)-v(1)+m*cos(v(3));
   dv(2) = b*v(1)-v(1)^2*v(2);
   dv(3) = w;
   
   Jac = [2*v(1)*v(2) v(1)^2 -m*sin(v(3)) ; b-2*v(1) -v(1)^2 0 ; 0 0 0];
       
    Jac_ci= [v(4), v(7), v(10);
             v(5), v(8), v(11);
             v(6), v(9), v(12)];

    dv(4:12) = Jac*Jac_ci;
   
end
