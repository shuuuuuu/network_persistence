function hcp_ya_persistence_gap(ii,strr)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% claculate time persistence within days
% input -
%           ii: the id of subjects
%         strr: the pattern of data, "_LR1_","_LR2_","_RL1_" or "_RL2_"
% output -
%           L.Persistence and N.Persistence will be saved in the output path

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

N=360; % the number of nodes
n=fix(1200/x/5);%the number of data in overlap; time window is 14.4/5 = 2.88 min
x1=1:n:1200-n*10+1;
x2=x1+n*10-1;% sliding time window index
k=length(x1);% the number of time windows

root1="/HeLabData3_master/shuguo/hcpya/network/288FD/"; 
root2="/HeLabData3_master/shuguo/hcpya/TC/*.nii"; % input path of ptseries
root3="/HeLabData3_master/shuguo/hcpya/network/288FD/near/"; % output path
group_files = dir(root2); % subjects ID list

name=group_files(ii).name; % subject ID
wth=3.5; % the threshold of W
%%
mapc_all=zeros(N,N,k);
mapw_all=zeros(N,N,k);
count=1;
for j=1:k
    mapname=strcat(root1,"FD_map_",name,strr,"_",num2str(j),".mat");
    load(mapname)
    mapc_all(:,:,count)=mapc; % matrix of link weight
    mapw_all(:,:,count)=mapw; % matrix of W
    count=count+1;
end % load brain networks

mapcc=mapc_all.*(mapw_all>wth); % link with W smaller than W threshold will be removed
dd=sum(mapcc,2); % weighted degree vector of each nodes
dd=reshape(dd,N,k);
jj=reshape(mapcc>0,N*N,k)'; % links vector of each network, 1-link exist, 0-link not exist
R=corr(dd,dd); % correlation between weighted degree vectors, N.Persistence
D=pdist(double(jj),'jaccard');
coefficient=1-D; % jaccard coefficient between links vectors, L.Persistence
AA=ones(k,k);
ind=find(tril(AA,-1));
AA(ind)=coefficient;
coefficient=AA';

for gap=1:k-1
    tempr=diag(R,gap); % N.Persistence for different gap
    tempj=diag(coefficient,gap); % L.Persistence for different gap
    eval(['R_gap' num2str(gap) '=tempr;'])
    eval(['jac_gap' num2str(gap) '=tempj;'])
end

name1=strcat(root3,"near_",name,strr,num2str(w),".mat");
save(name,'R_gap1','R_gap2','R_gap3','R_gap4','R_gap5','R_gap6','R_gap7','R_gap8','R_gap9','R_gap10','R_gap11','R_gap12','R_gap13','R_gap14','R_gap15','R_gap16','R_gap17','R_gap18','R_gap19','R_gap20','R_gap21','R_gap22','R_gap23','R_gap24','R_gap25','R_gap26','R_gap27','R_gap28','R_gap29','R_gap30','R_gap31','R_gap32','R_gap33','R_gap34','R_gap35','R_gap36','R_gap37','R_gap38','R_gap39','R_gap40','jac_gap1','jac_gap2','jac_gap3','jac_gap4','jac_gap5','jac_gap6','jac_gap7','jac_gap8','jac_gap9','jac_gap10','jac_gap11','jac_gap12','jac_gap13','jac_gap14','jac_gap15','jac_gap16','jac_gap17','jac_gap18','jac_gap19','jac_gap20','jac_gap21','jac_gap22','jac_gap23','jac_gap24','jac_gap25','jac_gap26','jac_gap27','jac_gap28','jac_gap29','jac_gap30','jac_gap31','jac_gap32','jac_gap33','jac_gap34','jac_gap35','jac_gap36','jac_gap37','jac_gap38','jac_gap39','jac_gap40')

end