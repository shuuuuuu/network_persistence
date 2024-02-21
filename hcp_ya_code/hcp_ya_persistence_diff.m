function hcp_ya_persistence_diff(ii,strr) %"LR"
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% claculate time persistence between different days
% input -
%           ii: the id of subjects
%         strr: the pattern of data, "LR" or "RL"
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

name=group_files(ii).name; % subject ID

wth=3.5; % the threshold of W
%%

R_all=[];
jac_all=[];

mapc_allA=zeros(N,N,k);
count=1;
for j=1:k
    mapname=strcat(root1,"FD_map_",name,"_",strr,"1_",num2str(j),".mat");
    load(mapname)
    mapc_allA(:,:,count)=mapc; % matrix of link weight
    mapw_allA(:,:,count)=mapw; % matrix of W
    count=count+1;
end % load brain networks on day-1

mapc_allB=zeros(N,N,k);
count=1;
for j=1:k
    mapname=strcat(root1,"FD_map_",name,"_",strr,"2_",num2str(j),".mat");
    load(mapname)
    mapc_allB(:,:,count)=mapc; % matrix of link weight
    mapw_allB(:,:,count)=mapw; % matrix of W
    count=count+1;
end % load brain networks on day-2

for ci=1:k % choose one network on day-1 to compare to networks on day-2
    ii
    ci
    mapcA=mapc_allA.*(mapw_allA>wth); % link with W smaller than W threshold will be removed
    mapc1=mapcA(:,:,ci);
    mapc2=mapc_allB.*(mapw_allB>wth);
    mapc=cat(3,mapc1,mapc2);
    
    mapwA=mapw_allA>wth; % link with W smaller than W threshold will be removed
    mapw1=mapwA(:,:,ci);
    mapw2=mapw_allB>wth;
    mapw=cat(3,mapw1,mapw2);
    
    dd=sum(mapc,2); % weighted degree vector of each nodes
    dd=reshape(dd,N,k+1);
    jj=reshape(mapw,N*N,k+1)'; % links vector of each network, 1-link exist, 0-link not exist
    R=corr(dd,dd); % correlation between weighted degree vectors, N.Persistence
    D=pdist(double(jj),'jaccard');
    coefficient=1-D; % jaccard coefficient between links vectors, L.Persistence
    AA=ones(k+1,k+1);
    ind=find(tril(AA,-1));
    AA(ind)=coefficient;
    coefficient=AA';
    
    R_all=[R_all; R(1,2:end)']; % N.Persistence between different days
    jac_all=[jac_all; coefficient(1,2:end)']; % L.Persistence between different days
end

name1=strcat(root3,"FD_diff_",name,"_",strr,"_",num2str(wth),".mat");
save(name1,'R_all','jac_all')
end