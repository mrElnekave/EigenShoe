%EigenFace.m - One line description of what the script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Description:
%       UNTITLED2 description
%
%   Output:
%       UNTITLED2 output
%
%   Other m-files required: none
%   MAT-files required: none
%
%   See also: OTHER_SCRIPT_NAME,  OTHER_FUNCTION_NAME

%   Author:
%   Address:
%   email:
%   Website: http://www.
%   Date: 01-Mar-2023; Last revision: 01-Mar-2023
%
%   Copyright (c) 2023, Author


%% Data load and clear screen
clear
close
clc

load ./Yale_64x64.mat

%% Split the data
number_pics_p_person = sum(gnd == 1);
number_of_people = (length(gnd) / number_pics_p_person);
pic_size = [64; 64];

people_lib = zeros(number_of_people, number_pics_p_person, pic_size(1), pic_size(2));
for person_index = 1:number_of_people
    for pic_index = 1:number_pics_p_person
        index = (person_index - 1) * number_pics_p_person + pic_index;
        people_lib(person_index, pic_index, :, :) = reshape(fea(index, :), pic_size(1), pic_size(2));
    end
end

%% Show one person one facew

person1_1 = squeeze(people_lib(1, 1, :, :));


figure(1), axes('position',[0  0  1  1]), axis off
imagesc(person1_1), colormap gray


%% Show all faces of one person
one_person_size = pic_size;
one_person_size(2) = number_pics_p_person * pic_size(2);
one_person = zeros(one_person_size');

for pic_index = 1:number_pics_p_person
    x_start = (pic_index - 1) * pic_size(1) + 1;
    x_end = x_start + pic_size(1) - 1;
    y_start = 1;
    y_end = pic_size(2);

    one_person(x_start:x_end, y_start:y_end) = people_lib(1, pic_index, :, :);
end

figure(1), axes('position',[0  0  1  1]), axis off
imagesc(one_person), colormap gray