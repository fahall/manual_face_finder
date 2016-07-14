function [ boxes ] = groundTruthShots(filename, sampRate, start)

ims = dir('*.jpg');

cur = start;
total = ceil(length(ims)/sampRate);
start = ((start-1) * sampRate) + 1;
for i = start:sampRate:length(ims)
    [~,base, ~] = fileparts(ims(i).name);

    disp(strcat('Loading:', base));
    disp(strcat(num2str(cur), '/', num2str(total)));
    cur = cur + 1;
    fid = fopen(filename, 'a');
    frame_class = markFrames(ims(i).name);
    disp(frame_class)
    str = '';
    for i = 1:length(frame_class)
     str = strcat(sprintf('%.06f,' , frame_class{i}));
    end
     str = str(1:end-1);
     str = strcat(base, ',', str);
     fprintf(fid, '%s\n', str);
     fclose(fid);

end

end
