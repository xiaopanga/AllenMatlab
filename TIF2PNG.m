[FileName,PathName,FilterIndex]=uigetfile({'*.TIF'},'MultiSelect', 'on');

for i =1:size(FileName,2)
    filename = strcat(PathName,FileName{i});
    
    im = imread(filename);
    im = cast(im,'uint16');
    imwrite(im,strrep(filename,'.TIF','.png'));
    
end