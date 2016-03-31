% RF
% Input:
% test_feature: Array whose rows are objects and columns features
% train_feature: Array whose rows are objects and columns features
% train_label
% test_label
% numTrees
% rho: Number of variables to select at random for each decision split.
% Default is square root of features
% leafSize: Minimum number of observations per tree leaf. 
% Default is 1 for classification

function [class, scores, Mnorm, M, ACA] = ...
    forest_model(train_feature,test_feature,train_label,test_label,...
    numTrees,rho,leafSize)

forest = TreeBagger(numTrees,train_feature,train_label,'Method',...
    'classification','MinLeafSize',leafSize); %'NumPredictorsToSample',rho,

[classCell,scores] = predict(forest,test_feature);
for i=1:length(classCell)
class(i,1)=str2double(classCell{i});
end
[Mnorm, M, ACA]=confusionM(class,test_label);

end