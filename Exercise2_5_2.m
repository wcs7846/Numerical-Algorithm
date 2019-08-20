% Reference: <Explorations in Numerical Analysis>
% Exercise 2.5.2 Try both of these approximations with f(x) = sin x, x0 = 1, and h =
% 10?1; 10?2; 10?3, and then h = 10?14. What happens, and can you explain why?
% Page:34

% Author: MarkLHF(email:2751867750@qq.com)
% Date: 2019-8-20

x0 = 1;
h = [1e-1, 1e-2, 1e-3, 1e-14];
f = @sin;

i = 4;
% real value
real = cos(x0);
% approximation 1: (f(x0+h)-f(x0))/h;
appro_f1 = (f(x0+h(i)) - f(x0))/h(i);

% approximation 2: (f(x0+h)-f(x0-h))/2h
appro_f2 = (f(x0+h(i)) - f(x0-h(i)))/(2*h(i));

% calculate the error
error_f1 = real - appro_f1;
error_f2 = real - appro_f2;

