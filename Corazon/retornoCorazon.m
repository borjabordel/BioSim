% 
% Simulador de procesos naturales
% Borja Bordel
% Abril 2016
%
% Ventana para la obtenci�n de los mapas de retorno del Coraz�n

function varargout = retornoCorazon(varargin)
    % RETORNOCORAZON MATLAB code for retornoCorazon.fig
    %      RETORNOCORAZON, by itself, creates a new RETORNOCORAZON or raises the existing
    %      singleton*.
    %
    %      H = RETORNOCORAZON returns the handle to a new RETORNOCORAZON or the handle to
    %      the existing singleton*.
    %
    %      RETORNOCORAZON('CALLBACK',hObject,eventData,handles,...) calls the local
    %      function named CALLBACK in RETORNOCORAZON.M with the given input arguments.
    %
    %      RETORNOCORAZON('Property','Value',...) creates a new RETORNOCORAZON or raises the
    %      existing singleton*.  Starting from the left, property value pairs are
    %      applied to the GUI before retornoCorazon_OpeningFcn gets called.  An
    %      unrecognized property name or invalid value makes property application
    %      stop.  All inputs are passed to retornoCorazon_OpeningFcn via varargin.
    %
    %      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
    %      instance to run (singleton)".
    %
    % See also: GUIDE, GUIDATA, GUIHANDLES

    % Edit the above text to modify the response to help retornoCorazon

    % Last Modified by GUIDE v2.5 13-Apr-2016 23:21:06

    % Begin initialization code - DO NOT EDIT
    gui_Singleton = 1;
    gui_State = struct('gui_Name',       mfilename, ...
                       'gui_Singleton',  gui_Singleton, ...
                       'gui_OpeningFcn', @retornoCorazon_OpeningFcn, ...
                       'gui_OutputFcn',  @retornoCorazon_OutputFcn, ...
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

% --- Executes just before retornoCorazon is made visible.
function retornoCorazon_OpeningFcn(hObject, eventdata, handles, varargin)
    % This function has no output args, see OutputFcn.
    % hObject    handle to figure
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    % varargin   command line arguments to retornoCorazon (see VARARGIN)

    % Choose default command line output for retornoCorazon
    handles.output = hObject;

    % Update handles structure
    guidata(hObject, handles);

    % UIWAIT makes retornoCorazon wait for user response (see UIRESUME)
    % uiwait(handles.figure1);
    set(handles.figure1,'CloseRequestFcn',@cerrar);
end

% --- Outputs from this function are returned to the command line.
function varargout = retornoCorazon_OutputFcn(hObject, eventdata, handles) 
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
    
    if (isnan(v1_0*v2_0*v3_0*v4_0))
        warndlg('Debe indicar valores para todos los par�metros','Error');
        return;
    end

    s1 = get(handles.x1, 'Value');
    s2 = get(handles.x2, 'Value');
    s3 = get(handles.x3, 'Value');
    s4 = get(handles.x4, 'Value');
    
    if (s1)
        comp = 1;
    else if(s2)
            comp = 2;
        else if (s3)
                comp = 3;
            else
                comp = 4;
            end
        end
    end

    cd('Retorno');

    global k;
    global w1;
    global w2;
    global a;
    global f;
    global b1;
    global b2;
    global c1;
    global c2;

    RetornoLatido(k, w1, w2, a, f, b1, b2, c1, c2, v1_0, v2_0, v3_0, v4_0, comp);

    cd('..');
    close retornoCorazon;

    abrirCerrojo();
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

% Funci�n de cierre en el boton superior
function cerrar (src, evnt)
    abrirCerrojo();
    delete(gcf);
end