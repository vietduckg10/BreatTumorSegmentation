function varargout = BreastTumor(varargin)
% BREASTTUMOR MATLAB code for BreastTumor.fig
%      BREASTTUMOR, by itself, creates a new BREASTTUMOR or raises the existing
%      singleton*.
%
%      H = BREASTTUMOR returns the handle to a new BREASTTUMOR or the handle to
%      the existing singleton*.
%
%      BREASTTUMOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BREASTTUMOR.M with the given input arguments.
%
%      BREASTTUMOR('Property','Value',...) creates a new BREASTTUMOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before BreastTumor_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to BreastTumor_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help BreastTumor

% Last Modified by GUIDE v2.5 02-Jun-2021 12:04:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @BreastTumor_OpeningFcn, ...
                   'gui_OutputFcn',  @BreastTumor_OutputFcn, ...
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


% --- Executes just before BreastTumor is made visible.
function BreastTumor_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to BreastTumor (see VARARGIN)

% Choose default command line output for BreastTumor
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes BreastTumor wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = BreastTumor_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Select_File_Button.
function Select_File_Button_Callback(hObject, eventdata, handles)
% hObject    handle to Select_File_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global file;
global OriginalImage;
% set all other thing hidden
set(handles.Preprocess_Image_axes,'visible','off');
cla(handles.Preprocess_Image_axes);
set(handles.Cut_Pectoral_Muscle_Panel,'visible','off');
set(handles.Adj_Size_Edit,'String','1');
set(handles.Reconstructed_Image_axes,'visible','off');
cla(handles.Reconstructed_Image_axes);
set(handles.Reconstructed_Image_Text,'visible','off');
set(handles.Cluster1_axes,'visible','off');
cla(handles.Cluster1_axes);
set(handles.Cluster1_Text,'visible','off');
set(handles.Cluster2_axes,'visible','off');
cla(handles.Cluster2_axes);
set(handles.Cluster2_Text,'visible','off');
set(handles.Cluster3_axes,'visible','off');
cla(handles.Cluster3_axes);
set(handles.Cluster3_Text,'visible','off');
set(handles.Cluster4_axes,'visible','off');
cla(handles.Cluster4_axes);
set(handles.Cluster4_Text,'visible','off');
set(handles.Cluster5_axes,'visible','off');
cla(handles.Cluster5_axes);
set(handles.Cluster5_Text,'visible','off');
set(handles.ChooseCluster_Text,'visible','off');
set(handles.Choose_Cluster_Edit,'visible','off');
set(handles.Choose_Cluster_Edit,'String','');
set(handles.Choose_Button,'visible','off');
set(handles.Postprocess_Image_axes,'visible','off');
cla(handles.Postprocess_Image_axes);
set(handles.Size_Text,'visible','off');
set(handles.Size_Edit,'visible','off');
set(handles.Size_Edit,'String','');
set(handles.Delete_Button,'visible','off');
set(handles.Info_Table,'visible','off');
set(handles.Kmeans_Result_axes,'visible','off');
cla(handles.Kmeans_Result_axes);
set(handles.Save_data_Text,'visible','off');
set(handles.Save_Button,'visible','off');
[file, path] = uigetfile('*.*');
if isequal(file,0)
   disp('User selected Cancel');
else
   disp(['User selected ', path,file]);
   FileLocation = [path, file];
   OriginalImage = im2gray(imread(FileLocation));
   set(handles.Preprocess_Image_axes,'visible','on');
   axes(handles.Preprocess_Image_axes);
   imshow(OriginalImage);
   set(handles.Cut_Pectoral_Muscle_Panel,'visible','on');
end



% --- Executes during object creation, after setting all properties.
function Preprocess_Image_axes_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Preprocess_Image_axes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate Preprocess_Image_axes


% --- Executes during object creation, after setting all properties.
function BitPlane_axes_CreateFcn(hObject, eventdata, handles)
% hObject    handle to BitPlane_axes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate BitPlane_axes


% --- Executes on button press in Left_Button.
function Left_Button_Callback(hObject, eventdata, handles)
% hObject    handle to Left_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global OriginalImage;
adjSize = str2num(get(handles.Adj_Size_Edit,'string'));
I = OriginalImage;
I2 = medfilt2(I);
% tăng cường độ của các pixel
I3 = I2.*10.;
%đổi sang ảnh nhị phân
mask1 = imbinarize(I3);
%lấp các lỗ trong ảnh
mask1 = imfill(mask1, 'holes');
%lấy ra khối có kích thước lớn nhất
mask1 = bwpropfilt(mask1, 'area', 1);
masked = I2;
%loại bỏ các phần ngoài không cần thiết
masked(~mask1) = 0;
[r, c] = size(masked);
for k = 1 : r
    for i = c : -1 : 1
        if mask1(k, i) == 1
            x = i;
            break
        end
    end
    if exist('x') ~= 0
        break
    end
end
for i = r : -1 : 1
    if mask1(i, 1) == 1
        y = i;
        break
    end
end
term = fliplr(mask1);
mask2 = triu(term, floor(adjSize*2*x/3));
mask2 = fliplr(mask2);
processedImage = masked;
%cắt cơ ngực
processedImage(mask2) = 0;
image = adapthisteq(processedImage);
axes(handles.Preprocess_Image_axes);
imshow(image);  

% --- Executes on button press in Right_Button.
function Right_Button_Callback(hObject, eventdata, handles)
% hObject    handle to Right_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global OriginalImage;
adjSize = str2num(get(handles.Adj_Size_Edit,'string'));
I = OriginalImage;
I2 = medfilt2(I);
% tăng cường độ của các pixel
I3 = I2.*10.;
%đổi sang ảnh nhị phân
mask1 = imbinarize(I3);
%lấp các lỗ trong ảnh
mask1 = imfill(mask1, 'holes');
%lấy ra khối có kích thước lớn nhất
mask1 = bwpropfilt(mask1, 'area', 1);
masked = I2;
%loại bỏ các phần ngoài không cần thiết
masked(~mask1) = 0;
[r, c] = size(masked);
for k = 1 : r
    for i = 1 : c
        if mask1(k, i) == 1
            x = i;
            break
        end        
    end
    if exist('x') ~=0
        break
    end
end
for i = r : -1 : 1
    if mask1(i, c) == 1
        y = i;
        break
    end
end
mask2 = triu(mask1, floor(adjSize*2*(c - x)/3));
processedImage = masked;
%cắt cơ ngực
processedImage(mask2) = 0;
image = adapthisteq(processedImage);
axes(handles.Preprocess_Image_axes);
imshow(image); 

% --- Executes during object creation, after setting all properties.


% --- Executes during object creation, after setting all properties.
function Cut_Pectoral_Muscle_Panel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Cut_Pectoral_Muscle_Panel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function Adj_Size_Edit_Callback(hObject, eventdata, handles)
% hObject    handle to Adj_Size_Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Adj_Size_Edit as text
%        str2double(get(hObject,'String')) returns contents of Adj_Size_Edit as a double


% --- Executes during object creation, after setting all properties.
function Adj_Size_Edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Adj_Size_Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Confirm_Button.
function Confirm_Button_Callback(hObject, eventdata, handles)
% hObject    handle to Confirm_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
PreprocessedImage = getimage(handles.Preprocess_Image_axes);
BitplaneImage = bitplane_gui(PreprocessedImage);
dataImage = reshape(BitplaneImage, [], 1);
dataImage = double(dataImage);
%chạy thuật toán k-means
[idx,C]=kmeans(dataImage,5,'Distance','cityblock','Display','final','Replicates',5);
idxImage = reshape(idx, size(BitplaneImage));
cluster1 = idxImage==1;
cluster2 = idxImage==2;
cluster3 = idxImage==3;
cluster4 = idxImage==4;
cluster5 = idxImage==5;
set(handles.Reconstructed_Image_axes,'visible','on');
set(handles.Reconstructed_Image_Text,'visible','on');
axes(handles.Reconstructed_Image_axes);
imshow(BitplaneImage); 
set(handles.Cluster1_axes,'visible','on');
set(handles.Cluster1_Text,'visible','on');
axes(handles.Cluster1_axes);
imshow(cluster1); 
set(handles.Cluster2_axes,'visible','on');
set(handles.Cluster2_Text,'visible','on');
axes(handles.Cluster2_axes);
imshow(cluster2); 
set(handles.Cluster3_axes,'visible','on');
set(handles.Cluster3_Text,'visible','on');
axes(handles.Cluster3_axes);
imshow(cluster3); 
set(handles.Cluster4_axes,'visible','on');
set(handles.Cluster4_Text,'visible','on');
axes(handles.Cluster4_axes);
imshow(cluster4); 
set(handles.Cluster5_axes,'visible','on');
set(handles.Cluster5_Text,'visible','on');
axes(handles.Cluster5_axes);
imshow(cluster5); 
set(handles.ChooseCluster_Text,'visible','on');
set(handles.Choose_Cluster_Edit,'visible','on');
set(handles.Choose_Button,'visible','on');

function Choose_Cluster_Edit_Callback(hObject, eventdata, handles)
% hObject    handle to Choose_Cluster_Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Choose_Cluster_Edit as text
%        str2double(get(hObject,'String')) returns contents of Choose_Cluster_Edit as a double


% --- Executes during object creation, after setting all properties.
function Choose_Cluster_Edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Choose_Cluster_Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Choose_Button.
function Choose_Button_Callback(hObject, eventdata, handles)
% hObject    handle to Choose_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ChoosenImage;
Cluster1=getimage(handles.Cluster1_axes);
Cluster2=getimage(handles.Cluster2_axes);
Cluster3=getimage(handles.Cluster3_axes);
Cluster4=getimage(handles.Cluster4_axes);
Cluster5=getimage(handles.Cluster5_axes);
Cluster={Cluster1 Cluster2 Cluster3 Cluster4 Cluster5};
ChoosenIndex = str2num(get(handles.Choose_Cluster_Edit,'string'));
ChoosenImage = Cluster{ChoosenIndex};
set(handles.Postprocess_Image_axes,'visible','on');
axes(handles.Postprocess_Image_axes);
imshow(ChoosenImage)
%tìm tâm và diện tích từng khối u
info = regionprops(ChoosenImage, 'centroid', 'Area');
%hiển thị diện tích các khối u
area = cat(1,info.Area);
set(handles.Info_Table,'ColumnName', 'Area');
set(handles.Info_Table,'Data',area);
set(handles.Size_Text,'visible','on');
set(handles.Size_Edit,'visible','on');
set(handles.Delete_Button,'visible','on');
set(handles.Info_Table,'visible','on');


function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function Info_Table_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Info_Table (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(handles.Info_Table,'Data',cell(3,1));



function Size_Edit_Callback(hObject, eventdata, handles)
% hObject    handle to Size_Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Size_Edit as text
%        str2double(get(hObject,'String')) returns contents of Size_Edit as a double


% --- Executes during object creation, after setting all properties.
function Size_Edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Size_Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Delete_Button.
function Delete_Button_Callback(hObject, eventdata, handles)
% hObject    handle to Delete_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global OriginalImage;
global ChoosenImage;
Size = str2num(get(handles.Size_Edit,'string'));
TumorImage = ChoosenImage;
image = bwareaopen(TumorImage, Size);
%Kmeans Result
%làm trơn ảnh
se = strel('disk',5);
image = imopen(image,se);
image = imclose(image,se);
axes(handles.Postprocess_Image_axes);
imshow(image)
%hiển thị khối u lên ảnh
CC = bwconncomp(image);
L = labelmatrix(CC);
RGB = label2rgb(L);
hh=imfuse(OriginalImage,RGB,'blend');
set(handles.Kmeans_Result_axes,'visible','on');
axes(handles.Kmeans_Result_axes);
imshow(hh)
set(handles.Save_data_Text,'visible','on');
set(handles.Save_Button,'visible','on');


% --- Executes on button press in Save_Button.
function Save_Button_Callback(hObject, eventdata, handles)
% hObject    handle to Save_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global file;
n = strlength(file);
FileName = file(1:n-4);
SaveLocation = uigetdir;
if SaveLocation ~= 0
    KmeansResult = getimage(handles.Kmeans_Result_axes);
    imwrite(KmeansResult,[SaveLocation '\KmeansResult_' file]);
    TumorImage = getimage(handles.Postprocess_Image_axes);
    TumorData = regionprops(TumorImage, 'centroid', 'Area');
    writetable(struct2table(TumorData),[SaveLocation '\' FileName '.txt']);
end
