function hcp_ya_downsample_persistence(ii,strr)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% claculate time persistence between different days
% input -
%           ii: the id of subjects
%         strr: the pattern of data, "LR" or "RL"
% output -
%           downsampled L.Persistence and N.Persistence for different
%           systems will be saved in the output path

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
load("/HeLabData3_master/shuguo/hcpya/network/withV_group7_un.mat")
group=withV_group7_un; % the index of systems
links=25; % the number of links kept in each system
%%
name=group_files(ii).name; % subject ID
for number =1:300 % repeat 300 times
    
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
    
    mapc=mapc_all;
    count=1;
    gr=[1:4 6:7]; % Limbic was exclude
    for grt1=1:6
        gr1=gr(grt1);
        for grt2=grt1:6
            gr2=gr(grt2);
            ind1=group==gr1;
            ind2=group==gr2;
            AT=find_links(ind1,ind2,mapw_all(:,:,1)>wth,links); % randomly choose 25 true links in the first tw
            if sum(sum(AT))==links*2
                mapcc=mapc.*AT.*(mapw_all>wth); % link with W smaller than W threshold will be removed
                dd=sum(mapcc,2); % weighted degree vector of each nodes
                dd=reshape(dd,N,k);
                dd(~sum(AT,2),:)=[];
                
                if isempty(dd)
                    R=nan(k,k);  % correlation between weighted degree vectors, N.Persistence
                end
                if ~isempty(dd)
                    R=corr(dd,dd);
                end
                jj=reshape(mapcc>0,N*N,k)';  % links vector of each network, 1-link exist, 0-link not exist
                D=pdist([double(jj)],'jaccard');
                coefficient=1-D;  % jaccard coefficient between links vectors, L.Persistence
                AA=ones(k,k);
                ind= find(tril(AA,-1));
                AA(ind)=coefficient;
                coefficient=AA'; 
                eval(['R' num2str(count) '=R;']);
                eval(['coefficient' num2str(count) '=coefficient;']);
                count=count+1;
            else
                eval(['R' num2str(count) '=nan(k,k);']);
                eval(['coefficient' num2str(count) '=nan(k,k);']);
                count=count+1;
            end
        end
    end
    AT=find_links(ones(N,1),ones(N,1),mapw_all(:,:,1)>wth,links);
    mapcc=mapc.*AT.*(mapw_all>wth);
    dd=sum(mapcc,2);
    dd=reshape(dd,N,k);
    jj=reshape(mapcc>0,N*N,k)';
    R22=corr(dd,dd);
    D=pdist(double(jj),'jaccard');
    coefficient=1-D;
    AA=ones(k,k);
    ind=find(tril(AA,-1));
    AA(ind)=coefficient;
    coefficient22=AA';
    
    
    for gap=1:k-1
        eval(['R_gap' num2str(gap) '=[];'])
        eval(['jac_gap' num2str(gap) '=[];'])
    end
    
    for gr=1:22
        eval(['R=R' num2str(gr) ';'])
        eval(['coefficient=coefficient' num2str(gr) ';'])
        for gap=1:k-1
            tempr=diag(R,gap);
            tempj=diag(coefficient,gap);
            eval(['R_gap' num2str(gap) '=[R_gap' num2str(gap) ';tempr];'])
            eval(['jac_gap' num2str(gap) '=[jac_gap' num2str(gap) ';tempj];'])
        end
    end
    for gap=1:k-1
        eval(['tempr=R_gap' num2str(gap) ';'])
        eval(['tempj=jac_gap' num2str(gap) ';'])
        tempr=reshape(tempr,[],22);
        tempj=reshape(tempj,[],22);
        eval(['R_gap' num2str(gap) '=tempr;'])
        eval(['jac_gap' num2str(gap) '=tempj;'])
    end
    
    name=strcat(root2,"near_",num2str(links), "_", ID(ii,:),"_",num2str(kk),"_",num2str(w),"_",num2str(number),".mat");
    save(name,'R_gap1','R_gap2','R_gap3','R_gap4','R_gap5','R_gap6','R_gap7','R_gap8','R_gap9','R_gap10','R_gap11','R_gap12','R_gap13','R_gap14','R_gap15','R_gap16','R_gap17','R_gap18','R_gap19','R_gap20','R_gap21','R_gap22','R_gap23','R_gap24','R_gap25','R_gap26','R_gap27','R_gap28','R_gap29','R_gap30','R_gap31','R_gap32','R_gap33','R_gap34','R_gap35','R_gap36','R_gap37','R_gap38','R_gap39','R_gap40','jac_gap1','jac_gap2','jac_gap3','jac_gap4','jac_gap5','jac_gap6','jac_gap7','jac_gap8','jac_gap9','jac_gap10','jac_gap11','jac_gap12','jac_gap13','jac_gap14','jac_gap15','jac_gap16','jac_gap17','jac_gap18','jac_gap19','jac_gap20','jac_gap21','jac_gap22','jac_gap23','jac_gap24','jac_gap25','jac_gap26','jac_gap27','jac_gap28','jac_gap29','jac_gap30','jac_gap31','jac_gap32','jac_gap33','jac_gap34','jac_gap35','jac_gap36','jac_gap37','jac_gap38','jac_gap39','jac_gap40')
    
    
end
end


function new = find_links(ind1,ind2,map,links)
a=sum(ind1);
b=sum(ind2);
if a==b
    ind=find(ind1);
    ind=ind(randperm(length(ind),34));
    indd=zeros(360,1);
    indd(ind)=1;
    AT=indd.*indd';
    AT=AT+AT';
    AT(logical(eye(size(AT))))=0;
    AT=AT>0;
else
    m=round(a/(a+b)*34);
    n=round(b/(a+b)*34);
    ind=find(ind1);
    ind=ind(randperm(length(ind),m));
    indd1=zeros(360,1);
    indd1(ind)=1;
    
    ind=find(ind2);
    ind=ind(randperm(length(ind),n));
    indd2=zeros(360,1);
    indd2(ind)=1;
    
    AT=indd1.*indd2';
    AT=AT+AT';
    AT(logical(eye(size(AT))))=0;
    AT=AT>0;
end
link=find(triu(map.*AT));
if length(link)>links
    link=link(randperm(length(link)));
    link=link(1:links);
    
    new=zeros(360,360);
    new(link)=1;
    new=new+new';
else
    new=nan(360,360);
end
end