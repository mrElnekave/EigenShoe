%LoadImagesAndScale - loads and scales images
%   Gives you access to 4 important variables, describing the shoe array.
%   Taken from the train directory.
%
%   Description:
%       UNTITLED description
%
%   Output:
%       IMAGE_DIM - The row and column size of a resized image
%       IMAGE_SIZE - IMAGE_DIM * IMAGE_DIM, the size of an image vector
%       num_shoes - Number of files (images parsed)
%       Shoes - Matrix of vectors of IMAGE_SIZE images.
%
%   Other m-files required: none
%   MAT-files required: none
%
%   See also: RunEigenshoe.mlx

%   Author: Yamm Elnekave
%   Date: 13-Mar-2023; Last revision: 13-Mar-2023
%
%   Copyright (c) 2023, Yamm Elnekave

%% Clear everything
clear
close
clc

%% Define sizes
IMAGE_DIM = 255;
IMAGE_SIZE = IMAGE_DIM * IMAGE_DIM;

%% Load data from folder using Train directory



files = dir('Train/*.jpg');
num_shoes = numel(files);

Shoes = zeros(IMAGE_SIZE, num_shoes);

for i = 1:num_shoes
    filename = files(i).name;
    fullFileName = fullfile(files(i).folder, filename);
    fprintf(1, 'Now reading %s\n', fullFileName);

    imageArray = imread(fullFileName);
    imshow(imageArray);

    imageArray = im2gray(imageArray);
    imageArray = imresize(imageArray, [IMAGE_DIM, IMAGE_DIM]);
    Shoes(:, i) = reshape(double( im2gray(imageArray) ) , IMAGE_SIZE, 1) ;

    pause(.2);
end
close

clear filename files fullFileName i imageArray


