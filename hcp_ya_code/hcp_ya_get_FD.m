function hcp_ya_get_FD
load('hcp_1200_id.mat');
ID=hcp_1200_id;
for i=1
    ind=[90
        91
        189
        230
        281
        322
        326
        384
        437
        553
        584
        789
        859
        880];
end
ID(ind,:)=[]; %994
root1="/HeLabData3_master/shuguo/hcpya/motion/"; %output file path
for ren=1:length(ID)
    
    subj_fn = num2str(ID(ren));
    
    pattern='_REST1_LR.mat';
    cal_fd(root1,subj_fn,pattern)
    
    pattern='_REST1_RL.mat';
    cal_fd(root1,subj_fn,pattern)
    
    pattern='_REST2_LR.mat';
    cal_fd(root1,subj_fn,pattern)
    
    pattern='_REST2_RL.mat';
    cal_fd(root1,subj_fn,pattern)
    
end
end

function fd=cal_fd(path,sub_id,pattern)
filename=strcat(path,sub_id,pattern);
load(filename)
fd=FD_conversion_HCP1(Movement_Regressors);
filename1=strcat(path,'FD_',sub_id,pattern);
save(filename1, 'fd')
end