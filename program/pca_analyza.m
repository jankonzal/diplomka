function [coeff,score,latent,mu] = pca_analyza(M, pocty);
%{
Funkce pro výpoèet hlavních komponent.
Vstupem jsou data, a poèty samplù pro jednotlivé bubny (pro barevné rozlièení)
Výstupem jesou koueficienty, skóre, vlastní èísla, odhadované støedy.
Pro zobrazení vysledkù PCA, lze odkomentovat požadovaný graf.
%}
%% PCA 
[coeff,score,latent,tsquared,explained,mu] = pca(M,'NumComponents',7);

%% vykreslení

% pocet_PC = length(explained);                                            % graf úpatí vlastních hodnot
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
% ylabel('Vlastní hodnota [%]');
% xlabel('Hlavní komponenty [-]');
% grid on;
% %title('Graf závislosti vlastní hodnoty na poøadí hlavní komponenty')
% hold off;
% 
% 
% g = figure;
% uit = uitable(g);
% uit.Data = explained;
% uit.ColumnName = {'Vlastní èísla [%]'};

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
sc1 = 1:221;                                                   % rozdìlení poètù samplù pro jednotlivé bubny(zatím pro 3)
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

scatter3(score(sc4,1),score(sc4,2),score(sc4,3),'.y');
scatter3(score(sc5,1),score(sc5,2),score(sc5,3),'.m');
scatter3(score(sc6,1),score(sc6,2),score(sc6,3),'.c');
grid on;
legend ('malý buben', 'velký buben', 'hi-hat', 'ftom', 'crash', 'ride');
ylabel('PC2');
xlabel('PC1');
zlabel('PC3');
hold off;
figure;
scatter3(score(sc1,4),score(sc1,5),score(sc1,6),'.r');
hold on;
box;
scatter3(score(sc2,4),score(sc2,5),score(sc2,6),'.g');
scatter3(score(sc3,4),score(sc3,5),score(sc3,6),'.b');

scatter3(score(sc4,4),score(sc4,5),score(sc4,6),'.y');
scatter3(score(sc5,4),score(sc5,5),score(sc5,6),'.m');
scatter3(score(sc6,4),score(sc6,5),score(sc6,6),'.c');
grid on;
legend ('malý buben', 'velký buben', 'hi-hat', 'ftom', 'crash', 'ride');
ylabel('PC5');
xlabel('PC4');
zlabel('PC6');
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