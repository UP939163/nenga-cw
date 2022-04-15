function iris_classification()
    data = load('data.txt');
    sepalLength = normalise(data(:,1), 4.3, 7.9);
    sepalWidth = normalise(data(:,2), 2.0, 4.4);
    petalLength = normalise(data(:,3), 1.0, 6.9);
    petalWidth = normalise(data(:,4), 0.1, 2.5);
end

function [normalised] = normalise(data, min, max)
    normalised = (data-min) ./ (max-min);
end
