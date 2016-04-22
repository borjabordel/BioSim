% Borja Bordel Sánchez
%
% Esta función calcula la dimensión de Lyapunov a partir de los exponentes
% de Lyapunov del atráctor
%
% ENTRADAS:
% lambda : Exponentes de Lyapunov del atráctor
%
% SALIDAS:
% dimensionL : Dimensión de Lyapunov 
%

function [dimensionL] = calculaDimensionL (lambda)
    
  % Ordenamos los exponentes de Lyapunov en orden descendente
  lambda = sort(lambda, 'descend');
  
  % Inicializamos una variable auxiliar
  LESum = lambda(1);			
  % La dimensión es nula
  dimensionL = 0;
  
  % Si sólo hay un exponentes, o el máximo es nulo, la dimensión es cero
  if (length(lambda) > 1 && lambda(1) > 0)
     % Recorremos los exponentes
     for i = 1:length(lambda)-1
        % Si es no nulo 
        if lambda(i+1)~=0
           % Fórmula de la dimensión de Lyapunov 
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