function hcpd_get_movement
root="/HeLabData3_master/HCP-D/fMRI_sMRI_processed/fmriresults01/"; % where dtseries.nii put 
root2="/HeLabData3_master/shuguo/hcpd/motion/"; %output path
group_files = dir(root); % subjects ID list
for i=1
    ti=[4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        6
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        2
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        3
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        2
        4
        4
        6
        4
        4
        4
        4
        4
        4
        4
        4
        6
        4
        6
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        6
        4
        4
        4
        4
        4
        6
        4
        4
        4
        4
        4
        4
        4
        4
        4
        6
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        3
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        3
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        6
        4
        4
        6
        4
        4
        2
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        6
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        6
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        2
        4
        2
        4
        4
        4
        4
        4
        4
        6
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        6
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        6
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        6
        4
        4
        6
        4
        4
        4
        6
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        2
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        4
        2
        4
        4
        4
        4
        4
        ];
end
for ren=3:654
    flag=ti(ren-2);
    ren
    if flag==4 % only include subjects with 4 session
        subj_fn = group_files(ren).name;
        
        pattern='_R1_AP.mat';
        save_movement(root,root2,subj_fn,pattern)
        
        pattern='_R1_PA.mat';
        save_movement(root,root2,subj_fn,pattern)
        
        pattern='_R2_AP.mat';
        save_movement(root,root2,subj_fn,pattern)
        
        pattern='_R2_PA.mat';
        save_movement(root,root2,subj_fn,pattern)
    end
end
end
function save_movement(path_in,path_out,sub_id,pattern)
name=strcat(path_in,sub_id,"/MNINonLinear/Results/rfMRI_REST1_AP/Movement_Regressors.txt");
load(name)
filename=strcat(path_out,sub_id,pattern);
save(filename, 'Movement_Regressors')
end