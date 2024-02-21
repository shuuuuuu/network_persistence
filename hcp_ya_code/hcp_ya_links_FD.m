function hcp_ya_links_FD(ii,th)
N=360; % the number of nodes
n=fix(1200/x/5);%the number of data in overlap; time window is 14.4/5 = 2.88 min
x1=1:n:1200-n*10+1;
x2=x1+n*10-1;% sliding time window index
k=length(x1);% the number of time windows

root1="/HeLabData3_master/shuguo/hcpya/network/288FD/"; % output path
root2="/HeLabData3_master/shuguo/hcpya/TC/*.nii"; % input path of ptseries
root3="/HeLabData3_master/shuguo/hcpya/motion/"; % input path of FD
group_files = dir(root2); % subjects ID list

name=group_files(ii).name; % subject ID
tempall=ciftiopen(strcat("/HeLabData3_master/shuguo/hcpd/TC/",name),"/HeLabData3_master/shuguo/HCP_Vadim/D/software/workbench-windows64-v1.5.0/workbench/bin_windows64/wb_command");
tempall=tempall.cdata; % ptseries_cdata

mname=strcat(root3,"FD_",name(1:20),".mat");
load(mname) % FD data

for j=1:k
    data=tempall(:,x1(j):x2(j))'; % ptseries_cdata in time window j 
    FD=fd(x1(j):x2(j)); % FD in time window j 
    ind=sum(FD>th);
    if ind<n*0.2 % FD>th less than 20% of n
        [mapc,mapw]=trynew_callmaplineonetime(data(FD<th,:));
        [mapcs,mapws]=trynew_callmaplineonetime_shuffle(data(FD<th,:));
    else
        mapc=nan(N,N);
        mapw=nan(N,N);
        mapcs=nan(N,N);
        mapws=nan(N,N);
    end
    mapname=strcat(root1,"FD_map_",name(1:20),"_",num2str(j),".mat");
    save(mapname,'mapc','mapw','mapcs','mapws')
end