% 
% Simulador de procesos naturales
% Borja Bordel
% Febrero 2016
%
% Ventana de parámetros del oscilador de Van Der Pol (forzado o no)

function varargout = parametrosPol(varargin)
    % PARAMETROSPOL MATLAB code for parametrosPol.fig
    %      PARAMETROSPOL, by itself, creates a new PARAMETROSPOL or raises the existing
    %      singleton*.
    %
    %      H = PARAMETROSPOL returns the handle to a new PARAMETROSPOL or the handle to
    %      the existing singleton*.
    %
    %      PARAMETROSPOL('CALLBACK',hObject,eventData,handles,...) calls the local
    %      function named CALLBACK in PARAMETROSPOL.M with the given input arguments.
    %
    %      PARAMETROSPOL('Property','Value',...) creates a new PARAMETROSPOL or raises the
    %      existing singleton*.  Starting from the left, property value pairs are
    %      applied to the GUI before parametrosPol_OpeningFcn gets called.  An
    %      unrecognized property name or invalid value makes property application
    %      stop.  All inputs are passed to parametrosPol_OpeningFcn via varargin.
    %
    %      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
    %      instance to run (singleton)".
    %
    % See also: GUIDE, GUIDATA, GUIHANDLES

    % Edit the above text to modify the response to help parametrosPol

    % Last Modified by GUIDE v2.5 21-Feb-2016 13:01:39

    % Begin initialization code - DO NOT EDIT
    gui_Singleton = 1;
    gui_State = struct('gui_Name',       mfilename, ...
                       'gui_Singleton',  gui_Singleton, ...
                       'gui_OpeningFcn', @parametrosPol_OpeningFcn, ...
                       'gui_OutputFcn',  @parametrosPol_OutputFcn, ...
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

% --- Executes just before parametrosPol is made visible.
function parametrosPol_OpeningFcn(hObject, eventdata, handles, varargin)
    % This function has no output args, see OutputFcn.
    % hObject    handle to figure
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    % varargin   command line arguments to parametrosPol (see VARARGIN)

    % Choose default command line output for parametrosPol
    handles.output = hObject;

    % Update handles structure
    guidata(hObject, handles);

    % UIWAIT makes parametrosPol wait for user response (see UIRESUME)
    % uiwait(handles.figure1);
    set(handles.figure1,'CloseRequestFcn',@cerrar);
    
    global u;
    global A;
    global w;
    
    set(handles.paramU, 'String', num2str(u));
    set(handles.paramA, 'String', num2str(A));
    set(handles.paramW, 'String', num2str(w))
end

% --- Outputs from this function are returned to the command line.
function varargout = parametrosPol_OutputFcn(hObject, eventdata, handles) 
    % varargout  cell array for returning output args (see VARARGOUT);
    % hObject    handle to figure
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Get default command line output from handles structure
    varargout{1} = handles.output;
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

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
    % hObject    handle to pushbutton1 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    global u;
    global A;
    global w;
    
    u1 = str2double(get(handles.paramU,'String'));
    w1 = str2double(get(handles.paramW,'String'));
    A1 = str2double(get(handles.paramA,'String'));
    
    if(isnan(A1*w1*u1))
        warndlg('Debe indicar valores para todos los parámetros','Error');
        return;
    else
        u = u1;
        w = w1;
        A = A1;
    end
    
    close parametrosPol;
    abrirCerrojo();
end


function paramU_Callback(hObject, eventdata, handles)
    % hObject    handle to paramU (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hints: get(hObject,'String') returns contents of paramU as text
    %        str2double(get(hObject,'String')) returns contents of paramU as a double
end

% --- Executes during object creation, after setting all properties.
function paramU_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to paramU (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called

    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
end

function paramW_Callback(hObject, eventdata, handles)
    % hObject    handle to paramW (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hints: get(hObject,'String') returns contents of paramW as text
    %        str2double(get(hObject,'String')) returns contents of paramW as a double
end

% --- Executes during object creation, after setting all properties.
function paramW_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to paramW (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called

    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
end


function paramA_Callback(hObject, eventdata, handles)
    % hObject    handle to paramA (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hints: get(hObject,'String') returns contents of paramA as text
    %        str2double(get(hObject,'String')) returns contents of paramA as a double
end

% --- Executes during object creation, after setting all properties.
function paramA_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to paramA (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called

    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
end
