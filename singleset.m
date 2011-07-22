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

% Last Modified by GUIDE v2.5 22-Jul-2011 10:38:05

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
set(handles.chipsize,'SelectionChangeFcn',@chipsizeSelect_buttongroup_SelectionChangeFcn);
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

% --- Executes on selection change in methodsused.
function methodsused_Callback(hObject, eventdata, handles)
% hObject    handle to methodsused (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns methodsused contents as cell array
%        contents{get(hObject,'Value')} returns selected item from methodsused


% --- Executes during object creation, after setting all properties.
function methodsused_CreateFcn(hObject, eventdata, handles)
% hObject    handle to methodsused (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
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

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
guidata(hObject,handles);
% --- Executes during object creation, after setting all properties.
function method_CreateFcn(hObject, eventdata, handles)
% hObject    handle to method (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.

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
global showmethods foldname conc exposures csval groupnames;

[conc,exposures]=makearrays(foldname);
methodsselected=get(handles.methodsused,'Value');
methods=['Linear Profile  ';'cAOI            ';'Donut           ';'Circular Profile';'Fixed           ';'Integrated cAOI ';'Integrated Donut';'Integrated CP   ';'Integrated Fixed'];
methodsstr=cellstr(methods);
showmethods=methodsstr(methodsselected);      
set(handles.method,'String',char(showmethods));

[namechip,lines]=createtable(foldname,csval);
numlines=str2num(char(lines(1)));
groupnames=cell(numlines,1);
startlines=numlines+2;

for n=0:(numlines-1)
    groupnames{n+1,1}=char(lines(startlines+n));
end
set(handles.groupdd,'String',char(groupnames));

% [LP LPSD LPCV cAOI cAOISD cAOICV]=takearray(conc,foldname,exposures);
if numel(get(handles.showfoldname,'String'))>1
    set(handles.method,'Enable','On')
    set(handles.errorbars,'Enable','On')
    set(handles.groupdd,'Enable','On')
    set(handles.drtype,'Enable','On')
    set(handles.showdata,'Enable','On') 
    set(handles.reportbtn,'Enable','On')
    set(handles.oneexp,'Enable','On')
    set(handles.rb5x4,'Enable','On')
    set(handles.rb3x4,'Enable','On')    
else
    errordlg('Please select a directory file');
end

guidata(hObject,handles)


% --- Executes on button press in showdata.
function showdata_Callback(hObject, eventdata, handles)
% hObject    handle to showdata (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global showmethods foldname conc exposures methodvalue numofmethods intensityvalues groupselected;

groupselected=get(handles.groupdd,'Value');
drtype=get(handles.drtype,'Value');
erbarvalue=get(handles.errorbars,'Value');
methodvalue=get(handles.method,'Value');
numofmethods=numel(showmethods);
[intensityvalues sdvalues cvvalues]=takearray7142011(conc,foldname,exposures,numofmethods,methodvalue);
[zerolp zerolpsd zerolpcv] = zerounknown(foldname,exposures,1,numofmethods,methodvalue);

numofunknown=str2num(get(handles.numberofunknown,'String'));
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
    [uklp uklpsd uklpcv] = zerounknown(unknownmat,exposures,2,numofmethods,methodvalue);
else
    uklp=[];
    uklpsd=[];
    uklpcv=[];
end

if (drtype==1)
    errordlg('Please select a group or type of dose response');
else
        if drtype==7
            CV_Graph(LPCV,conc, exposures, groupselected);
        else
            [ y sd ] = beadfigure(intensityvalues,sdvalues,zerolp,zerolpsd,conc,exposures,groupselected,drtype,erbarvalue,uklp,uklpsd);
        end
end
 guidata(hObject,handles)


% --- Executes on button press in reportbtn.
function reportbtn_Callback(hObject, eventdata, handles)
% hObject    handle to reportbtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global showmethods foldname conc exposures methodvalue numofmethods;

report('summarystat')
guidata(hObject,handles)




% --- Executes on button press in oneexp.
function oneexp_Callback(hObject, eventdata, handles)
% hObject    handle to oneexp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global conc exposures intensityvalues groupselected sexpval;
dlgprompt='Select exposure:';
singleexp=inputdlg(dlgprompt);
chsingleexp=char(singleexp);
if str2num(chsingleexp) ~= exposures(:)
 errordlg('Please select approprieate exposure') 
end
for t=1:numel(exposures)
    if exposures(t)==str2num(chsingleexp)
        sexpval=t;
    end
end
yholder=intensityvalues{groupselected-1};
yinv=yholder(:,sexpval)
y=yinv';
figure
dose_response(conc,y);
guidata(hObject,handles)

function chipsizeSelect_buttongroup_SelectionChangeFcn(hObject, eventdata)
 global csval;
%retrieve GUI data, i.e. the handles structure
handles = guidata(hObject); 
 
switch get(eventdata.NewValue,'Tag')   % Get Tag of selected object
    case 'rb5x4'
      %execute this code when fontsize08_radiobutton is selected
      csval=1;
 
    case 'rb3x4'
      %execute this code when fontsize12_radiobutton is selected
      csval=2;
    otherwise
       % Code for when there is no match.
 
end
%updates the handles structure
guidata(hObject, handles);
