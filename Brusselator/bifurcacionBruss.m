% 
% Simulador de procesos naturales
% Borja Bordel
% Abril 2016
%
% Ventana para la obtención del diagrama de bifurcación del sistema Brusselator

function varargout = bifurcacionBruss(varargin)
    % BIFURCACIONBRUSS MATLAB code for bifurcacionBruss.fig
    %      BIFURCACIONBRUSS, by itself, creates a new BIFURCACIONBRUSS or raises the existing
    %      singleton*.
    %
    %      H = BIFURCACIONBRUSS returns the handle to a new BIFURCACIONBRUSS or the handle to
    %      the existing singleton*.
    %
    %      BIFURCACIONBRUSS('CALLBACK',hObject,eventData,handles,...) calls the local
    %      function named CALLBACK in BIFURCACIONBRUSS.M with the given input arguments.
    %
    %      BIFURCACIONBRUSS('Property','Value',...) creates a new BIFURCACIONBRUSS or raises the
    %      existing singleton*.  Starting from the left, property value pairs are
    %      applied to the GUI before bifurcacionBruss_OpeningFcn gets called.  An
    %      unrecognized property name or invalid value makes property application
    %      stop.  All inputs are passed to bifurcacionBruss_OpeningFcn via varargin.
    %
    %      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
    %      instance to run (singleton)".
    %
    % See also: GUIDE, GUIDATA, GUIHANDLES

    % Edit the above text to modify the response to help bifurcacionBruss

    % Last Modified by GUIDE v2.5 16-Apr-2016 04:05:50

    % Begin initialization code - DO NOT EDIT
    gui_Singleton = 1;
    gui_State = struct('gui_Name',       mfilename, ...
                       'gui_Singleton',  gui_Singleton, ...
                       'gui_OpeningFcn', @bifurcacionBruss_OpeningFcn, ...
                       'gui_OutputFcn',  @bifurcacionBruss_OutputFcn, ...
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

% --- Executes just before bifurcacionBruss is made visible.
function bifurcacionBruss_OpeningFcn(hObject, eventdata, handles, varargin)
    % This function has no output args, see OutputFcn.
    % hObject    handle to figure
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    % varargin   command line arguments to bifurcacionBruss (see VARARGIN)

    % Choose default command line output for bifurcacionBruss
    handles.output = hObject;

    % Update handles structure
    guidata(hObject, handles);

    % UIWAIT makes bifurcacionBruss wait for user response (see UIRESUME)
    % uiwait(handles.figure1);
    set(handles.figure1,'CloseRequestFcn',@cerrar);
end

% --- Outputs from this function are returned to the command line.
function varargout = bifurcacionBruss_OutputFcn(hObject, eventdata, handles) 
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

    s1 = get(handles.x1, 'Value');
    s2 = get(handles.x2, 'Value');
    s3 = get(handles.x3, 'Value');

    if (s1)
        sennal = 1;
    else if (s2)
            sennal = 2;
    else if (s3)
            sennal = 3;
        end
        end
    end

    global a;
    global b;
    global m;
    global w;

    p1 = get(handles.ca, 'Value');
    p2 = get(handles.cb, 'Value');
    p3 = get(handles.amplitud, 'Value');
    p4 = get(handles.omega, 'Value');
    
    cd('Bifurcacion');

    if (p1)
        BifurcacionBrusselator([NaN, b, m, w], min, max, num, v1_0,v2_0, v3_0, sennal);
    else
        if (p2)
            BifurcacionBrusselator([a, NaN, m, w], min, max, num, v1_0,v2_0, v3_0, sennal);
        else
            if (p3)
                BifurcacionBrusselator([a, b, NaN, w], min, max, num, v1_0,v2_0, v3_0, sennal);
            else
                if(p4)
                    BifurcacionBrusselator([a, b, m, NaN], min, max, num, v1_0,v2_0, v3_0, sennal);
                end
            end
        end
    end

    cd('..');

    close bifurcacionBruss;
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