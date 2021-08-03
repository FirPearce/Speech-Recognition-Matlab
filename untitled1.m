function varargout = untitled1(varargin)
% UNTITLED1 M-file for untitled1.fig
%      UNTITLED1, by itself, creates a new UNTITLED1 or raises the existing
%      singleton*.
%
%      H = UNTITLED1 returns the handle to a new UNTITLED1 or the handle to
%      the existing singleton*.
%
%      UNTITLED1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED1.M with the given input arguments.
%
%      UNTITLED1('Property','Value',...) creates a new UNTITLED1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled1

% Last Modified by GUIDE v2.5 07-Jun-2021 18:52:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled1_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled1_OutputFcn, ...
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


% --- Executes just before untitled1 is made visible.
function untitled1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled1 (see VARARGIN)

% Choose default command line output for untitled1
handles.output = hObject;
set(handles.suarafirly, 'UserData', 0);
set(handles.suararaka, 'UserData',0);
set(handles.suaratito, 'UserData',0);
handles.tn = 0;
handles.std = 0;
handles.tn2 = 0;
handles.std2 = 0;
handles.tn3 = 0;
handles.std3 = 0;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in suarafirly.
function suarafirly_Callback(hObject, eventdata, handles)
% hObject    handle to suarafirly (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
counter = get(hObject, 'UserData');
if (counter<10)
    counter = get(hObject, 'UserData') + 1;
    set(hObject, 'UserData', counter);
    file = sprintf('%s%d.wav','firly',counter);
    y = wavrecord(88200,44100); 
    sound(y,44100); 
    wavwrite(y,44100,file);
    h = msgbox(sprintf('Sampel Ke- %d Berhasil ditambah',counter));
    %setItems = memo.setSelectedItems({file})
    %set(handles.memo,'String',({file}));
else
    msgbox('Sample sudah memenuhi','Peringatan','warn');
end



function editteks_Callback(hObject, eventdata, handles)
% hObject    handle to editteks (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editteks as text
%        str2double(get(hObject,'String')) returns contents of editteks as a double


% --- Executes during object creation, after setting all properties.
function editteks_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editteks (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in buttonuji.
function buttonuji_Callback(hObject, eventdata, handles)
% hObject    handle to buttonuji (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Suara Firly dengan suara data uji
usertemp = wavrecord (88200,44100);
sound (usertemp,44100);
% Memotong rekaman suara sampel sehingga hanya berisi  suara
s = abs (usertemp);
start = 1;
last = 88200;
for i = 1:88200
if s (i) >=.1 && i <=5000
start = 1;
break
end
if s (i) >=.1 && i > 5000 
start = i-5000;
break
end
end
for i = 1:88200
k = 88201-i;
if s (k)>=.1 && k>=83200
last = 88200;
break
end
if s (k)>= .1 && k <83200
last = k + 5000;
break
end
end
% Mengubah suara sampel ke dalam bentuk FFT.
user = usertemp (start:last);
userftemp = fft (user);
userftemp = userftemp.*conj (userftemp);
userf = userftemp (1:600);
userfn = userf/sqrt(sum (abs (userf).^2));
% Plot spektrum suara dari rekaman sampel dan rata-rata suara referensi.
%hold on;
%subplot (2,1,1);
%plot (userfn)
%title ('Normalized Frequency Spectra Of Recording')
%subplot (2,1,2);
%plot (handles.tn);
%title ('Normalized Frequency Spectra of Average')
% Pengecekan sesuai Threshold, apakah suara dikenali atau tidak.
s = sqrt (sum (abs (userfn - handles.tn).^2))
threshold = 2 *handles.std
nilai1 = threshold - s ;


%Membandingkan Suara Raka dengan data uji
% Memotong rekaman suara sampel sehingga hanya berisi  suara
s2 = abs (usertemp);
start = 1;
last = 88200;
for i = 1:88200
if s2 (i) >=.1 && i <=5000
start = 1;
break
end
if s2 (i) >=.1 && i > 5000 
start = i-5000;
break
end
end
for i = 1:88200
k = 88201-i;
if s2 (k)>=.1 && k>=83200
last = 88200;
break
end
if s2 (k)>= .1 && k <83200
last = k + 5000;
break
end
end
% Mengubah suara sampel ke dalam bentuk FFT.
user = usertemp (start:last);
userftemp = fft (user);
userftemp = userftemp.*conj (userftemp);
userf = userftemp (1:600);
userfn = userf/sqrt(sum (abs (userf).^2));
% Plot spektrum suara dari rekaman sampel dan rata-rata suara referensi.
%hold on;
%subplot (2,1,1);
%plot (userfn)
%title ('Normalized Frequency Spectra Of Recording')
%subplot (2,1,2);
%plot (handles.tn2);
%title ('Normalized Frequency Spectra of Average')
% Pengecekan sesuai Threshold, apakah suara dikenali atau tidak.
s2 = sqrt (sum (abs (userfn - handles.tn2).^2))
threshold = 1.9 *handles.std2 ;
disp('threshold2');
disp(threshold);
nilai2 = threshold - s2;

%Membandingkan Suara Tito dengan data uji
% Memotong rekaman suara sampel sehingga hanya berisi  suara
s3 = abs (usertemp);
start = 1;
last = 88200;
for i = 1:88200
if s3 (i) >=.1 && i <=5000
start = 1;
break
end
if s3 (i) >=.1 && i > 5000 
start = i-5000;
break
end
end
for i = 1:88200
k = 88201-i;
if s3 (k)>=.1 && k>=83200
last = 88200;
break
end
if s3 (k)>= .1 && k <83200
last = k + 5000;
break
end
end
% Mengubah suara sampel ke dalam bentuk FFT.
user = usertemp (start:last);
userftemp = fft (user);
userftemp = userftemp.*conj (userftemp);
userf = userftemp (1:600);
userfn = userf/sqrt(sum (abs (userf).^2));
% Plot spektrum suara dari rekaman sampel dan rata-rata suara referensi.
%hold on;
%subplot (2,1,1);
%plot (userfn)
%title ('Normalized Frequency Spectra Of Recording')
%subplot (2,1,2);
%plot (handles.tn2);
%title ('Normalized Frequency Spectra of Average')
% Pengecekan sesuai Threshold, apakah suara dikenali atau tidak.
s3 = sqrt (sum (abs (userfn - handles.tn3).^2))
threshold = 2 *handles.std3 ;
nilai3 = threshold - s3 ;

disp('threshold3');
disp(threshold);

disp('nilai1');
disp(nilai1);
set(handles.nilaifirly,'String',nilai1);
disp('nilai2');
disp(nilai2);
set(handles.nilairaka,'String',nilai2);
disp('nilai3');
disp(nilai3);
set(handles.nilaitito,'String',nilai3);

if (nilai1 > nilai2 && nilai1 > nilai3)
    set(handles.edithasil,'String','Suara Firly');
    myImage = imread('firly.jpg');
    set(handles.axes1,'Units','pixels');
    resizePos = get(handles.axes1,'Position');
    myImage= imresize(myImage, [resizePos(3) resizePos(3)]);
    axes(handles.axes1);
    imshow(myImage);
    set(handles.axes1,'Units','normalized');
elseif(nilai2 > nilai1 && nilai2 > nilai3)
    set(handles.edithasil,'String','Suara Rayandika');
    myImage = imread('rayandika.png');
    set(handles.axes1,'Units','pixels');
    resizePos = get(handles.axes1,'Position');
    myImage= imresize(myImage, [resizePos(3) resizePos(3)]);
    axes(handles.axes1);
    imshow(myImage);
    set(handles.axes1,'Units','normalized');
elseif(nilai3 > nilai1 && nilai3 > nilai2)
    set(handles.edithasil,'String','Suara Tito');
    myImage = imread('tito.jpg');
    set(handles.axes1,'Units','pixels');
    resizePos = get(handles.axes1,'Position');
    myImage= imresize(myImage, [resizePos(3) resizePos(3)]);
    axes(handles.axes1);
    imshow(myImage);
    set(handles.axes1,'Units','normalized');
else
    msgbox('Suara tidak dikenali','Peringatan','warn');
end
%if (s <= threshold)
%name = strcat ('HELLO----',name,' !!!!');
%set(handles.edithasil,'String',name);
%else
%name = strcat ('YOU ARE NOT---- ',name,' !!!!');
%set(handles.edithasil,'String',name);
%end

function edithasil_Callback(hObject, eventdata, handles)
% hObject    handle to edithasil (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edithasil as text
%        str2double(get(hObject,'String')) returns contents of edithasil as a double


% --- Executes during object creation, after setting all properties.
function edithasil_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edithasil (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in suararaka.
function suararaka_Callback(hObject, eventdata, handles)
% hObject    handle to suararaka (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
counter2 = get(hObject, 'UserData');
if (counter2<10)
    counter2 = get(hObject, 'UserData') + 1;
    set(hObject, 'UserData', counter2);
    file = sprintf('%s%d.wav','raka',counter2);
    y = wavrecord(88200,44100); 
    sound(y,44100); 
    wavwrite(y,44100,file);
    h = msgbox(sprintf('Sampel Ke- %d Berhasil ditambah',counter2));
else
    msgbox('Sample sudah memenuhi','Peringatan','warn');
end


% --- Executes on button press in suaratito.
function suaratito_Callback(hObject, eventdata, handles)
% hObject    handle to suaratito (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
counter3 = get(hObject, 'UserData');
if (counter3<10)
    counter3 = get(hObject, 'UserData') + 1;
    set(hObject, 'UserData', counter3);
    file = sprintf('%s%d.wav','tito',counter3);
    y = wavrecord(88200,44100); 
    sound(y,44100); 
    wavwrite(y,44100,file);
    h = msgbox(sprintf('Sampel Ke- %d Berhasil ditambah',counter3));
else
    msgbox('Sample sudah memenuhi','Peringatan','warn');
end


% --- Executes on button press in prosesdata.
function prosesdata_Callback(hObject, eventdata, handles)
% hObject    handle to prosesdata (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Suara Firly
ytemp = zeros (88200,20);
% Memotong rekaman sehingga hanya memuat suara dan kemudian %disimpan dalam sebuah matriks 88200x20 .
r = zeros (10,1);
for j = 1:10
    file = sprintf ('%s%d.wav','firly',j);
    [t, fs] = wavread (file);
    s = abs (t);
    start = 1;
    last = 88200;
for i = 1:88200
    if s (i) >=.1 && i <=7000
        start = 1;
        break
    end
    if s (i) >=.1 && i > 7000
        start = i-7000;
        break
    end
end
for i = 1:88200
    k = 88201-i;
    if s (k)>=.1 && k>=81200
        last = 88200;
        break
    end
    if s (k)>= .1 && k <81200
        last = k + 7000;
        break
    end
end
r (j) = last-start;
ytemp (1: last - start + 1,2 * j) = t (start:last);
ytemp (1: last - start + 1,(2*j - 1)) = t (start:last);
end
% Baris Matriks diperkecil.
y = zeros (min (r),20);
for i = 1:20
y (:,i) = ytemp (1:min (r),i);
end
% Mengubah ke dalam bentuk domain frekuensi dengan menggunakan Fast Fourier
% Transform (FFT) dan kemudian mengambil nilai modulus
fy = fft (y);
fy = fy.*conj (fy);
% Menormalkan nilai spektrum setiap rekaman dan menempatkannya pada matriks fn.
%hanya frekuensi yang lebih dari 600 Hz yang dibutuhkan untuk merepresentasikan suara manusia.
fn = zeros (600,20);
for i = 1:20
fn (1:600,i) = fy (1:600,i)/sqrt(sum (abs (fy (1:600,i)).^2));
end
% menghitung rata-rata suara referensi 
pu = zeros (600,1);
for i = 1:20
pu = pu + fn (1:600,i);
end
pu = pu/20;
% Menghitung nilai centroid
handles.tn = pu/sqrt(sum (abs (pu).^2));
% menghitung probabilitas suatu referensi yaitu dengan standar deviasi
handles.std = 0;
for i = 1:20
handles.std = handles.std + sum (abs (fn (1:600,i)-handles.tn).^2);
end
handles.std = sqrt (handles.std/20);
disp(handles.std);
guidata(hObject,handles)

%Suara Raka
ytemp = zeros (88200,20);
% Memotong rekaman sehingga hanya memuat suara dan kemudian %disimpan dalam sebuah matriks 88200x20 .
r = zeros (10,1);
for j = 1:10
    file = sprintf ('%s%d.wav','raka',j);
    [t, fs] = wavread (file);
    s = abs (t);
    start = 1;
    last = 88200;
for i = 1:88200
    if s (i) >=.1 && i <=7000
        start = 1;
        break
    end
    if s (i) >=.1 && i > 7000
        start = i-7000;
        break
    end
end
for i = 1:88200
    k = 88201-i;
    if s (k)>=.1 && k>=81200
        last = 88200;
        break
    end
    if s (k)>= .1 && k <81200
        last = k + 7000;
        break
    end
end
r (j) = last-start;
ytemp (1: last - start + 1,2 * j) = t (start:last);
ytemp (1: last - start + 1,(2*j - 1)) = t (start:last);
end
% Baris Matriks diperkecil.
y = zeros (min (r),20);
for i = 1:20
y (:,i) = ytemp (1:min (r),i);
end
% Mengubah ke dalam bentuk domain frekuensi dengan menggunakan Fast Fourier
% Transform (FFT) dan kemudian mengambil nilai modulus
fy = fft (y);
fy = fy.*conj (fy);
% Menormalkan nilai spektrum setiap rekaman dan menempatkannya pada matriks fn.
%hanya frekuensi yang lebih dari 600 Hz yang dibutuhkan untuk merepresentasikan suara manusia.
fn = zeros (600,20);
for i = 1:20
fn (1:600,i) = fy (1:600,i)/sqrt(sum (abs (fy (1:600,i)).^2));
end
% menghitung rata-rata suara referensi 
pu = zeros (600,1);
for i = 1:20
pu = pu + fn (1:600,i);
end
pu = pu/20;
% Menghitung nilai centroid
handles.tn2 = pu/sqrt(sum (abs (pu).^2));
% menghitung probabilitas suatu referensi yaitu dengan standar deviasi
handles.std2 = 0;
for i = 1:20
handles.std2 = handles.std2 + sum (abs (fn (1:600,i)-handles.tn2).^2);
end
handles.std2 = sqrt (handles.std2/20);
disp(handles.std2);
guidata(hObject,handles)

%Suara Tito
ytemp = zeros (88200,20);
% Memotong rekaman sehingga hanya memuat suara dan kemudian %disimpan dalam sebuah matriks 88200x20 .
r = zeros (10,1);
for j = 1:10
    file = sprintf ('%s%d.wav','tito',j);
    [t, fs] = wavread (file);
    s = abs (t);
    start = 1;
    last = 88200;
for i = 1:88200
    if s (i) >=.1 && i <=7000
        start = 1;
        break
    end
    if s (i) >=.1 && i > 7000
        start = i-7000;
        break
    end
end
for i = 1:88200
    k = 88201-i;
    if s (k)>=.1 && k>=81200
        last = 88200;
        break
    end
    if s (k)>= .1 && k <81200
        last = k + 7000;
        break
    end
end
r (j) = last-start;
ytemp (1: last - start + 1,2 * j) = t (start:last);
ytemp (1: last - start + 1,(2*j - 1)) = t (start:last);
end
% Baris Matriks diperkecil.
y = zeros (min (r),20);
for i = 1:20
y (:,i) = ytemp (1:min (r),i);
end
% Mengubah ke dalam bentuk domain frekuensi dengan menggunakan Fast Fourier
% Transform (FFT) dan kemudian mengambil nilai modulus
fy = fft (y);
fy = fy.*conj (fy);
% Menormalkan nilai spektrum setiap rekaman dan menempatkannya pada matriks fn.
%hanya frekuensi yang lebih dari 600 Hz yang dibutuhkan untuk merepresentasikan suara manusia.
fn = zeros (600,20);
for i = 1:20
fn (1:600,i) = fy (1:600,i)/sqrt(sum (abs (fy (1:600,i)).^2));
end
% menghitung rata-rata suara referensi 
pu = zeros (600,1);
for i = 1:20
pu = pu + fn (1:600,i);
end
pu = pu/20;
% Menghitung nilai centroid
handles.tn3 = pu/sqrt(sum (abs (pu).^2));
% menghitung probabilitas suatu referensi yaitu dengan standar deviasi
handles.std3 = 0;
for i = 1:20
handles.std3 = handles.std3 + sum (abs (fn (1:600,i)-handles.tn3).^2);
end
handles.std3 = sqrt (handles.std3/20);
disp(handles.std3);
guidata(hObject,handles)



function nilaifirly_Callback(hObject, eventdata, handles)
% hObject    handle to nilaifirly (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nilaifirly as text
%        str2double(get(hObject,'String')) returns contents of nilaifirly as a double


% --- Executes during object creation, after setting all properties.
function nilaifirly_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nilaifirly (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nilairaka_Callback(hObject, eventdata, handles)
% hObject    handle to nilairaka (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nilairaka as text
%        str2double(get(hObject,'String')) returns contents of nilairaka as a double


% --- Executes during object creation, after setting all properties.
function nilairaka_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nilairaka (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nilaitito_Callback(hObject, eventdata, handles)
% hObject    handle to nilaitito (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nilaitito as text
%        str2double(get(hObject,'String')) returns contents of nilaitito as a double


% --- Executes during object creation, after setting all properties.
function nilaitito_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nilaitito (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


