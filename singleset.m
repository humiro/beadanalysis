function varargout = singleset(varargin)
% SINGLESET M-file for singleset.fig
%      SINGLESET, by itself, creates a new SINGLESET or raises the existing
%      singleton*.
%
%      H = SINGLESET returns the handle to a new SINGLESET or the handle to
%      the existing singleton*.
%
%      SINGLESET('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SINGLESET.M with the given input arguments.
%
%      SINGLESET('Property','Value',...) creates a new SINGLESET or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before singleset_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to singleset_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help singleset

% Last Modified by GUIDE v2.5 11-Jul-2011 14:20:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @singleset_OpeningFcn, ...
                   'gui_OutputFcn',  @singleset_OutputFcn, ...
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

% --- Executes just before singleset is made visible.
function singleset_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to singleset (see VARARGIN)

% Choose default command line output for singleset
if ispc
    path(path, 'U:\matlab-analysis\logistic');
end
if ismac
    path(path, '/Users/humberto/beadanalysis/matlab-analysis/logistic');
end

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes singleset wait for user response (see UIRESUME)
% uiwait(handles.figure1);
% --- Outputs from this function are returned to the command line.
function varargout = singleset_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% --- Executes on selection change in drtype.
function drtype_Callback(hObject, eventdata, handles)
% hObject    handle to drtype (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns drtype contents as cell array
%        contents{get(hObject,'Value')} returns selected item from drtype


% --- Executes during object creation, after setting all properties.
function drtype_CreateFcn(hObject, eventdata, handles)
% hObject    handle to drtype (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in method.
function method_Callback(hObject, eventdata, handles)
% hObject    handle to method (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns method contents as cell array
%        contents{get(hObject,'Value')} returns selected item from method


% --- Executes during object creation, after setting all properties.
function method_CreateFcn(hObject, eventdata, handles)
% hObject    handle to method (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes on button press in browse.
function browse_Callback(hObject, eventdata, handles)
% hObject    handle to browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global foldname
foldnameholder=uigetdir('/','Please Select Source Folder');
set(handles.showfoldname,'String',foldnameholder);
foldname={foldnameholder};
guidata(hObject,handles);

function showfoldname_Callback(hObject, eventdata, handles)
% hObject    handle to showfoldname (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of showfoldname as text
%        str2double(get(hObject,'String')) returns contents of showfoldname as a
%        double




% --- Executes during object creation, after setting all properties.
function showfoldname_CreateFcn(hObject, eventdata, handles)
% hObject    handle to showfoldname (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in groupdd.
function groupdd_Callback(hObject, eventdata, handles)
% hObject    handle to groupdd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns groupdd contents as cell array
%        contents{get(hObject,'Value')} returns selected item from groupdd

guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function groupdd_CreateFcn(hObject, eventdata, handles)
% hObject    handle to groupdd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function numberofunknown_Callback(hObject, eventdata, handles)
% hObject    handle to numberofunknown (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of numberofunknown as text
%        str2double(get(hObject,'String')) returns contents of numberofunknown as a double


% --- Executes during object creation, after setting all properties.
function numberofunknown_CreateFcn(hObject, eventdata, handles)
% hObject    handle to numberofunknown (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in errorbars.
function errorbars_Callback(hObject, eventdata, handles)
% hObject    handle to errorbars (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns errorbars contents as cell array
%        contents{get(hObject,'Value')} returns selected item from errorbars


% --- Executes during object creation, after setting all properties.
function errorbars_CreateFcn(hObject, eventdata, handles)
% hObject    handle to errorbars (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in getdata.
function getdata_Callback(hObject, eventdata, handles)
% hObject    handle to getdata (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global foldname LP LPSD LPCV cAOI cAOISD cAOICV conc exposures uklp uklpsd uklpcv ukcaoi ukcaoisd ukcaoicv;
numofunknown=str2num(get(handles.numberofunknown,'String'));
            
[conc,exposures]=makearrays(foldname);
[LP LPSD LPCV cAOI cAOISD cAOICV]=takearray(conc,foldname,exposures);

if numofunknown>0
    unknownmat={};
    for o=1:numofunknown
        unknownmatholder=uigetdir('/','Please Select Source Folder fot the unknown');
        if o==1
            unknownmat={unknownmatholder};
        else
            unknownmat={unknownmat,unknownmatholder};
        end
    end
    [uklp uklpsd uklpcv ukcaoi ukcaoisd ukcaoicv] = zerounknown(unknownmat,exposures,2);
else
    uklp=[];
    uklpsd=[];
    uklpcv=[];
    ukcaoi=[];
    ukcaoisd=[];
    ukcaoicv=[];
end
guidata(hObject,handles)


% --- Executes on button press in showdata.
function showdata_Callback(hObject, eventdata, handles)
% hObject    handle to showdata (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global foldname LP LPSD LPCV cAOI cAOISD cAOICV conc exposures uklp uklpsd uklpcv ukcaoi ukcaoisd ukcaoicv;
groupselected=get(handles.groupdd,'Value');
drtype=get(handles.drtype,'Value');
erbarvalue=get(handles.errorbars,'Value');
methodvalue=get(handles.method,'Value');
[zerolp zerolpsd zerolpcv zerocaoi zerocaoisd zerocaoicv] = zerounknown(foldname,exposures,1);
if drtype==7
    CV_Graph(LPCV,conc, exposures, groupselected);
else
    [ y sd ] = beadfigure(LP,cAOI,LPSD,cAOISD,zerolp,zerolpsd, zerocaoi,zerocaoisd,conc,exposures,groupselected,drtype,erbarvalue,methodvalue,uklp,ukcaoi);
end
 guidata(hObject,handles)
