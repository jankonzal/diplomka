function [Mdl] = klasifikace(score);
X = score;
for i = 1:221
Y(i,1)=1;       %1 je SN 
end
for i = 222:323
Y(i,1)=2;       %2 je KICK
end
<<<<<<< HEAD
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
=======
for i = 324:427
Y(i,1)=3;       % je Hi-Hat
>>>>>>> parent of c361f40... rozÅ¡Ã­Å™enÃ­ na dvoj Ãºdery
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