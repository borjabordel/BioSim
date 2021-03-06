% Borja Bordel S�nchez
%
% Funci�n que realiza y representa el corte de un atr�ctor por un plano
% bidimensional dado
%
% Entradas:
% v1_0 : condici�n inicial para la primera coordenada
% v2_0 : condici�n inicial para la segunda coordenada
% v3_0 : condici�n inicial para la tercera coordenada
% T : instante m�ximo hasta el que se quiere integrar en segundos
% mu : Amortiguamiento
% A : Amplitud de la fuerza
% omega : Pulsaci�n de la fuerza
% p : punto por el que pasa el plano
% n : vector normal al plano de corte
%
%
% Caos en circuitos electr�nicos
% Borja Bordel S�nchez

function [] = cortaPoincareVanDerPol (n, p, mu, A, omega, v1_0, v2_0, v3_0)
    
    %Selecci�n de tiempo
    T = 5000;
    
    % Integraci�n de la soluci�n
    [v1, v2, v3, tiempo] = IntegraVanDerPolForzado(mu, A, omega, v1_0, v2_0, v3_0, T);
    
    % Eliminaci�n del transistorio
    v1 = v1(5000:end);
    v2 = v2(5000:end);
    v3 = v3(5000:end);
    
    % Producto escalar de la normal por el vector posici�n del punto
    D = n(1)*p(1)+n(2)*p(2)+n(3)*p(3);
    
    figure;
    % Represetanci�n del atr�ctor en 3D
    plot3(v1,v2,v3,'r');
    hold on;
    pintaPlano(n,p);
    grid on;
    title(['Estructura espacial del corte. mu = ', num2str(mu), ' omega = ', num2str(omega), ' A = ', num2str(A)]);
    xlabel('v1 (Voltios)');
    ylabel('v2 (Voltios)');
    zlabel('v3 (Voltios)');
    
    % Nueva figura para representar los cortes
    figure;   
    
    % N�mero de muestras de v2
    num_muestras = size(v2);    
    num_muestras = num_muestras - 2;
    
    %Bucle para habllar los cortes del atr�ctor con el plano
    for i = 1:num_muestras
        
       % Direcci�n del vector de flujo
       k1=-D+n(1)*v1(i)+n(2)*v2(i)+n(3)*v3(i);
       k2=-D+n(1)*v1(i+1)+n(2)*v2(i+1)+n(3)*v3(i+1);
       
       % Analizamos si el flujo es de "arriba a abajo" o al rev�s
       if (k1*k2)<=0           
           if   k1<=k2
               plot(v2(i),v1(i),'.');
               hold on;
           else
               plot(v2(i),v1(i),'r.');
               hold on;
           end
       end
    end
    
    title(['Secci�n de Poincar� mu = ', num2str(mu), ' omega = ', num2str(omega), ' A = ', num2str(A)]);
    xlabel('v1 (Voltios)');
    ylabel('v2 (Voltios)');
end