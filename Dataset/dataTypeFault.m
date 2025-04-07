function [tableSurface2, tableSurface5] = dataTypeFault(inputTable)
    if ~ismember('FaultCode', inputTable.Properties.VariableNames)
        error('La tabella non contiene la colonna "FaultCode".');
    end
    filteredTable = inputTable(inputTable.FaultCode ~= 0, :);
    if ~ismember('Surface', filteredTable.Properties.VariableNames)
        error('La tabella non contiene la colonna "Surface".');
    end
    tableSurface2 = filteredTable(filteredTable.Surface == 2, :);    
    tableSurface5 = filteredTable(filteredTable.Surface == 5, :);
end
