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
% Date: 2019-9-11
%% Programming Main Body
delta_z = 0.2; % [m]
a = 1;        % [m-1]
N = 10000;    % the number of points
num_photon_vec = zeors(N, 1);

for n = 1:N
    % move the photon
    
    % judging whether or not to be absorbed 
    dice = rand(1);
    
end


