x = -10:0.1:10;
y = zeros(1, 201);
for n = 1:length(x)
    y(n) = Shubert1_fun(x(n));
end

figure, plot(x,y)
