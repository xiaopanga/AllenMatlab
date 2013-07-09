[FileName,PathName,~]=uigetfile({'*.TIF'});

FileLocation = strcat(PathName,FileName);
im = imread(FileLocation);
im = cast(im,'uint16');
colormap(jet);
imagesc(im);
[X,Y,Mask,rect] = imcrop();
imagesc(Mask);
colormap(jet);
[X2,Y2,Mask2,rect2] = imcrop();
prompt = {'Group Number?','Element Number?'};
dlg_title = 'Input';
num_lines = 1;
GroupAndElement = inputdlg(prompt,dlg_title,num_lines);


MaxIntensity = max(max(Mask2));
MinIntensity = min(min(Mask2));

Group = str2double(GroupAndElement{1})
Element = str2double(GroupAndElement{2})
LPMM = USAFTargetResolution(Group,Element)
mtf = MTF(cast(MaxIntensity,'double'),cast(MinIntensity,'double'))

