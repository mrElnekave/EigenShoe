%EigenShoeRunner - One line description of what the script performs (H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%   Optional file header info (to give more details about the function than in the H1 line)
%
%   Description:
%       UNTITLED description
%
%   Output:
%       UNTITLED output
%
%   Other m-files required: none
%   MAT-files required: none
%
%   See also: OTHER_SCRIPT_NAME,  OTHER_FUNCTION_NAME

%   Author:
%   Address:
%   email:
%   Website: http://www.
%   Date: 21-Mar-2023; Last revision: 21-Mar-2023
%
%   Copyright (c) 2023, Author

%%
clear
clc

%% Load images

names = ["Ansazi", "Instincts", "RedLine", "Spire"];
[IMAGE_DIM, IMAGE_SIZE, num_shoes, Shoes, Lookup] = LoadImages(names, 4);

% Get only the right facing shoes ie numbers 1,2 but not 3,4 and 5,6 but not 7,8
LeftShoes = zeros(IMAGE_SIZE, num_shoes / 2);
RightShoes = zeros(IMAGE_SIZE, num_shoes / 2);

for i = 1:num_shoes
    left = mod(floor((i - 1) / 2), 2) == 0;

    if left
        LeftShoes(:, floor((i - 1) / 2) + 1) = Shoes(:, i);
    end

    if ~left
        RightShoes(:, floor((i - 1) / 2) + 1) = Shoes(:, i);
    end

end

Shoes = LeftShoes;

clear i left

%% Get SVD

avgShoe = mean(Shoes, 2);

Shoes = Shoes - avgShoe * ones(1, size(Shoes, 2));
[U, S, V] = svd(Shoes, 'econ');

norm(Shoes - U * S * V');
disp("How close the svd is to the matrix: " + num2str(ans));

%% Get r values
semilogy(diag(S)), grid off
xlabel('r')
ylabel('Singular value, \sigma_r')

pause(1);
close all

%% Plot first nine eigen shoes
figure(1)

for i = 1:9
    subplot(3, 3, i)
    img = reshape(U(:, i), IMAGE_DIM, IMAGE_DIM) * 1000;
    imshow(img)
end

%% Show how right and left shoes are different, build a classifier

% Project the All shoes onto the 4th and 5th and 6th eigen shoes

Left_Plot = zeros(3, size(LeftShoes, 2));

% left shoes
for i = 1:size(LeftShoes, 2)
    LeftShoes(:, i) = LeftShoes(:, i) - avgShoe;
    Left_Plot(:, i) = LeftShoes(:, i)' * U(:, 4:6);
end

Right_Plot = zeros(3, size(RightShoes, 2));

% right shoes
for i = 1:size(RightShoes, 2)
    RightShoes(:, i) = RightShoes(:, i) - avgShoe;
    Right_Plot(:, i) = RightShoes(:, i)' * U(:, 4:6);
end

figure(2)
plot3(Left_Plot(1, :), Left_Plot(2, :), Left_Plot(3, :), 'o', 'MarkerSize', 10, 'MarkerFaceColor', 'b')
hold on
plot3(Right_Plot(1, :), Right_Plot(2, :), Right_Plot(3, :), 'o', 'MarkerSize', 10, 'MarkerFaceColor', 'r')
xlabel('4th Eigen Shoe')
ylabel('5th Eigen Shoe')
zlabel('6th Eigen Shoe')
legend('Left Shoes', 'Right Shoes')
