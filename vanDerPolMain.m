% 
% Simulador de procesos naturales
% Borja Bordel
% Abril 2016
%
% Ventana general para la simulación del corazón

function varargout = vanDerPolMain(varargin)
    % VANDERPOLMAIN MATLAB code for vanDerPolMain.fig
    %      VANDERPOLMAIN, by itself, creates a new VANDERPOLMAIN or raises the existing
    %      singleton*.
    %
    %      H = VANDERPOLMAIN returns the handle to a new VANDERPOLMAIN or the handle to
    %      the existing singleton*.
    %
    %      VANDERPOLMAIN('CALLBACK',hObject,eventData,handles,...) calls the local
    %      function named CALLBACK in VANDERPOLMAIN.M with the given input arguments.
    %
    %      VANDERPOLMAIN('Property','Value',...) creates a new VANDERPOLMAIN or raises the
    %      existing singleton*.  Starting from the left, property value pairs are
    %      applied to the GUI before vanDerPolMain_OpeningFcn gets called.  An
    %      unrecognized property name or invalid value makes property application
    %      stop.  All inputs are passed to vanDerPolMain_OpeningFcn via varargin.
    %
    %      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
    %      instance to run (singleton)".
    %
    % See also: GUIDE, GUIDATA, GUIHANDLES

    % Edit the above text to modify the response to help vanDerPolMain

    % Last Modified by GUIDE v2.5 29-Mar-2016 12:43:21

    % Begin initialization code - DO NOT EDIT
    gui_Singleton = 1;
    gui_State = struct('gui_Name',       mfilename, ...
                       'gui_Singleton',  gui_Singleton, ...
                       'gui_OpeningFcn', @vanDerPolMain_OpeningFcn, ...
                       'gui_OutputFcn',  @vanDerPolMain_OutputFcn, ...
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

% --- Executes just before vanDerPolMain is made visible.
function vanDerPolMain_OpeningFcn(hObject, eventdata, handles, varargin)
    % This function has no output args, see OutputFcn.
    % hObject    handle to figure
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    % varargin   command line arguments to vanDerPolMain (see VARARGIN)

    % Choose default command line output for vanDerPolMain
    handles.output = hObject;

    % Update handles structure
    guidata(hObject, handles);

    % UIWAIT makes vanDerPolMain wait for user response (see UIRESUME)
    % uiwait(handles.figure1);

    handles.picture=imread('corazon.png'); 
    imagesc(handles.picture); 
    axis off

    global w1;
    global w2;
    global b1;
    global b2;
    global k;
    global c1;
    global c2
    global a;
    global f;

    w1 = -0.2;
    w2 = 1.9;
    b1 = 1;
    b2 = 0.66;
    k = -1.45;
    c1 = 0;
    c2 = 0.16;
    f = 1;
    a = 1;


    set(handles.paramW1, 'String', num2str(w1));
    set(handles.paramW2, 'String', num2str(w2));
    set(handles.paramB1, 'String', num2str(b1));
    set(handles.paramB2, 'String', num2str(b2));
    set(handles.paramK, 'String', num2str(k));
    set(handles.paramC1, 'String', num2str(c1));
    set(handles.paramC2, 'String', num2str(c2));
    set(handles.paramF, 'String', num2str(f));
    set(handles.paramA, 'String', num2str(a));
end

% --- Outputs from this function are returned to the command line.
function varargout = vanDerPolMain_OutputFcn(hObject, eventdata, handles) 
    % varargout  cell array for returning output args (see VARARGOUT);
    % hObject    handle to figure
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Get default command line output from handles structure
    varargout{1} = handles.output;
end

% --------------------------------------------------------------------
function parametros_Callback(hObject, eventdata, handles)
    % hObject    handle to parametros (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    cd('Corazon');
    parametrosCorazon();
    cerrarCerrojo();
    cd('..');
    
    global w1;
    global w2;
    global b1;
    global b2;
    global k;
    global c1;
    global c2
    global a;
    global f;
    
    set(handles.paramW1, 'String', num2str(w1));
    set(handles.paramW2, 'String', num2str(w2));
    set(handles.paramB1, 'String', num2str(b1));
    set(handles.paramB2, 'String', num2str(b2));
    set(handles.paramK, 'String', num2str(k));
    set(handles.paramC1, 'String', num2str(c1));
    set(handles.paramC2, 'String', num2str(c2));
    set(handles.paramF, 'String', num2str(f));
    set(handles.paramA, 'String', num2str(a)); 
end

% --------------------------------------------------------------------
function temporal_Callback(hObject, eventdata, handles)
    % hObject    handle to temporal (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    cd('Corazon');
    temporalCorazon();
    cerrarCerrojo();
    cd('..');
end

% --------------------------------------------------------------------
function bifurcacion_Callback(hObject, eventdata, handles)
    % hObject    handle to bifurcacion (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    cd('Corazon');
    bifurcacionCorazon();
    cerrarCerrojo();
    cd('..');
end

% --------------------------------------------------------------------
function fourier_Callback(hObject, eventdata, handles)
    % hObject    handle to fourier (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    cd('Corazon');
    fourierCorazon();
    cerrarCerrojo();
    cd('..');
end

% --------------------------------------------------------------------
function pdh_Callback(hObject, eventdata, handles)
    % hObject    handle to pdh (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    cd('Corazon');
    pdhCorazon();
    cerrarCerrojo();
    cd('..');
end

% --------------------------------------------------------------------
function atractor_Callback(hObject, eventdata, handles)
    % hObject    handle to atractor (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    cd('Corazon');
    fasesCorazon();
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
function retorno_Callback(hObject, eventdata, handles)
    % hObject    handle to retorno (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    cd('Corazon');
    retornoCorazon();
    cerrarCerrojo();
    cd('..');
end

% --------------------------------------------------------------------
function lyapunov_Callback(hObject, eventdata, handles)
    % hObject    handle to lyapunov (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    cd('Corazon');
    LyapunovCorazon();
    cerrarCerrojo();
    cd('..');
end

% --------------------------------------------------------------------
function torsion_Callback(hObject, eventdata, handles)
    % hObject    handle to torsion (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    cd('Corazon');
    torsionCorazon();
    cerrarCerrojo();
    cd('..');
end

% --------------------------------------------------------------------
function auto_Callback(hObject, eventdata, handles)
    % hObject    handle to auto (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    cd('Corazon');
    autoCorazon();
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