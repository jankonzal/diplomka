function [coeff,score,latent,mu] = pca_analyza(E, pocty);
%{
Funkce pro v�po�et hlavn�ch komponent.
Vstupem jsou data, a po�ty sampl� pro jednotliv� bubny (pro barevn� rozli�en�)
V�stupem jesou koueficienty, sk�re, vlastn� ��sla, odhadovan� st�edy.
Pro zobrazen� vysledk� PCA, lze odkomentovat po�adovan� graf.
%}
%% PCA 
[coeff,score,latent,tsquared,explained,mu] = pca(E','NumComponents',7);

%% vykreslen�

% pocet_PC = length(explained);                                            % graf �pat� vlastn�ch hodnot
% figure      % scre plot
% plot (1:pocet_PC,explained,'-b');
% hold on;
% plot (1:pocet_PC,explained,'+r');
% ax = gca;
% ax.XLim = [0 6];
% xticks([1 2 3 4 5]);
% xticklabels({'PC1','PC2','PC3','PC4','PC5'});
% ax.YLim = [-10 100];
% yticks([0 10 20 30 40 50 60 70 80 90 100]);
% yticklabels({'0','10','20','30','40','50','60','70','80','90','100'});
% ylabel('Vlastn� hodnota [%]');
% xlabel('Hlavn� komponenty [-]');
% grid on;
% %title('Graf z�vislosti vlastn� hodnoty na po�ad� hlavn� komponenty')
% hold off;
% 
% 
% g = figure;
% uit = uitable(g);
% uit.Data = explained;
% uit.ColumnName = {'Vlastn� ��sla [%]'};

% figure                                                                   % objekty                                               
% plot(score(:,1),score(:,2),'or');
% hold on;
% XL1 = [-40 40];
% YL1 = [0 0];
% plot(XL1,YL1,'k');
% YL2 = [-30 30];
% XL2 = [0 0];
% plot(XL2,YL2,'k');
% grid on;
% axis equal
% ax = gca;
% ax.XLim = [-40 40];
% ax.YLim = [-30 30];
% ylabel('PC2');
% xlabel('PC1');
% hold off;

figure                                                                     % objekty 3d
sc1 = 1:221;                                                               % rozd�len� po�t� sampl� pro jednotliv� bubny(zat�m pro 3)
sc2 = 222:323;
sc3 = 324:427;
sc4 = 427:442;
sc5 = 442:479;
sc6 = 479:499;
scatter3(score(sc1,1),score(sc1,2),score(sc1,3),'.r');
hold on;
box;
scatter3(score(sc2,1),score(sc2,2),score(sc2,3),'.g');
scatter3(score(sc3,1),score(sc3,2),score(sc3,3),'.b');


grid on;
legend ('mal� buben', 'velk� buben', 'hi-hat');
ylabel('PC2');
xlabel('PC1');
zlabel('PC3');
hold off;


% 
% figure                                                                     % biplot
% vbls = {'25', '31', '39', '50', '62', '79', '100', '125', '158', '200', ...
%     '251', '317', '400', '503', '634', '800', '1000', '1269', '1600', ...
%     '2015', '2539', '3200', '4000', '5100', '6400', '8060', '10159', ...
%     '12800', '16127'};
% biplot(coeff(:,1:3),'Scores',score(:,1:3),'VarLabels',vbls);
% ylabel('PC2');
% xlabel('PC1');
% zlabel('PC3');
% box
% grid on;
    
end