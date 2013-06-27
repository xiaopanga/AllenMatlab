
[FileName,PathName,~]=uigetfile({'*.TIF'});
FileLocation = strcat(PathName,FileName);
im = imread(FileLocation);
im = cast(im,'uint16');
[X,Y,Mask,rect] = imcrop(im);
[X2,Y2,Mask,rect2] = imcrop(Mask);
prompt = {'Group Number?','Element Number?'};
dlg_title = 'Input';
num_lines = 1;
GroupAndElement = inputdlg(prompt,dlg_title,num_lines);


MaxIntensity = max(max(Mask));
MinIntensity = min(min(Mask));
mtf = MTF(cast(MaxIntensity,'double'),cast(MinIntensity,'double'));
Group = str2double(GroupAndElement{1});
Element = str2double(GroupAndElement{2});
LPMM = USAFTargetResolution(Group,Element);
data = [data; LPMM mtf];








