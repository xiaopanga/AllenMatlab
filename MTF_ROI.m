
[FileName,PathName,~]=uigetfile({'*.TIF'});
FileLocation = strcat(PathName,FileName);

im = imread(FileLocation);
im = cast(im,'uint16');
Mask = imcrop(im);
Mask = imcrop(Mask);
%find min and max values
Max_intensity = max(max(Mask));
Min_intensity = min(min(Mask));








