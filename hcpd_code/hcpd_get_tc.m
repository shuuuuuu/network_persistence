function hcpd_get_tc
root="/HeLabData3_master/HCP-D/fMRI_sMRI_processed/fmriresults01/"; %input file path; where dtseries.nii put
root1="/HeLabData3_master/shuguo/hcpd/TC/"; %output file path
group_files = dir(root); % subjects ID list
fid = fopen(strcat(root1,'wb.txt'),'wt'); % output "wb_command" to txt file
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
    if flag==4 % only include subjects with 4 sessions
        subj_fn = group_files(ren).name;
        
        name=strcat(root,subj_fn,"/MNINonLinear/Results/rfMRI_REST1_AP/rfMRI_REST1_AP_Atlas_MSMAll_hp0_clean.dtseries.nii");
        temp=strcat("wb_command -cifti-parcellate ", name," /HeLabData3_master/shuguo/HCP_Vadim/D/Q1-Q6_RelatedValidation210.CorticalAreas_dil_Final_Final_Areas_Group_Colors.32k_fs_LR.dlabel.nii COLUMN ",root2,subj_fn, "_AP1.ptseries.nii");
        fprintf(fid,'%s\n',temp);
        
        name=strcat(root,subj_fn,"/MNINonLinear/Results/rfMRI_REST1_PA/rfMRI_REST1_PA_Atlas_MSMAll_hp0_clean.dtseries.nii");
        temp=strcat("wb_command -cifti-parcellate ", name," /HeLabData3_master/shuguo/HCP_Vadim/D/Q1-Q6_RelatedValidation210.CorticalAreas_dil_Final_Final_Areas_Group_Colors.32k_fs_LR.dlabel.nii COLUMN ",root2,subj_fn, "_PA1.ptseries.nii");
        fprintf(fid,'%s\n',temp);
        
        name=strcat(root,subj_fn,"/MNINonLinear/Results/rfMRI_REST2_AP/rfMRI_REST2_AP_Atlas_MSMAll_hp0_clean.dtseries.nii");
        temp=strcat("wb_command -cifti-parcellate ", name," /HeLabData3_master/shuguo/HCP_Vadim/D/Q1-Q6_RelatedValidation210.CorticalAreas_dil_Final_Final_Areas_Group_Colors.32k_fs_LR.dlabel.nii COLUMN ",root2,subj_fn, "_AP2.ptseries.nii");
        fprintf(fid,'%s\n',temp);
        
        name=strcat(root,subj_fn,"/MNINonLinear/Results/rfMRI_REST2_PA/rfMRI_REST2_PA_Atlas_MSMAll_hp0_clean.dtseries.nii");
        temp=strcat("wb_command -cifti-parcellate ", name," /HeLabData3_master/shuguo/HCP_Vadim/D/Q1-Q6_RelatedValidation210.CorticalAreas_dil_Final_Final_Areas_Group_Colors.32k_fs_LR.dlabel.nii COLUMN ",root2,subj_fn, "_PA2.ptseries.nii");
        fprintf(fid,'%s\n',temp);
    end
end

end