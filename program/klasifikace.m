function [Mdl] = klasifikace(score);
X = score;
for i = 1:221
Y(i,1)=1;       %1 je SN 
end
for i = 222:323
Y(i,1)=2;       %2 je KICK
end
for i = 324:427
Y(i,1)=3;       % je Hi-Hat
end
% for i = 427:442 
% Y(i,1)={'ftom'};
% end
% for i = 442:479
% Y(i,1)={'crash'};
% end
% for i = 479:499
% Y(i,1)={'ride'};
% end

%% SVM
Mdl = fitcecoc(X,Y);
%figure;
%gscatter(X(:,1),X(:,2),Y);
%legend('1. t��da','2. t��da','3. t��da');
%% k-Means
% [idx,C] = kmeans(X,3);
% figure;
% gscatter(X(:,1),X(:,2),idx);
% legend('1. t��da','2. t��da','3. t��da');
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
% legend('1. t��da','2. t��da','3. t��da');
% ylabel('PC2');
% xlabel('PC1');
% grid on;
end