% 
% Simulador de procesos naturales
% Borja Bordel
% Abril 2016
%
% Caos en circuitos electrónicos
% Borja Bordel Sánchez

function [] = cortaPoincareBrusselator (n, p, a, b, m, w, v1_0, v2_0, v3_0)
    
    %Selección de tiempo
    T = 7000;
    
    % Integración de la solución
    [v1, v2, v3, tiempo] = IntegraBrusselator(a, b, m, w, v1_0, v2_0, v3_0, T);
    
    % Eliminación del transistorio
    v1 = v1(5000:end);
    v2 = v2(5000:end);
    v3 = v3(5000:end);
    
    % Producto escalar de la normal por el vector posición del punto
    D = n(1)*p(1)+n(2)*p(2)+n(3)*p(3);
    
    figure;
    % Represetanción del atráctor en 3D
    plot3(v1,v2,v3,'r');
    hold on;
    pintaPlano(n,p);
    grid on;
    title('Estructura espacial del corte');
    xlabel('v1 (Voltios)');
    ylabel('v2 (Voltios)');
    zlabel('v3 (Voltios)');
    
    % Nueva figura para representar los cortes
    figure;   
    
    % Número de muestras de v2
    num_muestras = size(v2);    
    num_muestras = num_muestras - 2;
    
    %Bucle para habllar los cortes del atráctor con el plano
    for i = 1:num_muestras
        
       % Dirección del vector de flujo
       k1=-D+n(1)*v1(i)+n(2)*v2(i)+n(3)*v3(i);
       k2=-D+n(1)*v1(i+1)+n(2)*v2(i+1)+n(3)*v3(i+1);
       
       % Analizamos si el flujo es de "arriba a abajo" o al revés
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
    
    title('Sección de Poincaré');
    xlabel('v1 (Voltios)');
    ylabel('v2 (Voltios)');