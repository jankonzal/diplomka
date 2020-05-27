 function [Mdl] = klasifikace(score,info);
% Funkce slou�� k vytr�nov�n� klasifika�n�ho modelu.
% Vstupem jsou score z PCA a informace o testovac� sad�.

%% p�ed�n� prom�nn�ch
info = table2array(info);
X = score;
%% ozna�en� t��d tr�novac� sady
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
%% grafick� zobrazen�

% t = templateSVM('Standardize',1,'KernelFunction','gaussian');
% Mdl = fitcecoc(X,Y,'Learners',t,'FitPosterior',1);
% xMax = max(X);
% xMin = min(X);
% 
% x1Pts = linspace(xMin(1),xMax(1));
% x2Pts = linspace(xMin(2),xMax(2));
% [x1Grid,x2Grid] = meshgrid(x1Pts,x2Pts);
% [SVMlabel,NegLoss ,SVMscore,PosteriorRegion] = predict(Mdl,[x1Grid(:),x2Grid(:)]);
% contourf(x1Grid,x2Grid,...
%         reshape(max(PosteriorRegion,[],2),size(x1Grid,1),size(x1Grid,2)));
% hold on;
% xlabel 'PC1';
% ylabel 'PC2';
% pc=gscatter(X(:,1),X(:,2),Y,'ymcrgbk','o*xs^ph');
% legend (pc,'mal� buben', 'velk� buben', 'hi-hat(zav�en�)', 'crash', 'ride', 'mal� buben + hi-hat', 'velk� buben + hi-hat');
% hold off;
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