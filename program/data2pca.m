function [pcaTransformed] = data2pca(new_data, mu, coeff, pocty);

% Funkce p�ev�d� testovac� nahr�vky do prostoru PCA dan�ho tr�novac�m
% modelem.
% Vstupem jsou nov� data a koeficienty vytr�novan�ho PCA prostoru.
% V�stupem jsou datav v prostoru PCA.


%% transformace
pcaTransformed = bsxfun(@minus, new_data, mu) * coeff;

%% vykreslen�
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