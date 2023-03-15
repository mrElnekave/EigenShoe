clear all, close all, clc

load ./allFaces.mat

% We use the first 36 people for training data
trainingFaces = faces(:,1:sum(nfaces(1:36)));
avgFace = mean(trainingFaces,2);  % size n*m by 1;

% Compute eigenfaces on mean-subtracted training data
X = trainingFaces-avgFace*ones(1,size(trainingFaces,2));
[U,S,V] = svd(X,'econ');

%%
norm(X - U * S * V')

% Some background on SVD
% U is now every single face just like X, but simplified,
% They are our eigenfaces, able to be added on
% Every column in X, every input face, is a linear comb of these


%% plot
figure(1), axes('position',[0  0  1  1]), axis off
imagesc(reshape(avgFace,n,m)) % Plot avg face
title("avg face"), colormap gray;;

figure(2), axes('position',[0  0  1  1]), axis off
title("first eigenface"), colormap gray;;
imagesc(reshape(U(:,1),n,m))  % Plot first eigenface

%% Get r values
semilogy(diag(S)), grid off
xlabel('r')
ylabel('Singular value, \sigma_r')


%% Plot all calculated eigenfaces
EigenFaces = zeros(n*8, m*8);
count = 1;
for i = 1:8
    for j = 1:8
        EigenFaces(1+(i-1)*n : i*n , 1+(j-1)*m : j*m) ...
            = reshape(U(:,count), n, m);
        count = count + 1;
    end
end
figure(1), axes('position',[0  0  1  1]), axis off
imagesc(EigenFaces), colormap gray;


%% Now show eigenface reconstruction of image that was omitted from test set

testFace = faces(:,1+sum(nfaces(1:36))); % First face of person 37
imagesc(reshape(testFace,n,m))

testFaceMS = testFace - avgFace;
count = 1;
for r=[25 50 100 200 400 800 1600] 
    reconFace = avgFace + (U(:,1:r)*(U(:,1:r)'*testFaceMS));
    imagesc(reshape(reconFace,n,m))
    figure(count), axes('position',[0  0  1  1]), axis off
    title(['r=',num2str(r, "%d")])
    count = count + 1;
end

%% now try mine!
BasicFace = imread('yamm - Copy.jpg');
BasicFace = imresize(BasicFace, [n, m]);
testFace=reshape(double( im2gray(BasicFace) ) , n*m, 1) ;

% testFace = faces(:,1+sum(nfaces(1:36))); % First face of person 37
imagesc(reshape(testFace,n,m))

testFaceMS = testFace - avgFace;
count = 1;
% for r=[25 50 100 200 400 800 1600] 
    r = 2282;
    reconFace = avgFace + (U(:,1:r)*(U(:,1:r)'*testFaceMS));
    imagesc(reshape(reconFace,n,m))
    figure(count), axes('position',[0  0  1  1]), axis off, colormap gray
    title(['r=',num2str(r, "%d")])
    count = count + 1;
% end

%% Project person 2 and 7 onto PC5 and PC6

P1num = 2;  % Person number 2
P2num = 7;  % Person number 7

P1 = faces(:,1+sum(nfaces(1:P1num-1)):sum(nfaces(1:P1num)));
P2 = faces(:,1+sum(nfaces(1:P2num-1)):sum(nfaces(1:P2num)));

P1 = P1 - avgFace*ones(1,size(P1,2));
P2 = P2 - avgFace*ones(1,size(P2,2));

PCAmodes = [5 6];    % Project onto PCA modes 5 and 6
PCACoordsP1 = U(:,PCAmodes)'*P1;
PCACoordsP2 = U(:,PCAmodes)'*P2;

plot(PCACoordsP1(1,:),PCACoordsP1(2,:),'kd', 'MarkerFaceColor', 'k')
hold on
plot(PCACoordsP2(1,:),PCACoordsP2(2,:),'r^', 'MarkerFaceColor', 'r')
legend('person 2', 'person 7')