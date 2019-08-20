% Reference: <Explorations in Numerical Analysis>
% Example 8.2.3 We seek a solution of the equation f(x) = 0, where
% f(x) = x2 - x - 1: Because f(1) = ?1 and f(2) = 1, and f is continuous,
% Page 160

% Author: MarkLHF(email:2751867750@qq.com)
% Date: 2019-8-20

% bisection method
f = @(x)(x^2-x-1);
N = 100;
precision = 1e-5;

input_min = 1;
input_max = 2;
output_loc = -1;
for n = 1:N
    input_mid = (input_min + input_max)/2;

    disp(sprintf('[%d]: a = %f, b = %f, m = %f, f(m) = %f', n, input_min, input_max, input_mid, f(input_mid)));

    if abs(f(input_mid)) < eps 
        output_loc = input_mid;
        break;
    elseif abs(f(input_max) - f(input_min)) < precision
        output_loc = input_mid;
        break;
    end
    
    if f(input_min)*f(input_mid) < 0
        input_max = input_mid;
    else
        input_min = input_mid;
    end
    
end

