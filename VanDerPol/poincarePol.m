% 
% Simulador de procesos naturales
% Borja Bordel
% Marzo 2016
%
% Ventana para la selección de parámetro de la sección de Poincaré

function varargout = poincarePol(varargin)
    % POINCAREPOL MATLAB code for poincarePol.fig
    %      POINCAREPOL, by itself, creates a new POINCAREPOL or raises the existing
    %      singleton*.
    %
    %      H = POINCAREPOL returns the handle to a new POINCAREPOL or the handle to
    %      the existing singleton*.
    %
    %      POINCAREPOL('CALLBACK',hObject,eventData,handles,...) calls the local
    %      function named CALLBACK in POINCAREPOL.M with the given input arguments.
    %
    %      POINCAREPOL('Property','Value',...) creates a new POINCAREPOL or raises the
    %      existing singleton*.  Starting from the left, property value pairs are
    %      applied to the GUI before poincarePol_OpeningFcn gets called.  An
    %      unrecognized property name or invalid value makes property application
    %      stop.  All inputs are passed to poincarePol_OpeningFcn via varargin.
    %
    %      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
    %      instance to run (singleton)".
    %
    % See also: GUIDE, GUIDATA, GUIHANDLES

    % Edit the above text to modify the response to help poincarePol

    % Last Modified by GUIDE v2.5 22-Mar-2016 17:27:25

    % Begin initialization code - DO NOT EDIT
    gui_Singleton = 1;
    gui_State = struct('gui_Name',       mfilename, ...
                       'gui_Singleton',  gui_Singleton, ...
                       'gui_OpeningFcn', @poincarePol_OpeningFcn, ...
                       'gui_OutputFcn',  @poincarePol_OutputFcn, ...
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

% --- Executes just before poincarePol is made visible.
function poincarePol_OpeningFcn(hObject, eventdata, handles, varargin)
    % This function has no output args, see OutputFcn.
    % hObject    handle to figure
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    % varargin   command line arguments to poincarePol (see VARARGIN)

    % Choose default command line output for poincarePol
    handles.output = hObject;

    % Update handles structure
    guidata(hObject, handles);

    % UIWAIT makes poincarePol wait for user response (see UIRESUME)
    % uiwait(handles.figure1);
    set(handles.figure1,'CloseRequestFcn',@cerrar);
end

% --- Outputs from this function are returned to the command line.
function varargout = poincarePol_OutputFcn(hObject, eventdata, handles) 
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

    pt1 = str2double(get(handles.p1,'String'));
    pt2 = str2double(get(handles.p2,'String'));
    pt3 = str2double(get(handles.p3,'String'));

    n1 = str2double(get(handles.v1,'String'));
    n2 = str2double(get(handles.v2,'String'));
    n3 = str2double(get(handles.v3,'String'));

    if (isnan(v1_0*v2_0*v3_0*pt1*pt2*pt3*n1*n2*n3))
        warndlg('Debe indicar valores para todos los parámetros','Error');
        return;
    end

    cd('Poincare');

    global u;
    global A;
    global w;

    cortaPoincareVanDerPol ([n1, n2, n3], [pt1, pt2, pt3], u, A, w, v1_0, v2_0, v3_0);

    cd('..');
    close poincarePol;

    abrirCerrojo();
end

function v3_Callback(hObject, eventdata, handles)
    % hObject    handle to v3 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hints: get(hObject,'String') returns contents of v3 as text
    %        str2double(get(hObject,'String')) returns contents of v3 as a double
end

% --- Executes during object creation, after setting all properties.
function v3_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to v3 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called

    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
end


function v2_Callback(hObject, eventdata, handles)
    % hObject    handle to v2 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hints: get(hObject,'String') returns contents of v2 as text
    %        str2double(get(hObject,'String')) returns contents of v2 as a double
end

% --- Executes during object creation, after setting all properties.
function v2_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to v2 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called

    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
end


function v1_Callback(hObject, eventdata, handles)
    % hObject    handle to v1 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hints: get(hObject,'String') returns contents of v1 as text
    %        str2double(get(hObject,'String')) returns contents of v1 as a double
end

% --- Executes during object creation, after setting all properties.
function v1_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to v1 (see GCBO)
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


function p1_Callback(hObject, eventdata, handles)
    % hObject    handle to p1 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hints: get(hObject,'String') returns contents of p1 as text
    %        str2double(get(hObject,'String')) returns contents of p1 as a double
end

% --- Executes during object creation, after setting all properties.
function p1_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to p1 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called

    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
end


function p2_Callback(hObject, eventdata, handles)
    % hObject    handle to p2 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hints: get(hObject,'String') returns contents of p2 as text
    %        str2double(get(hObject,'String')) returns contents of p2 as a double
end

% --- Executes during object creation, after setting all properties.
function p2_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to p2 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called

    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
end


function p3_Callback(hObject, eventdata, handles)
    % hObject    handle to p3 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hints: get(hObject,'String') returns contents of p3 as text
    %        str2double(get(hObject,'String')) returns contents of p3 as a double
end

% --- Executes during object creation, after setting all properties.
function p3_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to p3 (see GCBO)
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
