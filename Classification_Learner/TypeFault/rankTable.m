function filteredTable = rankTable(inputTable, selectedRankTable)
essentialCols = {'EnsembleID_', 'FaultCode', 'FRM_1/TimeStart', 'FRM_1/TimeEnd'};
features = selectedRankTable.Feature;
if ~iscell(features)
    features = cellstr(features);
end
features = features(:)';
filteredTable = inputTable(:, intersect(inputTable.Properties.VariableNames, essentialCols, 'stable'));
nRows = height(inputTable);
for i = 1:length(features)
    colName = features{i};
    if ismember(colName, inputTable.Properties.VariableNames)
        filteredTable.(colName) = inputTable.(colName);
    else
        warning('Column %s not found in input table. Creating a column with NaN values.', colName);
        filteredTable.(colName) = repmat(NaN, nRows, 1);
    end
end
end
