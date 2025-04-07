function [rankedFeatures, pValues, resultsTable] = t_test(featureTable, faultColumn)
if nargin < 2
    faultColumn = 'Fault';
end
groups = featureTable.(faultColumn);
uniqueGroups = unique(groups);
if numel(uniqueGroups) ~= 2
    error('The fault column must contain exactly two unique groups for a two-sample t-test.');
end
allVars = featureTable.Properties.VariableNames;
numericFeatures = {};
for i = 1:length(allVars)
    if ~strcmp(allVars{i}, faultColumn) && isnumeric(featureTable.(allVars{i}))
        numericFeatures{end+1} = allVars{i};
    end
end
pValues = zeros(length(numericFeatures),1);
for i = 1:length(numericFeatures)
    featureData = featureTable.(numericFeatures{i});
    group1 = featureData(groups == uniqueGroups(1));
    group2 = featureData(groups == uniqueGroups(2));
    [~, p] = ttest2(group1, group2, 'Vartype', 'unequal');
    pValues(i) = p;
end
[sortedP, idx] = sort(pValues);
rankedFeatures = numericFeatures(idx);
resultsTable = table(rankedFeatures', sortedP, 'VariableNames', {'Feature', 'pValue'});
end
