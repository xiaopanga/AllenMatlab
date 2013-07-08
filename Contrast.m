
[FileName,PathName,~]=uigetfile({'*.TIF'});

fileList = dir(PathName);
data = [];
smoothedData = [];
if(exist('Mask')~=0)
    clear Mask;
end
for i = 1:size(fileList,1)
    if(fileList(i).isdir == 0)&&( size(strfind(fileList(i).name,'.TIF'),2)>0)
        if (exist('Mask')==0)
            im = imread(fileList(i).name);
            im = cast(im,'double');
            colormap(jet);
            imagesc(im);
            [X,Y,Mask,rect] = imcrop();
        else
            im = imread(fileList(i).name);
            im = cast(im,'double');
            [X,Y,Mask,rect] = imcrop(im,rect);
        end
        [list] = sscanf(fileList(i).name,'%*9c%i%*c%i%*s');
        
        MaxIntensity = max(max(Mask));
        MinIntensity = min(min(Mask));
        
        
        data =[data;[list' MTF(cast(MaxIntensity,'double'),cast(MinIntensity,'double'))]];
        
    end
end
xlswrite('ContrastData.xlsx',data);








