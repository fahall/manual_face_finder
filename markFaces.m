function [ bBoxVec ] = markFaces( image )
im = imread(image);
imshow(im);
numFaces = input('How many faces do you see? >> ');

positions = zeros(1, numFaces * 4);
for i = 1:numFaces
    rect = imrect;
    pause;
    pos = getPosition(rect)


    %normalize based on resolution
    pos(1,[1,3]) = pos(1,[1,3])/size(im, 2);
    pos(1,[2,4]) = pos(1,[2,4])/size(im, 1);

    positions(1, (4 * (i - 1) + 1):4*i) = pos;
end

bBoxVec = positions;
end

