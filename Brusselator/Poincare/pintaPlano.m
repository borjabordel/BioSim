% Borja Bordel S�nchez
%
% Dibuja un plano que pasa por el punto p(del que se debe dar el vector posici�n)
% y de vector normal n. 
% El plano ser� entonces n(1)*x + n(2)*y + n(3)*z - D = 0
% con D=n(1)*p(1)+n(2)*p(2)+n(3)*p(3)
%
% Entradas:
% p : punto por el que pasa el plano
% n : vector normal al plano de corte
%
% Caos en circuitos electr�nicos
% Borja Bordel S�nchez

function [] = pintaPlano (n, p)
    
    % Producto escalar
    D = n(1)*p(1)+ n(2)*p(2)+ n(3)*p(3);
    [X,Y] = meshgrid(-2:0.1:2);
    [C] = X;
    
    % el 0.001 se a�ade para evitar infinitos
    z=-(-D+n(1)*X+n(2)*Y)/(n(3)+0.001); 
    mesh(X,Y,z,C);

end