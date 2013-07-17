
[FileName,PathName,~]=uigetfile({'*.TIF'});

fileList = dir(PathName);
data = [];
smoothedData = [];
if(exist('Mask')~=0)
    clear Mask;
end
prompt = {'Parsing String'};
dlg_title = 'Input';
num_lines = 1;
GroupAndElement = inputdlg(prompt,dlg_title,num_lines);
    im = imread(strcat(PathName,FileName));
            im = cast(im,'double');
            colormap(jet);
            imagesc(im);
            [X,Y,Mask,rect] = imcrop();
for i = 1:size(fileList,1)
    if(fileList(i).isdir == 0)&&( size(strfind(fileList(i).name,'.TIF'),2)>0)
        if (exist('Mask')==0)
            im = imread(strcat(PathName,fileList(i).name));
            im = cast(im,'double');
            colormap(jet);
            imagesc(im);
            [X,Y,Mask,rect] = imcrop();
        else
            im = imread(strcat(PathName,fileList(i).name));
            im = cast(im,'double');
            [X,Y,Mask,rect] = imcrop(im,rect);
        end
        [list] = sscanf(fileList(i).name,GroupAndElement{1});
        
        MaxIntensity = max(max(Mask));
        MinIntensity = min(min(Mask));
        
        
        data =[data;[list' MaxIntensity MinIntensity MTF(cast(MaxIntensity,'double'),cast(MinIntensity,'double'))]];
        
    end
end
xlswrite('ContrastData.xlsx',data);








