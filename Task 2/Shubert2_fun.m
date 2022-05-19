% Shubert2 function  
% Assume each xi, i=1,...,n is in [-10, +10] interval.
% Calculates Shubert2 for the actual argument x

function y = Shubert2_fun(x)
n = length(x);
p = 1.0;
for i = 1: n
    s = 0.0;
    for j = 1:5   
        s = s+j.*cos((j+1).*x(i)+j);
    end
    p = p.*s;
end 
y = p + (0.5 * ((x(1) + 1.42513).^2 + (x(2) + 0.80032).^2));
