function varargout = parametrosBruss(varargin)
% PARAMETROSBRUSS MATLAB code for parametrosBruss.fig
%      PARAMETROSBRUSS, by itself, creates a new PARAMETROSBRUSS or raises the existing
%      singleton*.
%
%      H = PARAMETROSBRUSS returns the handle to a new PARAMETROSBRUSS or the handle to
%      the existing singleton*.
%
%      PARAMETROSBRUSS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PARAMETROSBRUSS.M with the given input arguments.
%
%      PARAMETROSBRUSS('Property','Value',...) creates a new PARAMETROSBRUSS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before parametrosBruss_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to parametrosBruss_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help parametrosBruss

% Last Modified by GUIDE v2.5 14-Apr-2016 11:22:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @parametrosBruss_OpeningFcn, ...
                   'gui_OutputFcn',  @parametrosBruss_OutputFcn, ...
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


% --- Executes just before parametrosBruss is made visible.
function parametrosBruss_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to parametrosBruss (see VARARGIN)

% Choose default command line output for parametrosBruss
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes parametrosBruss wait for user response (see UIRESUME)
% uiwait(handles.figure1);
set(handles.figure1,'CloseRequestFcn',@cerrar);
    
    global a;
    global b;
    global m;
    global w;
    
    set(handles.paramM, 'String', num2str(m));
    set(handles.paramA, 'String', num2str(a));
    set(handles.paramW, 'String', num2str(w));
    set(handles.paramB, 'String', num2str(b));

    
% --- Outputs from this function are returned to the command line.
function varargout = parametrosBruss_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global a;
    global b;
    global m;
    global w;
    
    a1 = str2double(get(handles.paramA,'String'));
    w1 = str2double(get(handles.paramW,'String'));
    b1 = str2double(get(handles.paramB,'String'));
    m1 = str2double(get(handles.paramM,'String'));
    
    if(isnan(a1*w1*b1*m1))
        warndlg('Debe indicar valores para todos los parámetros','Error');
        return;
    else
        m = m1;
        w = w1;
        a = a1;
        b = b1;
    end
    
    close parametrosBruss;
    abrirCerrojo();


function paramA_Callback(hObject, eventdata, handles)
% hObject    handle to paramA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of paramA as text
%        str2double(get(hObject,'String')) returns contents of paramA as a double


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



function paramW_Callback(hObject, eventdata, handles)
% hObject    handle to paramW (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of paramW as text
%        str2double(get(hObject,'String')) returns contents of paramW as a double


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



function paramM_Callback(hObject, eventdata, handles)
% hObject    handle to paramM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of paramM as text
%        str2double(get(hObject,'String')) returns contents of paramM as a double


% --- Executes during object creation, after setting all properties.
function paramM_CreateFcn(hObject, eventdata, handles)
% hObject    handle to paramM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function paramB_Callback(hObject, eventdata, handles)
% hObject    handle to paramB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of paramB as text
%        str2double(get(hObject,'String')) returns contents of paramB as a double


% --- Executes during object creation, after setting all properties.
function paramB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to paramB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

 %%%%%%%%%%%%%%%%%%%%%%
 % CONTROL DE HEBRAS
 %%%%%%%%%%%%%%%%%%%%%%%
 
 % Bloquea la hebra
function abrirCerrojo ()
    global cerrojo;
    cerrojo = 0;


% Función de cierre en el boton superior
function cerrar (src, evnt)
    abrirCerrojo();
    delete(gcf);
