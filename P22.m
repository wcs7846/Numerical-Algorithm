%% 《数值分析》 P22 二分法求解
% Example 2.1
function P22()
sigma = 1/(2^5);
a = 0; b = 1;
% initial
y1 = func(a); y2 = func(b);
x0 = (a+b)/2; y0 = func(x0);
% body
while abs(y0) > sigma
    if y0*y1 < 0
        b = x0; y2 = y0;
    else
        a = x0; y1 = y0;
    end
    y1 = func(a); y2 = func(b);
    x0 = (a+b)/2; y0 = func(x0);    
end
disp(sprintf('The root is %f\n', x0));

end

function y = func(x)
% y = e^(-x) - sin(pi*x/2)
y = exp(-x) - sin(pi*x/2);
end