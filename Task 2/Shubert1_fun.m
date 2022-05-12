% Shubert1 function  
% Assume each xi, i=1,...,n is in [-10, +10] interval.
% Calculates Shubert1 for the actual argument x
% e.g., for x=[-7.0835,	4.8580]--> Shubert1_fun(x)= -186.7309

function y = Shubert1_fun(x)
n = length(x);
p = 1.0;
for i = 1: n
    s = 0.0;
    for j = 1:5   
        s = s+j.*cos((j+1).*x(i)+j);
    end
    p = p.*s;
end 
y = p;
