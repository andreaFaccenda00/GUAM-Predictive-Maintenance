function [rankedFeatures, pValues, resultsTable] = anovaTest(featureTable, faultColumn)
    if nargin < 2
        faultColumn = 'FaultCode';
    end
    groups = featureTable.(faultColumn);
    uniqueGroups = unique(groups);
    if numel(uniqueGroups) < 2
        error('La colonna fault deve contenere almeno due gruppi per un test ANOVA a una via.');
    end
    allVars = featureTable.Properties.VariableNames;
    numericFeatures = {};
    for i = 1:length(allVars)
        if ~strcmp(allVars{i}, faultColumn) && isnumeric(featureTable.(allVars{i}))
            numericFeatures{end+1} = allVars{i};
        end
    end
    pValues = zeros(length(numericFeatures), 1);
    for i = 1:length(numericFeatures)
        featureData = featureTable.(numericFeatures{i});
        p = anova1(featureData, groups, 'off');
        pValues(i) = p;
    end
    [sortedP, idx] = sort(pValues);
    rankedFeatures = numericFeatures(idx);
    resultsTable = table(rankedFeatures', sortedP, 'VariableNames', {'Feature', 'pValue'});
end
