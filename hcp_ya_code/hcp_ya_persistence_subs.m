function hcp_ya_persistence_subs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% claculate time persistence between different subjects
%
% output -
%           L.Persistence and N.Persistence will be saved in the output path

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

N=360; % the number of nodes
n=fix(1200/x/5);%the number of data in overlap; time window is 14.4/5 = 2.88 min
x1=1:n:1200-n*10+1;
x2=x1+n*10-1;% sliding time window index
k=length(x1);% the number of time windows

root1="/HeLabData3_master/shuguo/hcpya/network/288FD/"; % output path
root2="/HeLabData3_master/shuguo/hcpya/TC/*.nii"; % input path of ptseries
root3="/HeLabData3_master/shuguo/hcpya/network/288FD/near/"; % output path
group_files = dir(root2); % subjects ID list

wth=3.5; % the threshold of W
%%
strr=["AP","PA"];

R_all=[];
jac_all=[];
ci1=1;
ci2=1;
while ci1<=994
    ii=randperm(nn,2); % random choose 2 subjects
    ren1=group_files(ii(1)+2).name;
    ren2=group_files(ii(2)+2).name;
    strrr=strr(randperm(2,1)); % random choose 1 pattern
    day1=randperm(2,1);
    day2=randperm(2,1); % random choose 1 day
    j1=randperm(k,1);
    j2=randperm(k,1); % random choose 1 time window
    
    mapname=strcat(root1,"FD_map_",ren1,"_",strrr,num2str(day1),"_",num2str(j1),".mat");
    load(mapname)
    mapc1=mapc;
    mapw1=mapw>wth;
    mapc1=mapw1.*mapc1; % link with W smaller than W threshold will be removed
    mapname=strcat(root1,"FD_map_",ren2,"_",strrr,num2str(day2),"_",num2str(j2),".mat");
    load(mapname)
    mapc2=mapc;
    mapw2=mapw>wth;
    mapc2=mapw2.*mapc2;
    
    d1=sum(mapc1,2); % weighted degree vector of each nodes
    d2=sum(mapc2,2);
    jj1=reshape(mapw1,N*N,1)'; % links vector of each network, 1-link exist, 0-link not exist
    jj2=reshape(mapw2,N*N,1)';
    
    R=corr(d1,d2); % correlation between weighted degree vectors, N.Persistence
    D=pdist(double([jj1;jj2]),'jaccard');
    coefficient=1-D; % jaccard coefficient between links vectors, L.Persistence
    
    if ~isnan(R)
        R_all=[R_all; R];
        ci1=ci1+1;
    end
    
    if (coefficient~=0)&&(~isnan(coefficient))
        jac_all=[jac_all; coefficient];
        ci2=ci2+1;
    end
end
name=strcat(root3,"FD_diffperson_",num2str(w),".mat");
save(name,'R_all','jac_all')
end