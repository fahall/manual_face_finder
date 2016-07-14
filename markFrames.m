function [ output ] = markFrames( image )
im = imread(image);
imshow(im);

numFaces = 'a'
while ~ is_digit(numFaces)
    numFaces = input('How many faces do you see? >> ', 's');

    if strcmp(numFaces,'0') == 1
        output = {'0', '0', '0', '0'};
        return;
    end
end
    
zoomClasses = {'ECU', 'CU', 'MCU', 'MS', 'MLS', 'LS', 'ELS'};
zoom = 'q';
while ~ any(strcmp(zoomClasses,zoom) == 1) 
    disp([
        'Zooms\n********************', char(10) ,...
        'ECU - Extreme Close Up', char(10) , ...
        'CU  - Close Up ', char(10) , ...
        'MCU - Medium Close Up', char(10) , ...
        'MS  - Medium Shot', char(10) ,...
        'MLS - Medium Long Shot', char(10) , ...
        'LS  - Long Shot', char(10) ,...
        'ELS - Extreme Long Shot'])

    zoom = input('What Zoom? >> ', 's');
    disp(zoom)
end

vertClasses = {'T', 'M', 'B'};
vert = 'q';
while ~ any(strcmp(vertClasses,vert) == 1) 
    disp([...
        'Verticals\n********************', char(10) ,...
        'T - Top', char(10) , ...
        'M  - Middle', char(10) , ...
        'B - Bottom', char(10) ])

    vert = input('What Vertical Position?', 's');
end

horzClasses = {'L', 'C', 'R'};
horz = 'q';
while ~ any(strcmp(horzClasses,horz) == 1) 
    disp([...
        'Horizontals\n********************', char(10) ,...
        'L - Left', char(10) , ...
        'C - Center', char(10) , ...
        'R - Right', char(10) ])

    horz = input('What Horizontal Position?', 's');
end

output = {numFaces, zoom, vert, horz};
end

% Is string numeric?
function out = is_digit(s)
    out = ~isempty(parse_float(s));
end

% Returns the float (double) if true, empty array otherwise.
function f = parse_float(s)
    [f_in_cell, pos] = textscan(s, '%f');
    % Make sure there are no trailing chars. textscan(..) is greedy.
    if pos == length(s)
        f = f_in_cell{:};
    else
        f = [];
    end
end