% 
% Simulador de procesos naturales
% Borja Bordel
% Marzo 2016
%
% Ventana de configuración del espectro de Lyapunov para 
% el oscilador de Van Der Pol (forzado o no)

function varargout = lyapunovPol(varargin)
    % LYAPUNOVPOL MATLAB code for lyapunovPol.fig
    %      LYAPUNOVPOL, by itself, creates a new LYAPUNOVPOL or raises the existing
    %      singleton*.
    %
    %      H = LYAPUNOVPOL returns the handle to a new LYAPUNOVPOL or the handle to
    %      the existing singleton*.
    %
    %      LYAPUNOVPOL('CALLBACK',hObject,eventData,handles,...) calls the local
    %      function named CALLBACK in LYAPUNOVPOL.M with the given input arguments.
    %
    %      LYAPUNOVPOL('Property','Value',...) creates a new LYAPUNOVPOL or raises the
    %      existing singleton*.  Starting from the left, property value pairs are
    %      applied to the GUI before lyapunovPol_OpeningFcn gets called.  An
    %      unrecognized property name or invalid value makes property application
    %      stop.  All inputs are passed to lyapunovPol_OpeningFcn via varargin.
    %
    %      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
    %      instance to run (singleton)".
    %
    % See also: GUIDE, GUIDATA, GUIHANDLES

    % Edit the above text to modify the response to help lyapunovPol

    % Last Modified by GUIDE v2.5 23-Mar-2016 02:01:29

    % Begin initialization code - DO NOT EDIT
    gui_Singleton = 1;
    gui_State = struct('gui_Name',       mfilename, ...
                       'gui_Singleton',  gui_Singleton, ...
                       'gui_OpeningFcn', @lyapunovPol_OpeningFcn, ...
                       'gui_OutputFcn',  @lyapunovPol_OutputFcn, ...
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

% --- Executes just before lyapunovPol is made visible.
function lyapunovPol_OpeningFcn(hObject, eventdata, handles, varargin)
    % This function has no output args, see OutputFcn.
    % hObject    handle to figure
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    % varargin   command line arguments to lyapunovPol (see VARARGIN)

    % Choose default command line output for lyapunovPol
    handles.output = hObject;

    % Update handles structure
    guidata(hObject, handles);

    % UIWAIT makes lyapunovPol wait for user response (see UIRESUME)
    % uiwait(handles.figure1);
    set(handles.figure1,'CloseRequestFcn',@cerrar);
end

% --- Outputs from this function are returned to the command line.
function varargout = lyapunovPol_OutputFcn(hObject, eventdata, handles) 
    % varargout  cell array for returning output args (see VARARGOUT);
    % hObject    handle to figure
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Get default command line output from handles structure
    varargout{1} = handles.output;
end

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
    % hObject    handle to pushbutton1 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    v1_0 = str2double(get(handles.x1_0,'String'));
    v2_0 = str2double(get(handles.x2_0,'String'));
    v3_0 = str2double(get(handles.x3_0,'String'));

    min = str2double(get(handles.pMin,'String'));
    max = str2double(get(handles.pMax,'String'));
    num = str2double(get(handles.n,'String'));

    if (isnan(v1_0*v2_0*v3_0*min*max*num))
        warndlg('Debe indicar valores para todos los parámetros','Error');
        return;
    end

    global u;
    global A;
    global w;

    p1 = get(handles.mu, 'Value');
    p2 = get(handles.amplitud, 'Value');
    p3 = get(handles.omega, 'Value');

    cd('Lyapunov');

    if (p1)
        EspectroLyapunovVanDerPol([NaN, A, w], min, max, num, [v1_0,v2_0, v3_0]);
    else
        if (p2)
            EspectroLyapunovVanDerPol([u, NaN, w], min, max, num, [v1_0,v2_0, v3_0]);
        else
            if (p3)
                EspectroLyapunovVanDerPol([u, A, NaN], min, max, num, [v1_0,v2_0, v3_0]);
            end
        end
    end

    cd('..');

    close lyapunovPol;
    abrirCerrojo();
end

function pMax_Callback(hObject, eventdata, handles)
    % hObject    handle to pMax (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hints: get(hObject,'String') returns contents of pMax as text
    %        str2double(get(hObject,'String')) returns contents of pMax as a double
end

% --- Executes during object creation, after setting all properties.
function pMax_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to pMax (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called

    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
end


function pMin_Callback(hObject, eventdata, handles)
    % hObject    handle to pMin (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hints: get(hObject,'String') returns contents of pMin as text
    %        str2double(get(hObject,'String')) returns contents of pMin as a double
end

% --- Executes during object creation, after setting all properties.
function pMin_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to pMin (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called

    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
end


function n_Callback(hObject, eventdata, handles)
    % hObject    handle to n (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hints: get(hObject,'String') returns contents of n as text
    %        str2double(get(hObject,'String')) returns contents of n as a double
end

% --- Executes during object creation, after setting all properties.
function n_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to n (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called

    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
end


function x1_0_Callback(hObject, eventdata, handles)
    % hObject    handle to x1_0 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hints: get(hObject,'String') returns contents of x1_0 as text
    %        str2double(get(hObject,'String')) returns contents of x1_0 as a double
end

% --- Executes during object creation, after setting all properties.
function x1_0_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to x1_0 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called

    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
end


function x2_0_Callback(hObject, eventdata, handles)
    % hObject    handle to x2_0 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hints: get(hObject,'String') returns contents of x2_0 as text
    %        str2double(get(hObject,'String')) returns contents of x2_0 as a double
end

% --- Executes during object creation, after setting all properties.
function x2_0_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to x2_0 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called

    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
end


function x3_0_Callback(hObject, eventdata, handles)
    % hObject    handle to x3_0 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hints: get(hObject,'String') returns contents of x3_0 as text
    %        str2double(get(hObject,'String')) returns contents of x3_0 as a double
end

% --- Executes during object creation, after setting all properties.
function x3_0_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to x3_0 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called

    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
end

%%%%%%%%%%%%%%%%%%%%%%
 % CONTROL DE HEBRAS
 %%%%%%%%%%%%%%%%%%%%%%%
 
 % Bloquea la hebra
function abrirCerrojo ()
    global cerrojo;
    cerrojo = 0;
end

% Función de cierre en el boton superior
function cerrar (src, evnt)
    abrirCerrojo();
    delete(gcf);
end