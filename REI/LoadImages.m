function [IMAGE_DIM, IMAGE_SIZE, num_shoes, Shoes, Lookup] = LoadImages(names, pics_per_shoe, show)
    % LoadImages - loads and scales images
    %   Gives you access to 4 important variables, describing the shoe array.
    %   Taken from the train directory.
    %
    %   Syntax:
    %       [IMAGE_DIM, IMAGE_SIZE, num_shoes, Shoes, Lookup] = LoadImages( names );
    %       [IMAGE_DIM, IMAGE_SIZE, num_shoes, Shoes, Lookup] = LoadImages( names , 3);
    %       [IMAGE_DIM, IMAGE_SIZE, num_shoes, Shoes, Lookup] = LoadImages( names , 3, true);
    %
    %   Description:
    %       LoadImages() - loads and scales images
    %
    %   Inputs:
    %       names - Names of the files at Train/name, there should be files of
    %       Train/name1/2/3/4. ie. 4 per name.
    %       pics_per_shoe - Number of images per shoe, default is 4.
    %       show - Show the images as they are loaded, default is false.
    %
    %   Output:
    %       IMAGE_DIM - The row and column size of a resized image
    %       IMAGE_SIZE - IMAGE_DIM * IMAGE_DIM, the size of an image vector
    %       num_shoes - Number of files (images parsed)
    %       Shoes - Matrix of vectors of IMAGE_SIZE images.
    %       Lookup - A Matrix with the name each index of Shoe is associated
    %       with
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

    %% Load data from folder using Train directory

    files = dir('Train/*.jpg');
    num_shoes = numel(files);

    Shoes = zeros(IMAGE_SIZE, num_shoes);
    Lookup = string(zeros(num_shoes, 1));

    for name_i = 1:length(names)
        name = names(name_i);
        files = dir("Train/" + name + "*.jpg");
        num_this_shoe = numel(files); % Should be 4

        if num_this_shoe ~= pics_per_shoe
            error("There should be " + pics_per_shoe + " images per shoe, but there are " + num_this_shoe + " for " + name);
        end

        for i = 1:num_this_shoe
            filename = files(i).name;

            fullFileName = fullfile(files(i).folder, filename);
            fprintf(1, 'Now reading %s\n', fullFileName);

            imageArray = imread(fullFileName);

            if show
                imshow(imageArray);
            end

            imageArray = im2gray(imageArray);
            imageArray = imresize(imageArray, [IMAGE_DIM, IMAGE_DIM]);
            index = (name_i - 1) * pics_per_shoe + i;
            Shoes(:, index) = reshape(double(im2gray(imageArray)), IMAGE_SIZE, 1);
            Lookup(index) = name;

            if show
                pause(.2);
            end

        end

        close

        clear filename files fullFileName i imageArray

    end

    % % Get only the right facing shoes ie numbers 1,2 but not 3,4 and 5,6 but not 7,8
    % newShoes = zeros(IMAGE_SIZE, num_shoes / 2);

    % for i = 1:num_shoes
    %     good = mod(floor((i - 1) / 2), 2) == 0;

    %     if good
    %         newShoes(:, floor((i - 1) / 2) + 1) = Shoes(:, i);
    %     end

    % end

    % Shoes = newShoes;

end
