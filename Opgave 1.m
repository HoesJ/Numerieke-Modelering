%% Benader dataset
M = 31;
N = 31;

% Vectoren maken
x = linspace(-1,1,M);
y = linspace(-1,1,N);
[X,Y] = meshgrid(x,y);

% F = sin((X.*2-1).^2+Y.*2);
F=membrane(1,15);

% approximate
C = kkb(x,y,F,7,7);
approx = polyval2(C,x,y);

% % plot
surf(X,Y,approx);
hold on
scatter3(X(:),Y(:),F(:));
holf off
% surf(X,Y,F);
%% Plot kostenfunctie

maxDegree = 20;
cost = zeros(1, maxDegree);
for deg=1:maxDegree
    C = kkb(x,y,F,deg,deg);
    approx = polyval2(C,x,y);
    cost(deg) = sum(sum((F-approx).^2));
end
figure
semilogy(1:maxDegree, cost);
%% Etna
F = double(imread('etna.jpg'));
size = size(F);
M = size(2);
N = size(1);

% Vectoren maken
x = linspace(-1,1,M);
y = linspace(-1,1,N);
[X,Y] = meshgrid(x,y);

% approximate
% deg = 10;
% C = kkb(x,y,F,deg,deg);
% approx = polyval2(C,x,y);

% plot
surf(X,Y,F,'EdgeColor','none','LineStyle','none','FaceLighting','phong')
xlim([-1,1]); ylim([-1,1]); zlim([0, 250]);
title('Etna')