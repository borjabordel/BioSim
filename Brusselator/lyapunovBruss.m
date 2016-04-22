% 
% Simulador de procesos naturales
% Borja Bordel
% Abril 2016
%
% Ventana  para la simulación del espectro de Lyapunov del sistema Brusselator

function varargout = lyapunovBruss(varargin)
    % LYAPUNOVBRUSS MATLAB code for lyapunovBruss.fig
    %      LYAPUNOVBRUSS, by itself, creates a new LYAPUNOVBRUSS or raises the existing
    %      singleton*.
    %
    %      H = LYAPUNOVBRUSS returns the handle to a new LYAPUNOVBRUSS or the handle to
    %      the existing singleton*.
    %
    %      LYAPUNOVBRUSS('CALLBACK',hObject,eventData,handles,...) calls the local
    %      function named CALLBACK in LYAPUNOVBRUSS.M with the given input arguments.
    %
    %      LYAPUNOVBRUSS('Property','Value',...) creates a new LYAPUNOVBRUSS or raises the
    %      existing singleton*.  Starting from the left, property value pairs are
    %      applied to the GUI before lyapunovBruss_OpeningFcn gets called.  An
    %      unrecognized property name or invalid value makes property application
    %      stop.  All inputs are passed to lyapunovBruss_OpeningFcn via varargin.
    %
    %      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
    %      instance to run (singleton)".
    %
    % See also: GUIDE, GUIDATA, GUIHANDLES

    % Edit the above text to modify the response to help lyapunovBruss

    % Last Modified by GUIDE v2.5 16-Apr-2016 16:11:54

    % Begin initialization code - DO NOT EDIT
    gui_Singleton = 1;
    gui_State = struct('gui_Name',       mfilename, ...
                       'gui_Singleton',  gui_Singleton, ...
                       'gui_OpeningFcn', @lyapunovBruss_OpeningFcn, ...
                       'gui_OutputFcn',  @lyapunovBruss_OutputFcn, ...
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

% --- Executes just before lyapunovBruss is made visible.
function lyapunovBruss_OpeningFcn(hObject, eventdata, handles, varargin)
    % This function has no output args, see OutputFcn.
    % hObject    handle to figure
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    % varargin   command line arguments to lyapunovBruss (see VARARGIN)

    % Choose default command line output for lyapunovBruss
    handles.output = hObject;

    % Update handles structure
    guidata(hObject, handles);

    % UIWAIT makes lyapunovBruss wait for user response (see UIRESUME)
    % uiwait(handles.figure1);
    set(handles.figure1,'CloseRequestFcn',@cerrar);
end

% --- Outputs from this function are returned to the command line.
function varargout = lyapunovBruss_OutputFcn(hObject, eventdata, handles) 
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

    min = str2double(get(handles.pmin,'String'));
    max = str2double(get(handles.pmax,'String'));
    num = str2double(get(handles.pnum,'String'));

    if (isnan(v1_0*v2_0*v3_0*min*max*num))
        warndlg('Debe indicar valores para todos los parámetros','Error');
        return;
    end

    global a;
    global b;
    global m;
    global w;

    p1 = get(handles.ca, 'Value');
    p2 = get(handles.cb, 'Value');
    p3 = get(handles.amplitud, 'Value');
    p4 = get(handles.omega, 'Value');
    
    cd('Lyapunov');

    if (p1)
        EspectroLyapunovBrusselator([NaN, b, m, w], min, max, num, [v1_0,v2_0, v3_0]);
    else
        if (p2)
            EspectroLyapunovBrusselator([a, NaN, m, w], min, max, num, [v1_0,v2_0, v3_0]);
        else
            if (p3)
                EspectroLyapunovBrusselator([a, b, NaN, w], min, max, num, [v1_0,v2_0, v3_0]);
            else
                if(p4)
                    EspectroLyapunovBrusselator([a, b, m, NaN], min, max, num, [v1_0,v2_0, v3_0]);
                end
            end
        end
    end

    cd('..');

    close lyapunovBruss;
    abrirCerrojo();
end

function pmax_Callback(hObject, eventdata, handles)
    % hObject    handle to pmax (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hints: get(hObject,'String') returns contents of pmax as text
    %        str2double(get(hObject,'String')) returns contents of pmax as a double
end

% --- Executes during object creation, after setting all properties.
function pmax_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to pmax (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called

    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
end


function pmin_Callback(hObject, eventdata, handles)
    % hObject    handle to pmin (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hints: get(hObject,'String') returns contents of pmin as text
    %        str2double(get(hObject,'String')) returns contents of pmin as a double
end

% --- Executes during object creation, after setting all properties.
function pmin_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to pmin (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called

    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
end


function pnum_Callback(hObject, eventdata, handles)
    % hObject    handle to pnum (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hints: get(hObject,'String') returns contents of pnum as text
    %        str2double(get(hObject,'String')) returns contents of pnum as a double
end

% --- Executes during object creation, after setting all properties.
function pnum_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to pnum (see GCBO)
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