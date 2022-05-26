function nn()
    % Load and Pre-Process Data
    data = load('data.txt');
    data = preProcess(data);
    [input, target] = getInputOutput(data);
    x = input';
    t = target';

    % Choose Training Function
    trainFcn = 'trainscg';

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

    % Randomise Weights
    net = configure(net,x,t);
    net = setwb(net, rand(35,1));

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
end

% Randomise and normalise data
function [data] = preProcess(data)
    % Randomise dataset order
    data = data(randperm(size(data, 1)), :);
    % Normalise inputs
    data(:,1) = normalise(data(:,1), 5.84, 0.83);
    data(:,2) = normalise(data(:,2), 3.05, 0.83);
    data(:,3) = normalise(data(:,3), 3.76, 0.83);
    data(:,4) = normalise(data(:,4), 1.2, 0.83);
end

function [normalised] = normalise(data, mean, std)
    zScore = (data - mean) ./ std;
    minZ = min(zScore);
    maxZ = max(zScore);
    normalised = ((zScore - minZ) / (maxZ - minZ) * 2) - 1;
end

function [input, output] = getInputOutput(data)
    % First 4 values are input
    input = data(:,1:4);
    % Fifth value is classification
    % Initialise empty matrix
    output = zeros(size(data, 1), 3);
    for r = 1:size(output, 1)
        output(r, data(r, 5)) = 1;
    end
    disp(data(1:5, :));
    disp(output(1:5, :));
end
