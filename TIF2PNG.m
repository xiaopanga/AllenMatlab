list = dir();

for i =1:size(list,1)
    if(list(i).isdir ==0)&&(size(strfind(list(i).name,'.TIF'),1)>0)
        im = imread(list(i,1).name);
        im = cast(im,'uint16');
        imwrite(im,strrep(list(i).name,'.TIF','.png'));
    end
end