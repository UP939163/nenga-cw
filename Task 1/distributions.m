function [] = distributions(data)
    data = load('data.txt');
    tiledlayout(2,2)
    nexttile
    histogram(data(:,1));
    xlabel('Sepal Length (cm)')
    ylabel('Count')
    title('Sepal Length Distribution')
    nexttile
    histogram(data(:,2));
    xlabel('Sepal Width (cm)')
    ylabel('Count')
    title('Sepal Width Distribution')
    nexttile
    histogram(data(:,3));
    xlabel('Petal Length (cm)')
    ylabel('Count')
    title('Petal Length Distribution')
    nexttile
    histogram(data(:,4));
    xlabel('Petal Width (cm)')
    ylabel('Count')
    title('Petal Width Distribution')
end