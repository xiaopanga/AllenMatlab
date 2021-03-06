[FileName,PathName,~]=uigetfile({'*.TIF'});


fileList = dir(PathName);

maxToMinRatio = 0;
fileNumber = 1;
for i = 1:size(fileList,1)
    if(fileList(i).isdir == 0)&&( size(strfind(fileList(i).name,'.TIF'),2)>0)
        im = imread(strcat(PathName,fileList(i).name));
        maxVal = max(max(im));
        minVal = min(min(im))+1;
        if(maxToMinRatio<(maxVal/minVal))
            maxToMinRatio = maxVal/minVal;
            fileNumber = i;
        end
        
    end
end
FileLocation = strcat(PathName,fileList(fileNumber).name);
im = imread(FileLocation);
im = cast(im,'uint16');
imagesc(im)
[X,Y,Mask,rect] = imcrop();
imagesc(Mask);
[X2,Y2,Mask,rect2] = imcrop();
prompt = {'Name Format '};
dlg_title = 'Input';
num_lines = 1;

NameFormat = inputdlg(prompt,dlg_title,num_lines);

data = [];

for i = 1:size(fileList,1)
    %find min and max values
    if(fileList(i).isdir == 0)&&( size(strfind(fileList(i).name,'.TIF'),2)>0)
        [list] = sscanf(fileList(i).name,NameFormat{1});
        im = imread(strcat(PathName,fileList(i).name));
        im = cast(im,'uint16');
        Mask = imcrop(im,rect);
        Mask = imcrop(Mask,rect2);
        avg_value = mean(mean(Mask));   
        data = [data;list' avg_value];
    end
end