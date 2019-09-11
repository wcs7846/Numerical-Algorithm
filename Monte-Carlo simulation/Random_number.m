% Reference: <Monte-Carlo modeling used to simulate propagation of photons in a medium>
% ¡ª¡ª Nils Haentjens - Ocean Optics Class 2017
% Exercise 1: Random Number Generator

%% Target
% Generate 10,000 random number X in [0,1]
% Check that  the X are uniformly distributed
% How sensitive is the random number generator to change in seeds

% Author: MarkLHF(email:2751867750@qq.com)
% Date: 2019-8-20
%% Programming Main Body
% 1. generate the 10,000 number
N = 10000;
a = 0; % low-bound  == 0
b = 1; % high-bound == 0

x = (rand(N, 1) - a)/(b-a+eps);
% check the uniformly distributed
var_val  = var(x);
mean_val = mean(x);

num_bins = 20;
counts = hist(x, num_bins);
% show 
figure;bar(counts);hold on;
xlim([0, num_bins+1]);