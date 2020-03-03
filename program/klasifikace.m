function [Mdl] = klasifikace(score);
X = score;
for i = 1:221
Y(i,1)={'sn'};
end
for i = 222:323
Y(i,1)={'kick'};
end
for i = 324:427
Y(i,1)={'hi-hat'};
end


%% SVM
Mdl = fitcecoc(X,Y);
%figure;
%gscatter(X(:,1),X(:,2),Y);
%legend('1. tøída','2. tøída','3. tøída');
%% k-Means
[idx,C] = kmeans(X,3);
figure;
gscatter(X(:,1),X(:,2),idx);
legend('1. tøída','2. tøída','3. tøída');
ylabel('PC2');
xlabel('PC1');
grid on;
%% Hierarchical Clustering
Y = pdist(X);
Z = linkage(Y);
I = inconsistent(Z);
T = cluster(Z,'maxclust',3);
figure;
gscatter(X(:,1),X(:,2),T);
legend('1. tøída','2. tøída','3. tøída');
ylabel('PC2');
xlabel('PC1');
grid on;
end