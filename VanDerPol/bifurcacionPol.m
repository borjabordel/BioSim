% 
% Simulador de procesos naturales
% Borja Bordel
% Febrero 2016
%
% Ventana de configuración del diagarama de bifurcacion para 
% el oscilador de Van Der Pol (forzado o no)

function varargout = bifurcacionPol(varargin)
    % BIFURCACIONPOL MATLAB code for bifurcacionPol.fig
    %      BIFURCACIONPOL, by itself, creates a new BIFURCACIONPOL or raises the existing
    %      singleton*.
    %
    %      H = BIFURCACIONPOL returns the handle to a new BIFURCACIONPOL or the handle to
    %      the existing singleton*.
    %
    %      BIFURCACIONPOL('CALLBACK',hObject,eventData,handles,...) calls the local
    %      function named CALLBACK in BIFURCACIONPOL.M with the given input arguments.
    %
    %      BIFURCACIONPOL('Property','Value',...) creates a new BIFURCACIONPOL or raises the
    %      existing singleton*.  Starting from the left, property value pairs are
    %      applied to the GUI before bifurcacionPol_OpeningFcn gets called.  An
    %      unrecognized property name or invalid value makes property application
    %      stop.  All inputs are passed to bifurcacionPol_OpeningFcn via varargin.
    %
    %      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
    %      instance to run (singleton)".
    %
    % See also: GUIDE, GUIDATA, GUIHANDLES

    % Edit the above text to modify the response to help bifurcacionPol

    % Last Modified by GUIDE v2.5 29-Feb-2016 00:22:53

    % Begin initialization code - DO NOT EDIT
    gui_Singleton = 1;
    gui_State = struct('gui_Name',       mfilename, ...
                       'gui_Singleton',  gui_Singleton, ...
                       'gui_OpeningFcn', @bifurcacionPol_OpeningFcn, ...
                       'gui_OutputFcn',  @bifurcacionPol_OutputFcn, ...
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

% --- Executes just before bifurcacionPol is made visible.
function bifurcacionPol_OpeningFcn(hObject, eventdata, handles, varargin)
    % This function has no output args, see OutputFcn.
    % hObject    handle to figure
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    % varargin   command line arguments to bifurcacionPol (see VARARGIN)

    % Choose default command line output for bifurcacionPol
    handles.output = hObject;

    % Update handles structure
    guidata(hObject, handles);

    % UIWAIT makes bifurcacionPol wait for user response (see UIRESUME)
    % uiwait(handles.figure1);
    set(handles.figure1,'CloseRequestFcn',@cerrar);
end

% --- Outputs from this function are returned to the command line.
function varargout = bifurcacionPol_OutputFcn(hObject, eventdata, handles) 
    % varargout  cell array for returning output args (see VARARGOUT);
    % hObject    handle to figure
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Get default command line output from handles structure
    varargout{1} = handles.output;
end


function edit4_Callback(hObject, eventdata, handles)
    % hObject    handle to edit4 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hints: get(hObject,'String') returns contents of edit4 as text
    %        str2double(get(hObject,'String')) returns contents of edit4 as a double
end

% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to edit4 (see GCBO)
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

    min = str2double(get(handles.pMin,'String'));
    max = str2double(get(handles.pMax,'String'));
    num = str2double(get(handles.n,'String'));

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

    global u;
    global A;
    global w;

    p1 = get(handles.mu, 'Value');
    p2 = get(handles.amplitud, 'Value');
    p3 = get(handles.omega, 'Value');

    cd('Bifurcacion');

    if (p1)
        BifurcacionVanDerPol([NaN, A, w], min, max, num, v1_0,v2_0, v3_0, sennal);
    else
        if (p2)
            BifurcacionVanDerPol([u, NaN, w], min, max, num, v1_0,v2_0, v3_0, sennal);
        else
            if (p3)
                BifurcacionVanDerPol([u, A, NaN], min, max, num, v1_0,v2_0, v3_0, sennal);
            end
        end
    end

    cd('..');

    close bifurcacionPol;
    abrirCerrojo();
end

% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
    % hObject    handle to checkbox1 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hint: get(hObject,'Value') returns toggle state of checkbox1
end

% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
    % hObject    handle to checkbox2 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hint: get(hObject,'Value') returns toggle state of checkbox2
end

% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
    % hObject    handle to checkbox3 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hint: get(hObject,'Value') returns toggle state of checkbox3
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

% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)
    % hObject    handle to checkbox4 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hint: get(hObject,'Value') returns toggle state of checkbox4
end

% --- Executes on button press in checkbox5.
function checkbox5_Callback(hObject, eventdata, handles)
    % hObject    handle to checkbox5 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hint: get(hObject,'Value') returns toggle state of checkbox5
end

% --- Executes on button press in checkbox6.
function checkbox6_Callback(hObject, eventdata, handles)
    % hObject    handle to checkbox6 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hint: get(hObject,'Value') returns toggle state of checkbox6
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
