function hcp_ya_get_movement
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
root="/HeLabData3_master/HCP-ya/fMRI_sMRI_processed/fmriresults01/"; %input file path; where dtseries.nii put
root2="/HeLabData3_master/shuguo/hcpya/motion/"; %output file path

for ren=1:length(ID)
    subj_fn = num2str(ID(ren));
    
    pattern='_REST1_LR.mat';
    save_movement(root,root2,subj_fn,pattern)
    
    pattern='_REST1_RL.mat';
    save_movement(root,root2,subj_fn,pattern)
    
    pattern='_REST2_LR.mat';
    save_movement(root,root2,subj_fn,pattern)
    
    pattern='_REST2_RL.mat';
    save_movement(root,root2,subj_fn,pattern)
    
end
end
function save_movement(path_in,path_out,sub_id,pattern)
name=strcat(path_in,sub_id,"/MNINonLinear/Results/rfMRI_",pattern,"/Movement_Regressors.txt");
load(name)
filename=strcat(path_out,sub_id,pattern);
save(filename, 'Movement_Regressors')
end