% 
% Simulador de procesos naturales
% Borja Bordel
% Febrero 2016
%
% Ventana de simulación del oscilador de Van Der Pol (forzado o no)

function varargout = corazonMain(varargin)
    % CORAZONMAIN MATLAB code for corazonMain.fig
    %      CORAZONMAIN, by itself, creates a new CORAZONMAIN or raises the existing
    %      singleton*.
    %
    %      H = CORAZONMAIN returns the handle to a new CORAZONMAIN or the handle to
    %      the existing singleton*.
    %
    %      CORAZONMAIN('CALLBACK',hObject,eventData,handles,...) calls the local
    %      function named CALLBACK in CORAZONMAIN.M with the given input arguments.
    %
    %      CORAZONMAIN('Property','Value',...) creates a new CORAZONMAIN or raises the
    %      existing singleton*.  Starting from the left, property value pairs are
    %      applied to the GUI before corazonMain_OpeningFcn gets called.  An
    %      unrecognized property name or invalid value makes property application
    %      stop.  All inputs are passed to corazonMain_OpeningFcn via varargin.
    %
    %      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
    %      instance to run (singleton)".
    %
    % See also: GUIDE, GUIDATA, GUIHANDLES

    % Edit the above text to modify the response to help corazonMain

    % Last Modified by GUIDE v2.5 21-Feb-2016 12:55:19

    % Begin initialization code - DO NOT EDIT
    gui_Singleton = 1;
    gui_State = struct('gui_Name',       mfilename, ...
                       'gui_Singleton',  gui_Singleton, ...
                       'gui_OpeningFcn', @corazonMain_OpeningFcn, ...
                       'gui_OutputFcn',  @corazonMain_OutputFcn, ...
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


% --- Executes just before corazonMain is made visible.
function corazonMain_OpeningFcn(hObject, eventdata, handles, varargin)
    % This function has no output args, see OutputFcn.
    % hObject    handle to figure
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    % varargin   command line arguments to corazonMain (see VARARGIN)

    % Choose default command line output for corazonMain
    handles.output = hObject;

    % Update handles structure
    guidata(hObject, handles);

    % UIWAIT makes corazonMain wait for user response (see UIRESUME)
    % uiwait(handles.figure1);

    handles.picture=imread('circuito.png'); 
    imagesc(handles.picture); 
    axis off

    global u;
    global A;
    global w;

    u = 10;
    A = 1;
    w = 6.28;

    set(handles.paramU, 'String', num2str(u));
    set(handles.paramA, 'String', num2str(A));
    set(handles.paramW, 'String', num2str(w));
end

% --- Outputs from this function are returned to the command line.
function varargout = corazonMain_OutputFcn(hObject, eventdata, handles) 
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
    cd('VanDerPol');
    parametrosPol();
    cerrarCerrojo();
    cd('..');
    
    global u;
    global A;
    global w;
    
    set(handles.paramU, 'String', num2str(u));
    set(handles.paramA, 'String', num2str(A));
    set(handles.paramW, 'String', num2str(w));
end

% --------------------------------------------------------------------
function temporal_Callback(hObject, eventdata, handles)
    % hObject    handle to temporal (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    cd('VanDerPol');
    temporalPol();
    cerrarCerrojo();
    cd('..');
end

% --------------------------------------------------------------------
function bifurcacion_Callback(hObject, eventdata, handles)
    % hObject    handle to bifurcacion (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    cd('VanDerPol');
    bifurcacionPol();
    cerrarCerrojo();
    cd('..');
end

% --------------------------------------------------------------------
function fourier_Callback(hObject, eventdata, handles)
    % hObject    handle to fourier (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    cd('VanDerPol');
    fourierPol();
    cerrarCerrojo();
    cd('..');
end

% --------------------------------------------------------------------
function torsion_Callback(hObject, eventdata, handles)
    % hObject    handle to torsion (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    cd('VanDerPol');
    torsionPol();
    cerrarCerrojo();
    cd('..');
end

% --------------------------------------------------------------------
function pdh_Callback(hObject, eventdata, handles)
    % hObject    handle to pdh (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    cd('VanDerPol');
    pdhPol();
    cerrarCerrojo();
    cd('..');
end

% --------------------------------------------------------------------
function atractor_Callback(hObject, eventdata, handles)
    % hObject    handle to atractor (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    cd('VanDerPol');
    fasesPol();
    cerrarCerrojo();
    cd('..');
end

% --------------------------------------------------------------------
function estadistica_Callback(hObject, eventdata, handles)
    % hObject    handle to estadistica (see GCBO)
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
function poincare_Callback(hObject, eventdata, handles)
    % hObject    handle to poincare (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    cd('VanDerPol');
    poincarePol();
    cerrarCerrojo();
    cd('..');
end

% --------------------------------------------------------------------
function retorno_Callback(hObject, eventdata, handles)
    % hObject    handle to retorno (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    cd('VanDerPol');
    retornoPol();
    cerrarCerrojo();
    cd('..');
end

% --------------------------------------------------------------------
function autocorrelacion_Callback(hObject, eventdata, handles)
    % hObject    handle to autocorrelacion (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    cd('VanDerPol');
    autoPol();
    cerrarCerrojo();
    cd('..');
end


% --------------------------------------------------------------------
function espacioFases_Callback(hObject, eventdata, handles)
    % hObject    handle to espacioFases (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
end

% --------------------------------------------------------------------
function lyapunov_Callback(hObject, eventdata, handles)
    % hObject    handle to lyapunov (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    cd('VanDerPol');
    lyapunovPol();
    cerrarCerrojo();
    cd('..');
end

% --------------------------------------------------------------------
function entropia_Callback(hObject, eventdata, handles)
    % hObject    handle to entropia (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    cd('VanDerPol');
    entropiaPol();
    cerrarCerrojo();
    cd('..');
end

% --------------------------------------------------------------------
function dimensiones_Callback(hObject, eventdata, handles)
    % hObject    handle to dimensiones (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    cd('VanDerPol');
    dimensionesPol();
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
