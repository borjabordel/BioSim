% Borja Bordel S�nchez
%
% Funci�n que calcula el periodo de la se�al del sistema de Van Der Pol
%
% Entradas:
% A_, omega_, mu_ : Par�metros del sistema de Van Der Pol
% ci : Condiciones iniciales
%
% Salidas:
% periodo : Periodo de la se�al
%
% Caos en circuitos electr�nicos
% Borja Bordel S�nchez


function [periodo] = analisisPeriodos (A_, omega_, mu_, ci, comp, pintura)

    % Para ver las repeticiones de los m�ximos,
    % 1) se almacena el valor de 
    % los m�ximos en un vector en formato de n�mero entero (truncado el m�ximo, de real a entero). 
    % 2) Despu�s se busca el n�mero de repeticiones de cada uno , 
    % 3)para verificar la bondad del m�todo, se realiza un histograma del 
    % n�mero de repeticiones en funci�n del n�mero de m�ximo (no hace falta poner 
    % su valor sino numerarlo para distinguir un m�ximo de otro). Finalmente, 
    % 4) Como al encontrar la repeticiones el vector se ordena con solo los valores 
    % diferentes (sin repetici�n), el n�mero de valores diferentes del vector ser�a, 
    % directamente, el periodo de la se�al para el valor concreto del par�metro de control 
    % que se est� estudiando.  
    
    % Par�metros    
    global mu;
    global A;
    global omega;
    
    A = A_;
    mu = mu_;
    omega = omega_;
    
    % Tiempo de an�lisis
    T = 1000*2*pi/omega;
    
    % Integraci�n
    opciones = odeset('RelTol', 10^-7, 'AbsTol', [10^-7, 10^-7, 10^-7]);
    [t, x] = ode45(@VanDerPolForzado,0:1:10, ci, opciones);
    [t, x] = ode45(@VanDerPolForzado, [0 T], [x(end, 1); x(end,2); x(end,3)], opciones);
    
    % Inicializaci�n
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
    
    % Busqueda de m�ximos
    numPuntos = length(var);
    for i = 2:numPuntos-1 
        if ((var(i)>var(i-1)) && (var(i)>=var(i+1))) 
            maximos = [maximos, var(i)];
            j=j+1;
        end
    end
    
    % Inicializaci�n para periodos
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
        title('Histograma de aparici�n de m�ximos');
        xlabel('M�ximo');
        ylabel('N�mero de apariciones');
    end
end