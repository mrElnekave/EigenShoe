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

files = dir('TrainOrig/*.jpg');
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
    Shoes(:, i) = reshape(double(im2gray(imageArray)), IMAGE_SIZE, 1);

    pause(.2);
end

close

clear filename files fullFileName i imageArray

% New thing

% Project the All shoes onto 3 eigen shoes

Eigens = [2, 3, 4];

Left_Plot = zeros(3, size(LeftShoes, 2));

% normalize and get its multiplier of the eigenvalues of left shoes
for i = 1:size(LeftShoes, 2)
    LeftShoes(:, i) = LeftShoes(:, i) - avgShoe;
    Left_Plot(:, i) = LeftShoes(:, i)' * U(:, Eigens);
end

Right_Plot = zeros(3, size(RightShoes, 2));

% right shoes
for i = 1:size(RightShoes, 2)
    RightShoes(:, i) = RightShoes(:, i) - avgShoe;
    Right_Plot(:, i) = RightShoes(:, i)' * U(:, Eigens);
end

figure()
plot3(Left_Plot(1, :), Left_Plot(2, :), Left_Plot(3, :), 'o', 'MarkerSize', 10, 'MarkerFaceColor', 'b')
hold on
plot3(Right_Plot(1, :), Right_Plot(2, :), Right_Plot(3, :), 'o', 'MarkerSize', 10, 'MarkerFaceColor', 'r')
xlabel(string(Eigens(1, 1)) + 'th Eigen Shoe')
ylabel(string(Eigens(1, 2)) + 'th Eigen Shoe')
zlabel(string(Eigens(1, 3)) + 'th Eigen Shoe')
legend('Left Shoes', 'Right Shoes')

% Overlay my right instinct shoe and see where it lives

testPts = testShoeCentred' * U(:, Eigens);
plot3(testPts(1), testPts(2), testPts(3), 'o', 'MarkerSize', 10, 'MarkerFaceColor', 'y')

% Calculate the distance between the test shoe and all the left shoes
% Calculate the distance between the test shoe and all the right shoes
% determine which is closer
% display the result

dist_right = 0;
dist_left = 0;

for i = 1:size(Left_Plot, 2)
    dist_left = dist_left + norm(testPts - Left_Plot(:, i));
end

for i = 1:size(Right_Plot, 2)
    dist_right = dist_right + norm(testPts - Right_Plot(:, i));
end

% make a matlab popup
if dist_left < dist_right
    msgbox('The shoe is a left shoe')
else
    msgbox('The shoe is a right shoe')
end
