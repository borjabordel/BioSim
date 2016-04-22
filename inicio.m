% 
% Simulador de procesos naturales
% Borja Bordel
% Diciembre 2015
%
% Ventana inicial de selección

function varargout = inicio(varargin)
    % INICIO MATLAB code for inicio.fig
    %      INICIO, by itself, creates a new INICIO or raises the existing
    %      singleton*.
    %
    %      H = INICIO returns the handle to a new INICIO or the handle to
    %      the existing singleton*.
    %
    %      INICIO('CALLBACK',hObject,eventData,handles,...) calls the local
    %      function named CALLBACK in INICIO.M with the given input arguments.
    %
    %      INICIO('Property','Value',...) creates a new INICIO or raises the
    %      existing singleton*.  Starting from the left, property value pairs are
    %      applied to the GUI before inicio_OpeningFcn gets called.  An
    %      unrecognized property name or invalid value makes property application
    %      stop.  All inputs are passed to inicio_OpeningFcn via varargin.
    %
    %      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
    %      instance to run (singleton)".
    %
    % See also: GUIDE, GUIDATA, GUIHANDLES

    % Edit the above text to modify the response to help inicio

    % Last Modified by GUIDE v2.5 17-Jan-2016 22:24:30

    % Begin initialization code - DO NOT EDIT
    gui_Singleton = 1;
    gui_State = struct('gui_Name',       mfilename, ...
                       'gui_Singleton',  gui_Singleton, ...
                       'gui_OpeningFcn', @inicio_OpeningFcn, ...
                       'gui_OutputFcn',  @inicio_OutputFcn, ...
                       'gui_LayoutFcn',  [] , ...
                       'gui_Callback',   []);
    if nargin && ischar(varargin{1})
        gui_State.gui_Callback = str2func(varargin{1});
    end

    if nargout
        [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
    else
        gui_mainfcn(gui_State, varargin{:});
    end
    % End initialization code - DO NOT EDIT
end

% --- Executes just before inicio is made visible.
function inicio_OpeningFcn(hObject, eventdata, handles, varargin)
    % This function has no output args, see OutputFcn.
    % hObject    handle to figure
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    % varargin   command line arguments to inicio (see VARARGIN)

    % Choose default command line output for inicio
    handles.output = hObject;

    % Update handles structure
    guidata(hObject, handles);

    % UIWAIT makes inicio wait for user response (see UIRESUME)
    % uiwait(handles.figure1);
end

% --- Outputs from this function are returned to the command line.
function varargout = inicio_OutputFcn(hObject, eventdata, handles) 
    % varargout  cell array for returning output args (see VARARGOUT);
    % hObject    handle to figure
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Get default command line output from handles structure
    varargout{1} = handles.output;
end

% --- Executes on selection change in selector.
function selector_Callback(hObject, eventdata, handles)
    % hObject    handle to selector (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hints: contents = cellstr(get(hObject,'String')) returns selector contents as cell array
    %        contents{get(hObject,'Value')} returns selected item from selector

    seleccion = get(handles.selector,'Value');
    switch seleccion 
        case 1
            set(handles.explicacion, 'String', '');
        case 2
            explanation = [{'Modelo para simular la evolución temporal de un circuito de Van Der Pol'},...
            {''},{'El modelo se compone de tres ecuaciones representando cada una las corrientes que circulan por las mallas del circuito y la tensión de forzado (opcional)'},...
            {''},{'En el funcionamiento ordinario, el circuito RLC serie porovoa una corrinte que se dirije hacia el ánodo de un triodo, mientras exista una tensión aecuada sonber la rejilla de control del triodo'},{''},...
            {'El modelo incluye la posibilidad de incluir una señal de forzado en el circuito, de forma que las oscilaciones de relajación den lugar a comportamientos más complejos'}];
            set(handles.explicacion, 'String', explanation);
        case 3
            explanation = [{'Modelo para simular la interacción entre los nodos AV y SA del sistema de conducción del corazón. Incluye un término de forzado externo para representar la acción de un marcapasos'},...
            {''},{'El modelo se compone de dos sistemas de Van Der Pol acoplados, representado cada uno sendos nodos.'},...
            {''},{'En un comportamiento adecuado, el nodo SA genera impulsos de forma ritmica. Estos impulsos atraviesan el miocardio y generan una onda de contracción que afecta a ambas auriculas. Tras ello, los impulsos llegan al nodo AV, que los retrasa y los vuelve a distribuir provocando la contracción de los ventrículos'},{''},...
            {'El modelo incluye la posibilidad de excitar el nodo AV de forma externa, representando la función de un marcapasos'}];
            set(handles.explicacion, 'String', explanation);
        case 4
            explanation = [{'Modelo para simular la evolución de las reacciones autocatalíticas. Dentro de este grupo, la más conocida es la reaccoón de  Beloúsov-Zhabotinski.'},...
            {''},{'El modelo se compone de dos ecuaciones diferenciales ordinarias de primer orden, no lineales.'},...
            {''},{'A diferencia de las ecuaciones Lotka–Volterra, las oscilaciones del Brusselator no dependen de la cantidad de reactante presente inicialmente. En su lugar, al cabo de suficiente tiempo, las oscilaciones se aproximan a un ciclo límite'},...
            {''},{'Admite un término de forzado opcional'}];
            set(handles.explicacion, 'String', explanation);
        otherwise
    end
end

% --- Executes during object creation, after setting all properties.
function selector_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to selector (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called

    % Hint: popupmenu controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
end

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
    % hObject    handle to pushbutton1 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    seleccion = get(handles.selector,'Value');
    switch seleccion  
        case 1
            warndlg('Debe seleccionar un proceso para arrancar la simulación','Error');
        case 2
            corazonMain();
        case 3
            vanDerPolMain();
        case 4
            brussleatorMain();
        case 5
    end
end

% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to axes1 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called

    % Hint: place code in OpeningFcn to populate axes1
end
