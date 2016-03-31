% KNN
% Input:
% test_feature: Array whose rows are objects and columns features
% train_feature: Array whose rows are objects and columns features
% numK: number of neighbors to take
% distance: distance to compare the objects. 
% 1.L1 2.Intersection 3.Chi2 4.L2
function [class, knn_class, knn_index, knn_distance, Mnorm,M, ACA] = ...
    knn_model(train_feature,test_feature,numK,distance,train_label,...
    test_label,DD)
% 1. Calculo las distancias
if isempty(DD)
    switch distance
        case 'L1'
            dist = l1_distance(train_feature,test_feature);
        case 'chi2'
            dist = chi2_distance(train_feature,test_feature);
        case 'Ik'
            dist = inter_distance(train_feature,test_feature);
        case 'L2'
            dist = l2_distance(train_feature,test_feature);
    end
else
    dist = DD;
end
% dist es una matriz con las distancias de test a train. cada columna es un
% objeto de test diferente y cada fila es uno de train

% 2. Tomo los knn vecinos mas cercanos en la muestra
% Organizo las distancias y tomo los indices de las k mas cercanas
[val,index]=sort(dist); 
% sort organiza de menor a mayor las columnas
% val es una matriz con las distancias ordenadas de menor a mayor por
% columnas (cada columna representa las distancias a un objeto de test)
% index es una matriz con los indices de las distancias organizadas de
% menor a mayor. (cada columna representa las distancias a un objeto de test)
% Tomo las k distancias mas cercanas
knn_distance = val(1:numK,:);
knn_index = index(1:numK,:);

% 3. Tomo las clases de los k vecinos y calculo la clase de test con la
% moda de los vecinos
knn_class = zeros(size(test_feature,1),numK);
class = zeros(size(test_feature,1),1);
for i = 1:size(test_feature,1)
    knn_class(i,:) = train_label(knn_index(:,i))';
    class(i,:) = mode(knn_class(i,:));
end

% 4. Calculo resultados
[Mnorm,M,ACA]=confusionM(class,test_label);
% disp_confMatrix(M);

% [class, knn_class, knn_index, knn_distance, M, ACA] = knn_model(A,B,20,'Ik',S.label,S.label);
