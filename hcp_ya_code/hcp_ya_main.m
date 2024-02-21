clear 
clc

%% convert dtseries to ptseries by wb_command
hcp_ya_get_tc; % output wb_command script

%% get FD of each subject
hcp_ya_get_movement; % transfer Movement_Regressors.txt to user file
hcp_ya_get_FD; % calculate FD(frame distance) from Movement_Regressors.txt

%% get brain network
fd_th=0.2; % threshold of FD
for ii=1:994
    hcp_ya_links_FD(ii,fd_th)
end

%% calculate Gap within day
% strr could be "_LR1_","_LR2_","_RL1_" or "_RL2_"
strr="_LR1_";
for ii=1:994
    hcp_ya_persistence_gap(ii,strr)
end

%% calculate Gap diff.day
% strr could be "LR" or "RL"
strr="LR";
for ii=1:994
    hcp_ya_persistence_diff(ii,strr)
end

%% calculate persistence between different subjects
hcp_ya_persistence_subs;

%% calculate persistence between random networks
hcp_ya_persistence_rand;

%% calculate persistence for different networks
% strr could be "_LR1_","_LR2_","_RL1_" or "_RL2_"
strr="_LR1_";
for ii=1:994
    hcp_ya_downsample_persistence(ii,strr)
end