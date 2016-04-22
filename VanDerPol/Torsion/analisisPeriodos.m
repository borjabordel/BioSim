% Borja Bordel Sánchez
%
% Función que calcula el periodo de la señal del sistema de Van Der Pol
%
% Entradas:
% A_, omega_, mu_ : Parámetros del sistema de Van Der Pol
% ci : Condiciones iniciales
%
% Salidas:
% periodo : Periodo de la señal
%
% Caos en circuitos electrónicos
% Borja Bordel Sánchez


function [periodo] = analisisPeriodos (A_, omega_, mu_, ci, comp, pintura)

    % Para ver las repeticiones de los máximos,
    % 1) se almacena el valor de 
    % los máximos en un vector en formato de número entero (truncado el máximo, de real a entero). 
    % 2) Después se busca el número de repeticiones de cada uno , 
    % 3)para verificar la bondad del método, se realiza un histograma del 
    % número de repeticiones en función del número de máximo (no hace falta poner 
    % su valor sino numerarlo para distinguir un máximo de otro). Finalmente, 
    % 4) Como al encontrar la repeticiones el vector se ordena con solo los valores 
    % diferentes (sin repetición), el número de valores diferentes del vector sería, 
    % directamente, el periodo de la señal para el valor concreto del parámetro de control 
    % que se esté estudiando.  
    
    % Parámetros    
    global mu;
    global A;
    global omega;
    
    A = A_;
    mu = mu_;
    omega = omega_;
    
    % Tiempo de análisis
    T = 1000*2*pi/omega;
    
    % Integración
    opciones = odeset('RelTol', 10^-7, 'AbsTol', [10^-7, 10^-7, 10^-7]);
    [t, x] = ode45(@VanDerPolForzado,0:1:10, ci, opciones);
    [t, x] = ode45(@VanDerPolForzado, [0 T], [x(end, 1); x(end,2); x(end,3)], opciones);
    
    % Inicialización
    maximos = [];  
    
    switch comp
        case 1
            var = x(:,1);
        case 2
            var = x(:,2);
        case 3
            var = x(:,3);
    end
    
    j = 1;
    
    % Busqueda de máximos
    numPuntos = length(var);
    for i = 2:numPuntos-1 
        if ((var(i)>var(i-1)) && (var(i)>=var(i+1))) 
            maximos = [maximos, var(i)];
            j=j+1;
        end
    end
    
    % Inicialización para periodos
    maximos = round(100*maximos);
    n=length(maximos);
    maximos2 = [];
    repeticiones = [];    
    k=1;
    
    % Busqueda de periodos
    while k <= n
        [~, repeticion] = find(maximos == maximos(k));
        maximos2 = [maximos2, maximos(k)];
        repeticiones = [repeticiones, length(repeticion)];
        maximos(repeticion)=[];
        n = length(maximos);
    end
    
    periodo = length(maximos2);
    
    % Si queremos, se puede imprimir un histograma
    if pintura
        stem(maximos2, repeticiones);
        title('Histograma de aparición de máximos');
        xlabel('Máximo');
        ylabel('Número de apariciones');
    end
end