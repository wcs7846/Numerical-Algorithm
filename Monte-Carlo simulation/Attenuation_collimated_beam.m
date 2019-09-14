% Reference: <Monte-Carlo modeling used to simulate propagation of photons in a medium>
% ¡ª¡ª Nils Haentjens - Ocean Optics Class 2017
% Exercise 2: Attenuation of a collimated beam 

%% Target
% Assume photon can be :
% 1. absorbed (c = a = 1m-1; a is probability of absorption)
% 2. transmitted
% 3. Not scattered
% 4. no boundaries(no refraction)
% 5. delta_z = 20 cm(absorption only occur at the end of step)

% Author: MarkLHF(email:2751867750@qq.com)
% Date: 2019-9-12
%% Programming Main Body
delta_z = 0.2; % [m]
a = 1;        % [m-1]
N = 10000;    % the number of points
flag_photon = ones(N,1);
max_step = 100;
num_photon_vec = zeros(max_step, 1);

prob = a*delta_z; % the probability of absorption
% check the validity of prob
if prob > 1
    error("[ERROR]:The probability of absorption is over 1!!");
end

for n = 1:max_step
    % record the number of photon which isnot absorbed
    num_photon_vec(n) = sum(flag_photon);
    
    if num_photon_vec(n) == 0
        break;
    end    
    % move the photon (the event of absorption)
    dice = rand(length(flag_photon), 1);
    % judging whether or not to be absorbed(small is absorbed)
    loc = find(dice<prob);
    flag_photon(loc) = 0;
    
end
%% show the result 
figure;
x_range = (0:max_step-1)*delta_z;% [m]
bar(x_range, num_photon_vec);hold on; % the distribution of photon
plot(x_range, num_photon_vec, 'b-');hold on; % the curve
xlim([0,max_step*delta_z]); ylim([0,N]);
xlabel('Depth(m)');ylabel('The number of photon');