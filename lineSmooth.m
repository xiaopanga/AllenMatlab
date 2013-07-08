function result = lineSmooth(Inputline,binSize)

if(size(Inputline,1)==1)
    Inputline = Inputline';
end
result = [];
for i=1:binSize:(size(Inputline,1)-binSize)
    result = [result; floor(i+binSize/2) mean(Inputline(i:i+binSize))];
end

end