function [IMAGE_DIM, IMAGE_SIZE, num_shoes, LeftShoes, RightShoes, Lookup] = LoadImagesBig(pics_per_shoe, show)
    % LoadImages - loads and scales images
    %   Gives you access to 4 important variables, describing the shoe array.
    %   Taken from the train directory.
    %
    %   File Structure:
    %       Left/
    %           NAME/
    %               *.jpg
    %               ...
    %           NAME2/ ...
    %       Right/
    %           NAME/
    %               *.jpg
    %               ...
    %           NAME2/ ...
    %
    %   Syntax:
    %       [IMAGE_DIM, IMAGE_SIZE, num_shoes, LeftShoes, RightShoes, Lookup] = LoadImagesBig( );
    %       [IMAGE_DIM, IMAGE_SIZE, num_shoes, LeftShoes, RightShoes, Lookup] = LoadImagesBig( 3 );
    %       [IMAGE_DIM, IMAGE_SIZE, num_shoes, LeftShoes, RightShoes, Lookup] = LoadImagesBig( 3, true );
    %
    %   Description:
    %       LoadImages() - loads and scales images
    %
    %   Inputs:
    %       pics_per_shoe - Number of images per shoe, default is 4.
    %       show - Show the images as they are loaded, default is false.
    %
    %   Output:
    %       IMAGE_DIM - The row and column size of a resized image
    %       IMAGE_SIZE - IMAGE_DIM * IMAGE_DIM, the size of an image vector
    %       num_shoes - Number of different shoes (images parsed / 2)
    %       LeftShoes - A Matrix of all the left shoes, each column is a
    %       reshaped image
    %       RightShoes - A Matrix of all the right shoes, each column is a
    %       reshaped image
    %       Lookup - A Matrix with the name each index of Shoe is associated
    %       with. The first column is the left shoe, the second column is the
    %       right shoe.
    %
    %
    %   See also: RunEigenShoe.mlx
    %   Author: Yamm Elnekave
    %   Date: 21-Mar-2023; Last revision: 21-Mar-2023
    %
    %   Copyright (c) 2023, Yamm Elnekave
    %   All rights reserved.

    %% Check Existence
    if ~exist('pics_per_shoe', 'var')
        pics_per_shoe = 4;
    end

    if ~exist('show', 'var')
        show = false;
    end

    %% Define sizes
    IMAGE_DIM = 255;
    IMAGE_SIZE = IMAGE_DIM * IMAGE_DIM;

    % Left
    files = dir('Left/*/*');
    num_shoes = numel(files);

    % lookup for both left and right shoes
    Lookup = string(zeros(num_shoes, 2));

    LeftShoes = zeros(IMAGE_SIZE, num_shoes);

    left_folders = dir('Left/*');

    for i = 3:numel(left_folders)
        left_files = dir("Left/" + left_folders(i).name + "/*.jpg");
        num_this_shoe = numel(left_files); % Should be 4

        if num_this_shoe ~= pics_per_shoe
            error("There should be " + pics_per_shoe + " images per shoe, but there are " + num_this_shoe + " for " + name);
        end

        for j = 1:num_this_shoe
            filename = left_files(j).name;

            fullFileName = fullfile(left_files(j).folder, filename);
            index = (i - 1) * pics_per_shoe + j;

            fprintf(1, 'Now reading %s for left shoe %d of %d \r', fullFileName, index, num_shoes);

            imageArray = imread(fullFileName);

            if show
                imshow(imageArray);
            end

            imageArray = im2gray(imageArray);
            imageArray = imresize(imageArray, [IMAGE_DIM, IMAGE_DIM]);
            LeftShoes(:, index) = reshape(double(im2gray(imageArray)), IMAGE_SIZE, 1);

            % Lookup
            Lookup(index, 1) = filename(1:3);

            if show
                pause(.2);
            end

        end

        clear filename left_files fullFileName j imageArray num_this_shoe ans files

    end

    % Right

    files = dir('Right/*/*');
    num_shoes = numel(files);

    RightShoes = zeros(IMAGE_SIZE, num_shoes);

    right_folders = dir('Right/*');

    for i = 3:numel(right_folders)
        right_files = dir("Right/" + right_folders(i).name + "/*.jpg");
        num_this_shoe = numel(right_files); % Should be 4

        if num_this_shoe ~= pics_per_shoe
            error("There should be " + pics_per_shoe + " images per shoe, but there are " + num_this_shoe + " for " + name);
        end

        for j = 1:num_this_shoe
            filename = right_files(j).name;

            fullFileName = fullfile(right_files(j).folder, filename);
            index = (i - 1) * pics_per_shoe + j;

            fprintf(1, 'Now reading %s for right shoe %d of %d \r', fullFileName, index, num_shoes);

            imageArray = imread(fullFileName);

            if show
                imshow(imageArray);
            end

            imageArray = im2gray(imageArray);
            imageArray = imresize(imageArray, [IMAGE_DIM, IMAGE_DIM]);
            RightShoes(:, index) = reshape(double(im2gray(imageArray)), IMAGE_SIZE, 1);

            % Lookup
            Lookup(index, 2) = filename(1:3);

            if show
                pause(.2);
            end

        end

        clear filename right_files fullFileName j imageArray num_this_shoe ans files

    end

end
