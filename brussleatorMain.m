% 
% Simulador de procesos naturales
% Borja Bordel
% Abril 2016
%
% Ventana general para la simulación del sistema Brusselator

function varargout = brussleatorMain(varargin)
    % BRUSSLEATORMAIN MATLAB code for brussleatorMain.fig
    %      BRUSSLEATORMAIN, by itself, creates a new BRUSSLEATORMAIN or raises the existing
    %      singleton*.
    %
    %      H = BRUSSLEATORMAIN returns the handle to a new BRUSSLEATORMAIN or the handle to
    %      the existing singleton*.
    %
    %      BRUSSLEATORMAIN('CALLBACK',hObject,eventData,handles,...) calls the local
    %      function named CALLBACK in BRUSSLEATORMAIN.M with the given input arguments.
    %
    %      BRUSSLEATORMAIN('Property','Value',...) creates a new BRUSSLEATORMAIN or raises the
    %      existing singleton*.  Starting from the left, property value pairs are
    %      applied to the GUI before brussleatorMain_OpeningFcn gets called.  An
    %      unrecognized property name or invalid value makes property application
    %      stop.  All inputs are passed to brussleatorMain_OpeningFcn via varargin.
    %
    %      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
    %      instance to run (singleton)".
    %
    % See also: GUIDE, GUIDATA, GUIHANDLES

    % Edit the above text to modify the response to help brussleatorMain

    % Last Modified by GUIDE v2.5 15-Apr-2016 22:25:11

    % Begin initialization code - DO NOT EDIT
    gui_Singleton = 1;
    gui_State = struct('gui_Name',       mfilename, ...
                       'gui_Singleton',  gui_Singleton, ...
                       'gui_OpeningFcn', @brussleatorMain_OpeningFcn, ...
                       'gui_OutputFcn',  @brussleatorMain_OutputFcn, ...
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

% --- Executes just before brussleatorMain is made visible.
function brussleatorMain_OpeningFcn(hObject, eventdata, handles, varargin)
    % This function has no output args, see OutputFcn.
    % hObject    handle to figure
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    % varargin   command line arguments to brussleatorMain (see VARARGIN)

    % Choose default command line output for brussleatorMain
    handles.output = hObject;

    % Update handles structure
    guidata(hObject, handles);

    % UIWAIT makes brussleatorMain wait for user response (see UIRESUME)
    % uiwait(handles.figure1);

    global a;
    global b;
    global m;
    global w;

    a = 0.4;
    b = 1.2;
    m = 1;
    w = 1;

    set(handles.paramB, 'String', num2str(b));
    set(handles.paramA, 'String', num2str(a));
    set(handles.paramW, 'String', num2str(w));
    set(handles.paramM, 'String', num2str(m));
end

% --- Outputs from this function are returned to the command line.
function varargout = brussleatorMain_OutputFcn(hObject, eventdata, handles) 
    % varargout  cell array for returning output args (see VARARGOUT);
    % hObject    handle to figure
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Get default command line output from handles structure
    varargout{1} = handles.output;
end

% --------------------------------------------------------------------
function param_Callback(hObject, eventdata, handles)
    % hObject    handle to param (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    cd('Brusselator');
    parametrosBruss();
    cerrarCerrojo();
    cd('..');
    
    global a;
    global b;
    global m;
    global w;
    
    set(handles.paramB, 'String', num2str(b));
    set(handles.paramA, 'String', num2str(a));
    set(handles.paramW, 'String', num2str(w));
    set(handles.paramM, 'String', num2str(m));
end

% --------------------------------------------------------------------
function temporal_Callback(hObject, eventdata, handles)
    % hObject    handle to temporal (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    cd('Brusselator');
    temporalBruss();
    cerrarCerrojo();
    cd('..');
end

% --------------------------------------------------------------------
function atractor_Callback(hObject, eventdata, handles)
    % hObject    handle to atractor (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    cd('Brusselator');
    fasesBruss();
    cerrarCerrojo();
    cd('..');
end

% --------------------------------------------------------------------
function fourier_Callback(hObject, eventdata, handles)
    % hObject    handle to fourier (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    cd('Brusselator');
    fourierBruss();
    cerrarCerrojo();
    cd('..');
end

% --------------------------------------------------------------------
function bifurcacion_Callback(hObject, eventdata, handles)
    % hObject    handle to bifurcacion (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    cd('Brusselator');
    bifurcacionBruss();
    cerrarCerrojo();
    cd('..');
end

% --------------------------------------------------------------------
function estadisticos_Callback(hObject, eventdata, handles)
    % hObject    handle to estadisticos (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
end

% --------------------------------------------------------------------
function mapas_Callback(hObject, eventdata, handles)
    % hObject    handle to mapas (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
end

% --------------------------------------------------------------------
function lyapunov_Callback(hObject, eventdata, handles)
    % hObject    handle to lyapunov (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    cd('Brusselator');
    lyapunovBruss();
    cerrarCerrojo();
    cd('..');
end

% --------------------------------------------------------------------
function poincare_Callback(hObject, eventdata, handles)
    % hObject    handle to poincare (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    cd('Brusselator');
    poincareBruss();
    cerrarCerrojo();
    cd('..');
end

% --------------------------------------------------------------------
function retorno_Callback(hObject, eventdata, handles)
    % hObject    handle to retorno (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    cd('Brusselator');
    retornoBruss();
    cerrarCerrojo();
    cd('..');
end

% --------------------------------------------------------------------
function pdh_Callback(hObject, eventdata, handles)
    % hObject    handle to pdh (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    cd('Brusselator');
    pdhBruss();
    cerrarCerrojo();
    cd('..');
end

% --------------------------------------------------------------------
function auto_Callback(hObject, eventdata, handles)
    % hObject    handle to auto (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    cd('Brusselator');
    autoBruss();
    cerrarCerrojo();
    cd('..');
end

%%%%%%%%%%%%%%%%%%%%%%
 % CONTROL DE HEBRAS
 %%%%%%%%%%%%%%%%%%%%%%%
 
 % Bloquea la hebra
function cerrarCerrojo ()
    global cerrojo;
    cerrojo = 1;
    while cerrojo
        pause (0.1);
    end
end


% --------------------------------------------------------------------
function fases_Callback(hObject, eventdata, handles)
    % hObject    handle to fases (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
end