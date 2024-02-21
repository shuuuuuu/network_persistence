function hcp_ya_persistence_rand
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% claculate time persistence between random networks
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
strr=["LR","RL"];

R_all=[];
jac_all=[];
ci=1;
while ci<=994
    ii=randperm(nn,2); % random choose 2 subjects
    
    ren1=group_files(ii(1)+2).name;
    ren2=group_files(ii(2)+2).name;
    strrr=strr(randperm(2,1)); % random choose 1 pattern
    day1=randperm(2,1); % random choose 1 day
    day2=randperm(2,1);
    j1=randperm(k,1); % random choose 1 time window
    j2=randperm(k,1);
    
    mapname=strcat(root1,"FD_map_",ren1,"_",strrr,num2str(day1),"_",num2str(j1),".mat");
    load(mapname)
    mapc1=mapc;
    mapw1=mapw>wth; % link with W smaller than W threshold will be removed
    mapc1=mapw1.*mapc1;
    mapname=strcat(root1,"FD_map_",ren2,"_",strrr,num2str(day2),"_",num2str(j2),".mat");
    load(mapname)
    mapc2=mapc;
    mapw2=mapw>wth; % link with W smaller than W threshold will be removed
    mapc2=mapw2.*mapc2;
    
    tmapw1=mapw1;
    tmapw2=mapw2;
    tmapc1=tmapw1.*mapc1;
    tmapc2=tmapw2.*mapc2;
    ind=find(tril(ones(N),-1));
    
    temp=tmapc1(ind);
    A=randperm(length(temp)); % shuffle links
    temp=temp(A);
    tmapc1=zeros(N,N);
    tmapc1(ind)=temp;
    tmapc1=tmapc1+tmapc1';
    
    temp=tmapw1(ind);
    A=randperm(length(temp)); % shuffle links
    temp=temp(A);
    tmapw1=zeros(N,N);
    tmapw1(ind)=temp;
    tmapw1=tmapw1+tmapw1';
    
    
    d1=sum(tmapc1,2); % weighted degree vector of each nodes
    d2=sum(tmapc2,2);
    jj1=reshape(tmapw1,N*N,1)'; % links vector of each network, 1-link exist, 0-link not exist
    jj2=reshape(tmapw2,N*N,1)';
    
    R=corr(d1,d2); % correlation between weighted degree vectors, N.Persistence
    D=pdist([jj1;jj2],'jaccard');
    coefficient=1-D; % jaccard coefficient between links vectors, L.Persistence
    
    if (~isnan(R))&&(coefficient~=0)
        R_all=[R_all; R];
        jac_all=[jac_all; coefficient];
        ci=ci+1;
    end
end
name=strcat(root3,"FD_randnet_",num2str(w),".mat");
save(name,'R_all','jac_all')
end