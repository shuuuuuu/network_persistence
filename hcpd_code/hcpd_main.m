clear 
clc

%% convert dtseries to ptseries by wb_command
hcpd_get_tc; % output wb_command script

%% get FD of each subject
hcpd_get_movement; % transfer Movement_Regressors.txt to user file
hcpd_get_FD; % calculate FD(frame distance) from Movement_Regressors.txt

%% get brain network
fd_th=0.2; % threshold of FD
for ii=1:655
    hcpd_links_FD(ii,fd_th)
end

%% calculate Gap within day
% strr could be "_AP1_","_AP2_","_PA1_" or "_PA2_"
strr="_AP1_";
for ii=1:655
    hcpd_persistence_gap(ii,strr)
end

%% calculate Gap diff.day
% strr could be "AP" or "PA"
strr="AP";
for ii=1:655
    hcpd_persistence_diff(ii,strr)
end

%% calculate persistence between different subjects
hcpd_persistence_subs;

%% calculate persistence between random networks
hcpd_persistence_rand;

