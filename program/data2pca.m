function [pcaTransformed] = data2pca(new_data, mu, coeff, pocty);

% Funkce pøevádí testovací nahrávky do prostoru PCA daného trénovacím
% modelem.
% Vstupem jsou nová data a koeficienty vytrénovaného PCA prostoru.
% Výstupem jsou datav v prostoru PCA.


%% transformace
pcaTransformed = bsxfun(@minus, new_data, mu) * coeff;

%% vykreslení
% figure                                                                     % objekty 3d
% scatter3(pcaTransformed(:,1),pcaTransformed(:,2),pcaTransformed(:,3),'.');
% hold on;
% box;
% grid on;
% ylabel('PC2');
% xlabel('PC1');
% zlabel('PC3');
% hold off;




end