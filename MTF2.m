function [LPMM,mtf,rect,rect2,Group,Element]=MTF2(im,rect,rect2,Group,Element)


im = cast(im,'double');
if(nargin==1)
    colormap(jet);
    imagesc(im);
    [Mask,rect] = imcrop();
    imagesc(Mask);
    colormap(jet)
    [Mask2,rect2] = imcrop();
    prompt = {'Group Number?','Element Number?'};
    dlg_title = 'Input';
    num_lines = 1;
    GroupAndElement = inputdlg(prompt,dlg_title,num_lines);
    Group = str2double(GroupAndElement{1});
    Element = str2double(GroupAndElement{2});
else if (nargin==5)
        

        [Mask,rect] = imcrop(im,rect);

        [Mask2,rect2] = imcrop(Mask,rect2);
    else
        display('There should be either 5 or 1 inputs');
        return;
        
    end
end

MaxIntensity = max(max(Mask2));
MinIntensity = min(min(Mask2));


LPMM = USAFTargetResolution(Group,Element);
mtf = MTF(cast(MaxIntensity,'double'),cast(MinIntensity,'double'));

