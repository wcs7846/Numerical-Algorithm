% Reference: <Explorations in Numerical Analysis>
% Exercise 8.3.1 Consider the equation x + ln x = 0:
% this equation has a solution in the interval [0:5; 0:6]
% Page:161

% Author: MarkLHF(email:2751867750@qq.com)
% Date: 2019-8-20
init_v = 0.55;
N = 100;
precision = 1e-7;

res_v = zeros(1, N); % pre-allocation 
used_len = 1;

f = @(x)(-log(x));
x = init_v;
for n = 1:N
    tmp = f(x);
    res_v(n) = x;
    disp(sprintf('[%2d]: x = %f, g(x) = %f', n, x, tmp));
    
    if abs(tmp - x) < precision
        res = x;
        break;
    else
        x = tmp;
    end
    
    used_len = n; % record the used storage
end   
% show the result - draw the figure;
sample_N = 1000;
x_sample = 0.5:(0.1)/(sample_N-1):0.6;

g = x_sample + log(x_sample); % function is g(x) = x + ln(x);
% draw
figure;plot(x_sample, g, 'b.-');hold on;
plot(x_sample, zeros(1, sample_N), 'k-');hold on; % the basic line

figure;plot()