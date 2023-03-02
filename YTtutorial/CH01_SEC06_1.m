clear all, close all, clc

load ./allFaces.mat

pic_size = [n, m];
pics_6x6 = [6, 6];
pixels_size = pics_6x6 .* pic_size;

allPersons = zeros(pixels_size);
for i=1:pics_6x6(1, 1)
    for j=1:pics_6x6(1, 2)
        count = (i - 1) * 6 + j;
        allPersons(1+(i-1)*n:i*n, 1+(j-1)*m:j*m) ...
            = reshape(faces(:,1+sum(nfaces(1:count-1))),n,m);
    end
end

figure(1), axes('position',[0  0  1  1]), axis off
imagesc(allPersons), colormap gray

%%

figure(2), axes('position',[0  0  1  1]), axis off

for person = 1:length(nfaces)
    subset = faces(:,1+sum(nfaces(1:person-1)):sum(nfaces(1:person)));
    allFaces = zeros(n*8,m*8);
    
    count = 1;
    for i=1:8
        for j=1:8
            if(count<=nfaces(person)) 
                allFaces(1+(i-1)*n:i*n,1+(j-1)*m:j*m) ...
                    = reshape(subset(:,count),n,m);
                count = count + 1;
            end
        end
    end
    
    imagesc(allFaces), colormap gray    
end