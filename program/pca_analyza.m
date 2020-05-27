function [coeff,score,latent,mu] = pca_analyza(E, info);

% Funkce pro v�po�et hlavn�ch komponent.
% Vstupem jsou spo�ten� energie v p�smech, a po�ty sampl� pro jednotliv� bubny (pro barevn� rozli�en�)
% V�stupem jesou koueficienty, sk�re, vlastn� ��sla, odhadovan� st�edy.
% Pro zobrazen� vysledk� PCA, lze odkomentovat po�adovan� graf.

%% PCA 
[coeff,score,latent,tsquared,explained,mu] = pca(E','NumComponents',9);

%% vykreslen�

% pocet_PC = length(explained);                                            % graf �pat� vlastn�ch hodnot
% figure      % scre plot
% plot (1:pocet_PC,explained,'-b');
% hold on;
% plot (1:pocet_PC,explained,'+r');
% ax = gca;
% ax.XLim = [0 12];
% xticks([1 2 3 4 5 6 7 8 9 10 11 12]);
% xticklabels({'PC1','PC2','PC3','PC4','PC5','PC6','PC7','PC8','PC9','PC10','PC11','PC12'});
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
% 
% 
% info = table2array(info);
% figure                                                                     % objekty 3d
% sc1 = 1:info(1,1);                                                         % rozd�len� po�t� sampl� pro jednotliv� bubny(zat�m pro 3)
% i = length(sc1);
% sc2 = i:i+info(1,2)-1;
% i = i + length(sc2);
% sc3 = i:i+info(1,3)-1;
% i = i + length(sc3);
% sc4 = i:i+info(1,4)-1;
% i = i + length(sc4);
% sc5 = i:i+info(1,5)-1;
% i = i + length(sc5);
% sc6 = i:i+info(1,6)-1;
% i = i + length(sc6);
% sc7 = i:i+info(1,7)-1;
% 
% 
% 
% scatter3(score(sc1,1),score(sc1,2),score(sc1,3),'.r');
% hold on;
% box;
% scatter3(score(sc2,1),score(sc2,2),score(sc2,3),'.g');
% scatter3(score(sc3,1),score(sc3,2),score(sc3,3),'.b');
% scatter3(score(sc4,1),score(sc4,2),score(sc4,3),'.c');
% scatter3(score(sc5,1),score(sc5,2),score(sc5,3),'.m');
% scatter3(score(sc6,1),score(sc6,2),score(sc6,3),'.y');
% scatter3(score(sc7,1),score(sc7,2),score(sc7,3),'.k');
% 
% 
% grid on;
% legend ('mal� buben', 'velk� buben', 'hi-hat(zav�en�)', 'crash', 'ride', 'mal� buben + hi-hat', 'velk� buben + hi-hat');
% %legend ('crash', 'ride', 'Snare + Hi-Hat', 'Kick + Hi-Hat');
% ylabel('PC2');
% xlabel('PC1');
% zlabel('PC3');
% hold off;


% 
% figure                                                                     % biplot
% vbls = {'31','40','50','63','80','100','125','160','200','250','315','400','500'...
%      '630','800','1000','1250','1600','2000','2500','3150','4000','5000','6300','8000','10000','12500','1600', '20000'};
% biplot(coeff(:,1:3),'VarLabels',vbls);
% ylabel('PC2');
% xlabel('PC1');
% zlabel('PC3');
% box
% grid on;
    
end