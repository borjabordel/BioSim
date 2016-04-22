% Borja Bordel S�nchez
%
% Esta funci�n calcula la dimensi�n de Lyapunov a partir de los exponentes
% de Lyapunov del atr�ctor
%
% ENTRADAS:
% lambda : Exponentes de Lyapunov del atr�ctor
%
% SALIDAS:
% dimensionL : Dimensi�n de Lyapunov 
%

function [dimensionL] = calculaDimensionL (lambda)
    
  % Ordenamos los exponentes de Lyapunov en orden descendente
  lambda = sort(lambda, 'descend');
  
  % Inicializamos una variable auxiliar
  LESum = lambda(1);			
  % La dimensi�n es nula
  dimensionL = 0;
  
  % Si s�lo hay un exponentes, o el m�ximo es nulo, la dimensi�n es cero
  if (length(lambda) > 1 && lambda(1) > 0)
     % Recorremos los exponentes
     for i = 1:length(lambda)-1
        % Si es no nulo 
        if lambda(i+1)~=0
           % F�rmula de la dimensi�n de Lyapunov 
           dimensionL = i+LESum/abs(lambda(i+1));
           LESum=LESum+lambda(i+1);
           % Cuando se hace negativo, paramos
           if LESum<0
              break;
           end
        end
     end
  end
end