% Solve a Pattern Recognition Problem with a Neural Network
% Script generated by Neural Pattern Recognition app
% Created 20-Apr-2022 11:26:55
%
% This script assumes these variables are defined:
%   input - input data.
%   target - target data.

input= load('input.csv');
target = load('target.csv');

x = input';
t = target';

% Choose a Training Function
% For a list of all training functions type: help nntrain
% 'trainlm' is usually fastest.
% 'trainbr' takes longer but may be better for challenging problems.
% 'trainscg' uses less memory. Suitable in low memory situations.
trainFcn = 'trainscg';  % Scaled conjugate gradient backpropagation.
% OR traincgp

% Performance / Loss function
performFcn = 'crossentropy';

% Create a Pattern Recognition Network
hiddenLayerSize = 4;
net = patternnet(hiddenLayerSize, trainFcn, performFcn);

net.layers{1}.transferFcn = 'tansig';
net.layers{2}.transferFcn = 'softmax';

% Setup Division of Data for Training, Validation, Testing
net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;

% Train the Network
[net,tr] = train(net,x,t);

% Test the Network
y = net(x);
e = gsubtract(t,y);
performance = perform(net,t,y)
tind = vec2ind(t);
yind = vec2ind(y);
percentErrors = sum(tind ~= yind)/numel(tind);

% View the Network
view(net)

% Plots
% Uncomment these lines to enable various plots.
%figure, plotperform(tr)
%figure, plottrainstate(tr)
%figure, ploterrhist(e)
%figure, plotconfusion(t,y)
%figure, plotroc(t,y)
