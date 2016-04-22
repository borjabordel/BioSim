% 
% Simulador de procesos naturales
% Borja Bordel
% Abril 2016
%
% Ventana para la obtención del diagrama de bifurcación del corazón

function varargout = bifurcacionCorazon(varargin)
    % BIFURCACIONCORAZON MATLAB code for bifurcacionCorazon.fig
    %      BIFURCACIONCORAZON, by itself, creates a new BIFURCACIONCORAZON or raises the existing
    %      singleton*.
    %
    %      H = BIFURCACIONCORAZON returns the handle to a new BIFURCACIONCORAZON or the handle to
    %      the existing singleton*.
    %
    %      BIFURCACIONCORAZON('CALLBACK',hObject,eventData,handles,...) calls the local
    %      function named CALLBACK in BIFURCACIONCORAZON.M with the given input arguments.
    %
    %      BIFURCACIONCORAZON('Property','Value',...) creates a new BIFURCACIONCORAZON or raises the
    %      existing singleton*.  Starting from the left, property value pairs are
    %      applied to the GUI before bifurcacionCorazon_OpeningFcn gets called.  An
    %      unrecognized property name or invalid value makes property application
    %      stop.  All inputs are passed to bifurcacionCorazon_OpeningFcn via varargin.
    %
    %      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
    %      instance to run (singleton)".
    %
    % See also: GUIDE, GUIDATA, GUIHANDLES

    % Edit the above text to modify the response to help bifurcacionCorazon

    % Last Modified by GUIDE v2.5 02-Apr-2016 17:29:26

    % Begin initialization code - DO NOT EDIT
    gui_Singleton = 1;
    gui_State = struct('gui_Name',       mfilename, ...
                       'gui_Singleton',  gui_Singleton, ...
                       'gui_OpeningFcn', @bifurcacionCorazon_OpeningFcn, ...
                       'gui_OutputFcn',  @bifurcacionCorazon_OutputFcn, ...
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

% --- Executes just before bifurcacionCorazon is made visible.
function bifurcacionCorazon_OpeningFcn(hObject, eventdata, handles, varargin)
    % This function has no output args, see OutputFcn.
    % hObject    handle to figure
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    % varargin   command line arguments to bifurcacionCorazon (see VARARGIN)

    % Choose default command line output for bifurcacionCorazon
    handles.output = hObject;

    % Update handles structure
    guidata(hObject, handles);

    % UIWAIT makes bifurcacionCorazon wait for user response (see UIRESUME)
    % uiwait(handles.figure1);
    set(handles.figure1,'CloseRequestFcn',@cerrar);
end

% --- Outputs from this function are returned to the command line.
function varargout = bifurcacionCorazon_OutputFcn(hObject, eventdata, handles) 
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
    v4_0 = str2double(get(handles.x4_0,'String'));

    min = str2double(get(handles.pmin,'String'));
    max = str2double(get(handles.pmax,'String'));
    num = str2double(get(handles.numero,'String'));

    if (isnan(v1_0*v2_0*v3_0*v4_0*min*max*num))
        warndlg('Debe indicar valores para todos los parámetros','Error');
        return;
    end

    s1 = get(handles.x1, 'Value');
    s2 = get(handles.x2, 'Value');
    s3 = get(handles.x3, 'Value');
    s4 = get(handles.x4, 'Value');

    if (s1)
        sennal = 1;
    else if (s2)
            sennal = 2;
    else if (s3)
            sennal = 3;
        else if (s4)
                sennal = 4;
            end        
        end
        end
    end

    p1 = get(handles.pc1, 'Value');
    p2 = get(handles.pc2, 'Value');

    cd('Bifurcacion');
    global k;
    global w1;
    global w2;
    global a;
    global f;
    global b1;
    global b2;
    global c1;
    global c2;

    if (p1)
        BifurcacionCorazon(k, w1, w2, a, f, b1, b2, NaN, c2, max, min, num, v1_0,v2_0, v3_0, v4_0, sennal);
    else
        if (p2)
            BifurcacionCorazon(k, w1, w2, a, f, b1, b2, c1, NaN, max, min, num, v1_0,v2_0, v3_0, v4_0, sennal);
        end
    end

    cd('..');

    close bifurcacionCorazon;
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


function numero_Callback(hObject, eventdata, handles)
    % hObject    handle to numero (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hints: get(hObject,'String') returns contents of numero as text
    %        str2double(get(hObject,'String')) returns contents of numero as a double
end

% --- Executes during object creation, after setting all properties.
function numero_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to numero (see GCBO)
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


function x4_0_Callback(hObject, eventdata, handles)
    % hObject    handle to x4_0 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hints: get(hObject,'String') returns contents of x4_0 as text
    %        str2double(get(hObject,'String')) returns contents of x4_0 as a double
end

% --- Executes during object creation, after setting all properties.
function x4_0_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to x4_0 (see GCBO)
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