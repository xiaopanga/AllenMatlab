


[FileName,PathName,~]=uigetfile({'*.TIF'});

im = imread(strcat(PathName,FileName));

h = imagesc(im);
data = [];
[mask,rect] = imcrop();
fileList = dir(PathName);
close all;
hold on;
for i = 1:size(fileList,1)
    if(fileList(i).isdir == 0)&&( size(strfind(fileList(i).name,'.TIF'),2)>0)
        im = imread(strcat(PathName,fileList(i).name));
        mask = imcrop(im,rect);
        [status, dat, e, fitme, esf, nbin, del2] = sfrmat3(1,1,1,mask);
        stored = [dat(:,1)*(1024/23) dat(:,2)];
        [list] = sscanf(fileList(i).name,'%*8c%i%*c%i%*s');
        data = [data [list'; stored]];
        plot(stored(:,1), stored(:,2));
    end
end
hold off;