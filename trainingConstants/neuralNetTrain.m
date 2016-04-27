function [net,percentErrors] = neuralNetTrain (X,Y)
% Solve a Pattern Recognition Problem with a Neural Network
% Script generated by Neural Pattern Recognition app
% Created 11-Mar-2016 16:43:43
%
% This script assumes these variables are defined:
%
%   X - input data.
%   Y - target data.
%
% This file is part of SuperSeggerOpti.


% target data needs to be converted to two rows for each class, with 1 when
% that class happens.
t = [(Y == 0),Y]';
x = X';


% Choose a Training Function
% For a list of all training functions type: help nntrain
% 'trainlm' is usually fastest.
% 'trainbr' takes longer but may be better for challenging problems.
% 'trainscg' uses less memory. Suitable in low memory situations.
trainFcn = 'trainbr';  % Scaled conjugate gradient backpropagation.

% Create a Pattern Recognition Network
hiddenLayerSize = 10;
net = patternnet(hiddenLayerSize);

% Setup Division of Data for Training, Validation, Testing
net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;

% Train the Network
[net,tr] = train(net,x,t);

% Test the Network
y = net(x);
e = gsubtract(t,y);
performance = perform(net,t,y);
tind = vec2ind(t);
yind = vec2ind(y);
percentErrors = sum(tind ~= yind)/numel(tind);
disp (['Percent Error from neural network predictions : ',num2str(percentErrors)]);

end

