function hcp_ya_get_tc
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
root1="/HeLabData3_master/shuguo/hcpya/TC/"; %output file path
fid = fopen([root2 'wb.txt'],'wt');
for ren=1:length(ID)
    name1=[root num2str(ID(ren,:)) '_1LR.dtseries.nii'];
    temp=['wb_command -cifti-parcellate ' name1 ' Q1-Q6_RelatedValidation210.CorticalAreas_dil_Final_Final_Areas_Group_Colors.32k_fs_LR.dlabel.nii COLUMN ' [root1 num2str(ID(ren,:)) '_LR1.ptseries.nii' ]];
    fprintf(fid,'%s\n',temp);
    name1=[root num2str(ID(ren,:)) '_1RL.dtseries.nii'];
    temp=['wb_command -cifti-parcellate ' name1 ' Q1-Q6_RelatedValidation210.CorticalAreas_dil_Final_Final_Areas_Group_Colors.32k_fs_LR.dlabel.nii COLUMN ' [root1 num2str(ID(ren,:)) '_RL1.ptseries.nii' ]];
    fprintf(fid,'%s\n',temp);
    name1=[root num2str(ID(ren,:)) '_2LR.dtseries.nii'];
    temp=['wb_command -cifti-parcellate ' name1 ' Q1-Q6_RelatedValidation210.CorticalAreas_dil_Final_Final_Areas_Group_Colors.32k_fs_LR.dlabel.nii COLUMN ' [root1 num2str(ID(ren,:)) '_LR2.ptseries.nii' ]];
    fprintf(fid,'%s\n',temp);
    name1=[root num2str(ID(ren,:)) '_2RL.dtseries.nii'];
    temp=['wb_command -cifti-parcellate ' name1 ' Q1-Q6_RelatedValidation210.CorticalAreas_dil_Final_Final_Areas_Group_Colors.32k_fs_LR.dlabel.nii COLUMN ' [root1 num2str(ID(ren,:)) '_RL2.ptseries.nii' ]];
    fprintf(fid,'%s\n',temp);
end

end