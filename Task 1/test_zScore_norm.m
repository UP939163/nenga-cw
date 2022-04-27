function test()
    % Load dataset in
    data = load('data.txt');
    data = prepData(data);
    [input, output] = getInputOutput(data);
    writematrix(input, 'input.csv');
    writematrix(output, 'target.csv');
end

function [normalised] = normalise(data, mean, std)
    zScore = (data - mean) ./ std;
    minZ = min(zScore);
    maxZ = max(zScore);
    normalised = ((zScore - minZ) / (maxZ - minZ) * 2) - 1;
end

% Randomise and normalise data
function [data] = prepData(data)
    % Randomise dataset order
    data = data(randperm(size(data, 1)), :);
    % Normalise inputs
    data(:,1) = normalise(data(:,1), 5.84, 0.83);
    data(:,2) = normalise(data(:,2), 3.05, 0.83);
    data(:,3) = normalise(data(:,3), 3.76, 0.83);
    data(:,4) = normalise(data(:,4), 1.2, 0.83)
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
