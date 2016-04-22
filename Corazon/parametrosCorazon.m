% 
% Simulador de procesos naturales
% Borja Bordel
% Abril 2016
%
% Ventana para modificar los parámetros para el corazón

function varargout = parametrosCorazon(varargin)
    % PARAMETROSCORAZON MATLAB code for parametrosCorazon.fig
    %      PARAMETROSCORAZON, by itself, creates a new PARAMETROSCORAZON or raises the existing
    %      singleton*.
    %
    %      H = PARAMETROSCORAZON returns the handle to a new PARAMETROSCORAZON or the handle to
    %      the existing singleton*.
    %
    %      PARAMETROSCORAZON('CALLBACK',hObject,eventData,handles,...) calls the local
    %      function named CALLBACK in PARAMETROSCORAZON.M with the given input arguments.
    %
    %      PARAMETROSCORAZON('Property','Value',...) creates a new PARAMETROSCORAZON or raises the
    %      existing singleton*.  Starting from the left, property value pairs are
    %      applied to the GUI before parametrosCorazon_OpeningFcn gets called.  An
    %      unrecognized property name or invalid value makes property application
    %      stop.  All inputs are passed to parametrosCorazon_OpeningFcn via varargin.
    %
    %      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
    %      instance to run (singleton)".
    %
    % See also: GUIDE, GUIDATA, GUIHANDLES

    % Edit the above text to modify the response to help parametrosCorazon

    % Last Modified by GUIDE v2.5 30-Mar-2016 23:50:11

    % Begin initialization code - DO NOT EDIT
    gui_Singleton = 1;
    gui_State = struct('gui_Name',       mfilename, ...
                       'gui_Singleton',  gui_Singleton, ...
                       'gui_OpeningFcn', @parametrosCorazon_OpeningFcn, ...
                       'gui_OutputFcn',  @parametrosCorazon_OutputFcn, ...
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

% --- Executes just before parametrosCorazon is made visible.
function parametrosCorazon_OpeningFcn(hObject, eventdata, handles, varargin)
    % This function has no output args, see OutputFcn.
    % hObject    handle to figure
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    % varargin   command line arguments to parametrosCorazon (see VARARGIN)

    % Choose default command line output for parametrosCorazon
    handles.output = hObject;

    % Update handles structure
    guidata(hObject, handles);

    % UIWAIT makes parametrosCorazon wait for user response (see UIRESUME)
    % uiwait(handles.figure1);
    set(handles.figure1,'CloseRequestFcn',@cerrar);

    global w1;
    global w2;
    global b1;
    global b2;
    global k;
    global c1;
    global c2
    global a;
    global f;

    set(handles.pw1, 'String', num2str(w1));
    set(handles.pw2, 'String', num2str(w2));
    set(handles.pb1, 'String', num2str(b1));
    set(handles.pb2, 'String', num2str(b2));
    set(handles.pk, 'String', num2str(k));
    set(handles.pc1, 'String', num2str(c1));
    set(handles.pc2, 'String', num2str(c2));
    set(handles.pf, 'String', num2str(f));
    set(handles.pa, 'String', num2str(a));
end

% --- Outputs from this function are returned to the command line.
function varargout = parametrosCorazon_OutputFcn(hObject, eventdata, handles) 
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
    global w1;
    global w2;
    global b1;
    global b2;
    global k;
    global c1;
    global c2
    global a;
    global f;

    w1_ = str2double(get(handles.pw1,'String'));
    w2_ = str2double(get(handles.pw2,'String'));
    b1_ = str2double(get(handles.pb1,'String'));
    b2_ = str2double(get(handles.pb2,'String'));
    k_ = str2double(get(handles.pk,'String'));
    c1_ = str2double(get(handles.pc1,'String'));
    c2_ = str2double(get(handles.pc2,'String'));
    a_ = str2double(get(handles.pa,'String'));
    f_ = str2double(get(handles.pf,'String'));
    
    if(isnan(w1_*w2_*b1_*b2_*k_*c1_*c2_*a_*f_))
        warndlg('Debe indicar valores para todos los parámetros','Error');
        return;
    else
        w1 = w1_;
        w2 = w2_;
        a = a_;
        f = f_;
        b1 = b1_;
        b2 = b2_;
        k = k_;
        c1 = c1_;
        c2 = c2_;
    end
    
    abrirCerrojo();
    close parametrosCorazon;
end

function pc1_Callback(hObject, eventdata, handles)
    % hObject    handle to pc1 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hints: get(hObject,'String') returns contents of pc1 as text
    %        str2double(get(hObject,'String')) returns contents of pc1 as a double
end

% --- Executes during object creation, after setting all properties.
function pc1_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to pc1 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called

    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
end


function pc2_Callback(hObject, eventdata, handles)
    % hObject    handle to pc2 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hints: get(hObject,'String') returns contents of pc2 as text
    %        str2double(get(hObject,'String')) returns contents of pc2 as a double
end

% --- Executes during object creation, after setting all properties.
function pc2_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to pc2 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called

    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
end


function pf_Callback(hObject, eventdata, handles)
    % hObject    handle to pf (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hints: get(hObject,'String') returns contents of pf as text
    %        str2double(get(hObject,'String')) returns contents of pf as a double
end

% --- Executes during object creation, after setting all properties.
function pf_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to pf (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called

    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
end


function pa_Callback(hObject, eventdata, handles)
    % hObject    handle to pa (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hints: get(hObject,'String') returns contents of pa as text
    %        str2double(get(hObject,'String')) returns contents of pa as a double
end

% --- Executes during object creation, after setting all properties.
function pa_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to pa (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called

    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
end


function pw1_Callback(hObject, eventdata, handles)
    % hObject    handle to pw1 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hints: get(hObject,'String') returns contents of pw1 as text
    %        str2double(get(hObject,'String')) returns contents of pw1 as a double
end

% --- Executes during object creation, after setting all properties.
function pw1_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to pw1 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called

    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
end


function pw2_Callback(hObject, eventdata, handles)
    % hObject    handle to pw2 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hints: get(hObject,'String') returns contents of pw2 as text
    %        str2double(get(hObject,'String')) returns contents of pw2 as a double
end

% --- Executes during object creation, after setting all properties.
function pw2_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to pw2 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called

    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
end


function pb1_Callback(hObject, eventdata, handles)
    % hObject    handle to pb1 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hints: get(hObject,'String') returns contents of pb1 as text
    %        str2double(get(hObject,'String')) returns contents of pb1 as a double
end

% --- Executes during object creation, after setting all properties.
function pb1_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to pb1 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called

    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
end


function pb2_Callback(hObject, eventdata, handles)
    % hObject    handle to pb2 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hints: get(hObject,'String') returns contents of pb2 as text
    %        str2double(get(hObject,'String')) returns contents of pb2 as a double
end

% --- Executes during object creation, after setting all properties.
function pb2_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to pb2 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called

    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
end


function pk_Callback(hObject, eventdata, handles)
    % hObject    handle to pk (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hints: get(hObject,'String') returns contents of pk as text
    %        str2double(get(hObject,'String')) returns contents of pk as a double
end

% --- Executes during object creation, after setting all properties.
function pk_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to pk (see GCBO)
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
