function [ boxes ] = groundTruthFaces(filename, sampRate)

fid = fopen(filename, 'a')

ims = dir('*.jpg')

for i = 1:sampRate:length(ims)
    boxes = markFaces(ims(i).name);
    str = sprintf('%.06f,' , boxes);
    str = str(1:end-1);
    [~,base, ~] = fileparts(ims(i).name);
    str = strcat(base, ',', str);
    fprintf(fid, '%s\n', str);
end

fclose(fid);
end

