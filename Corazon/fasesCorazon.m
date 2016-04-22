% 
% Simulador de procesos naturales
% Borja Bordel
% Abril 2016
%
% Ventana para generar los atractores del sistema del corazón

function varargout = fasesCorazon(varargin)
    % FASESCORAZON MATLAB code for fasesCorazon.fig
    %      FASESCORAZON, by itself, creates a new FASESCORAZON or raises the existing
    %      singleton*.
    %
    %      H = FASESCORAZON returns the handle to a new FASESCORAZON or the handle to
    %      the existing singleton*.
    %
    %      FASESCORAZON('CALLBACK',hObject,eventData,handles,...) calls the local
    %      function named CALLBACK in FASESCORAZON.M with the given input arguments.
    %
    %      FASESCORAZON('Property','Value',...) creates a new FASESCORAZON or raises the
    %      existing singleton*.  Starting from the left, property value pairs are
    %      applied to the GUI before fasesCorazon_OpeningFcn gets called.  An
    %      unrecognized property name or invalid value makes property application
    %      stop.  All inputs are passed to fasesCorazon_OpeningFcn via varargin.
    %
    %      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
    %      instance to run (singleton)".
    %
    % See also: GUIDE, GUIDATA, GUIHANDLES

    % Copyright 2002-2006 The MathWorks, Inc.

    % Edit the above text to modify the response to help fasesCorazon

    % Last Modified by GUIDE v2.5 02-Apr-2016 00:51:03

    % Begin initialization code - DO NOT EDIT
    gui_Singleton = 1;
    gui_State = struct('gui_Name',       mfilename, ...
                       'gui_Singleton',  gui_Singleton, ...
                       'gui_OpeningFcn', @fasesCorazon_OpeningFcn, ...
                       'gui_OutputFcn',  @fasesCorazon_OutputFcn, ...
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

% --- Executes just before fasesCorazon is made visible.
function fasesCorazon_OpeningFcn(hObject, eventdata, handles, varargin)
    % This function has no output args, see OutputFcn.
    % hObject    handle to figure
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    % varargin   command line arguments to fasesCorazon (see VARARGIN)

    % Choose default command line output for fasesCorazon
    handles.output = hObject;

    % Update handles structure
    guidata(hObject, handles);

    % UIWAIT makes fasesCorazon wait for user response (see UIRESUME)
    % uiwait(handles.figure1);
    set(handles.figure1,'CloseRequestFcn',@cerrar);
end

% --- Outputs from this function are returned to the command line.
function varargout = fasesCorazon_OutputFcn(hObject, eventdata, handles) 
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
    v4_0 = str2double(get(handles.x4_0,'String'));

    T = str2double(get(handles.tiempo,'String'));

    if (isnan(T*v1_0*v2_0*v3_0))
        warndlg('Debe indicar valores para todos los parámetros','Error');
        return;
    end

    s1 = get(handles.x1, 'Value');
    s2 = get(handles.x2, 'Value');
    s3 = get(handles.x3, 'Value');
    s4 = get(handles.x4, 'Value');

    if(s1)
        if(s2)
            if (s3)
                if (s4)
                   warndlg('No puede hacerse una representación en cuatro dimensiones','Error');
                   return; 
                else
                    caso = 7;
                end
            else
                if (s4)
                    caso = 8;
                else
                    caso = 1;
                end
            end
        else
            if (s3)
                if (s4)
                    caso = 9;
                else
                    caso = 2;
                end
            else
                if (s4)
                    caso = 3;
                else
                    warndlg('Debe seleccionar al menos dos señales','Error');
                    return;
                end
            end
        end
    else
        if (s2)
            if (s3)
                if (s4)
                    caso = 10;
                else
                    caso = 4;
                end
            else
                if (s4)
                    caso = 5;
                else
                    warndlg('Debe seleccionar al menos dos señales','Error');
                    return;
                end
            end
        else
            if (s3)
                if (s4)
                    caso = 6;
                else
                    warndlg('Debe seleccionar al menos dos señales','Error');
                    return;
                end
            else
                warndlg('Debe seleccionar al menos dos señales','Error');
                return;
            end
        end

    end

    global k;
    global w1;
    global w2;
    global a;
    global f;
    global b1;
    global b2;
    global c1;
    global c2;

    cd('Atractor');
    PintaAtractor(k, w1, w2, a, f, b1, b2, c1, c2, v1_0, v2_0, v3_0, v4_0, T, caso);
    cd('..');
    close fasesCorazon;
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

% --- Executes on button press in x4.
function x4_Callback(hObject, eventdata, handles)
    % hObject    handle to x4 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hint: get(hObject,'Value') returns toggle state of x4
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