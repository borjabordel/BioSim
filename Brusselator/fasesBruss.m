% 
% Simulador de procesos naturales
% Borja Bordel
% Abril 2016
%
% Ventana general para la simulación del sistema Brusselator

function varargout = fasesBruss(varargin)
    % FASESBRUSS MATLAB code for fasesBruss.fig
    %      FASESBRUSS, by itself, creates a new FASESBRUSS or raises the existing
    %      singleton*.
    %
    %      H = FASESBRUSS returns the handle to a new FASESBRUSS or the handle to
    %      the existing singleton*.
    %
    %      FASESBRUSS('CALLBACK',hObject,eventData,handles,...) calls the local
    %      function named CALLBACK in FASESBRUSS.M with the given input arguments.
    %
    %      FASESBRUSS('Property','Value',...) creates a new FASESBRUSS or raises the
    %      existing singleton*.  Starting from the left, property value pairs are
    %      applied to the GUI before fasesBruss_OpeningFcn gets called.  An
    %      unrecognized property name or invalid value makes property application
    %      stop.  All inputs are passed to fasesBruss_OpeningFcn via varargin.
    %
    %      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
    %      instance to run (singleton)".
    %
    % See also: GUIDE, GUIDATA, GUIHANDLES

    % Edit the above text to modify the response to help fasesBruss

    % Last Modified by GUIDE v2.5 15-Apr-2016 22:18:17

    % Begin initialization code - DO NOT EDIT
    gui_Singleton = 1;
    gui_State = struct('gui_Name',       mfilename, ...
                       'gui_Singleton',  gui_Singleton, ...
                       'gui_OpeningFcn', @fasesBruss_OpeningFcn, ...
                       'gui_OutputFcn',  @fasesBruss_OutputFcn, ...
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

% --- Executes just before fasesBruss is made visible.
function fasesBruss_OpeningFcn(hObject, eventdata, handles, varargin)
    % This function has no output args, see OutputFcn.
    % hObject    handle to figure
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    % varargin   command line arguments to fasesBruss (see VARARGIN)

    % Choose default command line output for fasesBruss
    handles.output = hObject;

    % Update handles structure
    guidata(hObject, handles);

    % UIWAIT makes fasesBruss wait for user response (see UIRESUME)
    % uiwait(handles.figure1);
    set(handles.figure1,'CloseRequestFcn',@cerrar);
end

% --- Outputs from this function are returned to the command line.
function varargout = fasesBruss_OutputFcn(hObject, eventdata, handles) 
    % varargout  cell array for returning output args (see VARARGOUT);
    % hObject    handle to figure
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Get default command line output from handles structure
    varargout{1} = handles.output;
end


function tiempo_Callback(hObject, eventdata, handles)
    % hObject    handle to tiempo (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hints: get(hObject,'String') returns contents of tiempo as text
    %        str2double(get(hObject,'String')) returns contents of tiempo as a double
end

% --- Executes during object creation, after setting all properties.
function tiempo_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to tiempo (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called

    % Hint: edit controls usually have a white background on Windows.
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
    v1_0 = str2double(get(handles.x1_0,'String'));
    v2_0 = str2double(get(handles.x2_0,'String'));
    v3_0 = str2double(get(handles.x3_0,'String'));

    T = str2double(get(handles.tiempo,'String'));

    if (isnan(T*v1_0*v2_0*v3_0))
        warndlg('Debe indicar valores para todos los parámetros','Error');
        return;
    end

    s1 = get(handles.x1, 'Value');
    s2 = get(handles.x2, 'Value');
    s3 = get(handles.x3, 'Value');

    if (s1)
        if (s2)
            if (s3)
                caso = 7;
            else
                caso = 4;
            end
        else
            if (s3)
                caso = 5;
            else
                warndlg('Debe seleccionar al menos 2 señales','Error');
                return;
            end
        end
    else
        if (s2)
            if (s3)
                caso = 6;
            else
                warndlg('Debe seleccionar al menos 2 señales','Error');
                return;
            end
        else
            if (s3)
                warndlg('Debe seleccionar al menos 2 señales','Error');
                return;
            else
                warndlg('Debe seleccionar las señales que desea simular','Error');
                return;
            end
        end
    end
    
    global a;
    global b;
    global m;
    global w

    cd('Atractor');

    PintaBrusselatorForzado(a, b, m, w, v1_0, v2_0, v3_0, T, caso);

    cd('..');

    close fasesBruss;
    abrirCerrojo();
end

% --- Executes on button press in x1.
function x1_Callback(hObject, eventdata, handles)
    % hObject    handle to x1 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hint: get(hObject,'Value') returns toggle state of x1
end

% --- Executes on button press in x2.
function x2_Callback(hObject, eventdata, handles)
    % hObject    handle to x2 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hint: get(hObject,'Value') returns toggle state of x2
end

% --- Executes on button press in x3.
function x3_Callback(hObject, eventdata, handles)
    % hObject    handle to x3 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hint: get(hObject,'Value') returns toggle state of x3
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