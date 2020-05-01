function [Mdl] = klasifikace(score,info);
info = table2array(info);
X = score;

for i = 1:info(1,1)
    Y(i,1)=1;    %1 je SN 
end
j=i;
clear i;
for i = j:j+info(1,2)
    Y(i,1)=2;    %1 je Kick 
end
j=i;
clear i;
for i = j:j+info(1,3)
    Y(i,1)=3;    %3 je Hi-Hat
end
j=i;
clear i;
for i = j:j+info(1,4)
    Y(i,1)=4;    %4 je Crash 
end
j=i;
clear i;
for i = j:j+info(1,5)
    Y(i,1)=5;    %5 je Ride
end
j=i;
clear i;
for i = j:j+info(1,6)
    Y(i,1)=6;    %21 je Snare + Hi-Hat
end
j=i;
clear i;
for i = j:j+info(1,7)
    Y(i,1)=7;    %21 je Kick + Hi-Hat
end
%% SVM
t = templateSVM('Standardize',true);
Mdl = fitcecoc(X,Y,'FitPosterior',true);
%figure;
%gscatter(X(:,1),X(:,2),Y);
%legend('1. tøída','2. tøída','3. tøída');
%% k-Means
% [idx,C] = kmeans(X,3);
% figure;
% gscatter(X(:,1),X(:,2),idx);
% legend('1. tøída','2. tøída','3. tøída');
% ylabel('PC2');
% xlabel('PC1');
% grid on;
%% Hierarchical Clustering
% Y = pdist(X);
% Z = linkage(Y);
% I = inconsistent(Z);
% T = cluster(Z,'maxclust',3);
% figure;
% gscatter(X(:,1),X(:,2),T);
% legend('1. tøída','2. tøída','3. tøída');
% ylabel('PC2');
% xlabel('PC1');
% grid on;
end