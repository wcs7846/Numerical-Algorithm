% Reference: <Monte-Carlo modeling used to simulate propagation of photons in a medium>
% ¡ª¡ª Nils Haentjens - Ocean Optics Class 2017
% Exercise 3: Improved algorithm

%% Target
% Assume photon can be :(the improved version of Exercise 2)
% 1. absorbed (c = a = 1m-1; a is probability of absorption)
% 2. Not scattered
% 3. no boundaries(no refraction)
% 4. remove assumption of fixed step(free path length)

% Author: MarkLHF(email:2751867750@qq.com)
% Date: 2019-9-14
%% Programming Main Body
delta_z = 0.2; % [m]
a = 1;        % [m-1]
N = 1e6;    % the number of points
max_step = 100;

loc_photon = zeros(N, 1); % 1D

disp(sprintf('[BEGIN]:simulate photo, the total photon is %d;', N));
for n = 1:N % calculate every photon
    % set inital location 
    loc = 0; % 1 dim
    
    % start simulate the movement process
    for s = 1:max_step % assume max_step is enough deep
        % calculate the each step
        path_len = -log(rand(1))/a; % log(x) == ln(x)
        loc = loc + path_len;
        
        prob = a*path_len; % calculate the probability of absorption
        
        % move the photon (the event of absorption)
        dice = rand(1);
        if dice < prob % absorbtion
            loc_photon(n,:) = loc; % record
            break;
        end
        
        % no scatteration
        
    end
    disp(sprintf('[RUN]:No.%d/%d photon is finished;', n, N));
end
% calculate the distribution of photon(statistics)
disp(sprintf('[BEGIN]:make the statistics of photon location distribution;'));
% the spacing of grid points is delta_z
tmp_loc = loc_photon;
num_photon_vec = zeros(max_step, 1);
ruler_vec = (1:(max_step))*delta_z;

for n = 1:max_step
    % count
    loc = find(tmp_loc < ruler_vec(n));
    num_photon_vec(n) = length(loc);
    
    % clear 
    tmp_loc(loc) = [];
end
% show 
figure;
x_range = (0:max_step-1)*delta_z;% [m]
bar(x_range, num_photon_vec);hold on; % the distribution of photon
plot(x_range, num_photon_vec, 'b-');hold on; % the curve
xlim([0,max_step*delta_z]); ylim([0,1.25*max(num_photon_vec)]);
xlabel('Depth(m)');ylabel('The number of photon');