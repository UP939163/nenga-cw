function iris_classification()
    data = load('data.txt');
    data(:,1) = normalise(data(:,1), 4.3, 7.9);
    data(:,2) = normalise(data(:,2), 2.0, 4.4);
    data(:,3) = normalise(data(:,3), 1.0, 6.9);
    data(:,4) = normalise(data(:,4), 0.1, 2.5)
end

function [normalised] = normalise(data, min, max)
    normalised = (((data-min) ./ (max-min)) * 2) - 1;
end