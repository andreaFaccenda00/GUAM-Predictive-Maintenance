function eVTOL_Data_final = downSample(Data, seed)
% balanceAndDownsample Balances an eVTOL dataset based on Fault and Surface and downsamples time-series rows.
%   eVTOL_Data_final = balanceAndDownsample(Data, seed) returns a balanced dataset with an equal number
%   of samples for each combination of 'Fault' and 'Surface' classes, and performs an undersampling on
%   the time-series data for rows with FaultCode equal to 0 using efficient vectorized operations.
%   If a seed is provided, it is used for reproducible randomization.
%
%   Parameters:
%       Data - A table containing the dataset with 'Fault', 'FaultCode', 'Surface', and time-series fields.
%       seed - (Optional) A scalar value to set the random seed.

if ~ismember('Fault', Data.Properties.VariableNames)
    error('Input table must contain a column named ''Fault''.');
end
if ~ismember('Surface', Data.Properties.VariableNames)
    error('Input table must contain a column named ''Surface''.');
end
if ~ismember('FaultCode', Data.Properties.VariableNames)
    error('Input table must contain a column named ''FaultCode''.');
end

if nargin == 2
    rng(seed);
end

% Group data by Fault and Surface using vectorized operations
[G, ~, ~] = findgroups(Data.Fault, Data.Surface);
groupCounts = splitapply(@numel, Data.Fault, G);
minCount = min(groupCounts);
selectedIndices = arrayfun(@(g) randsample(find(G==g), minCount), (1:max(G))', 'UniformOutput', false);
selectedIndices = vertcat(selectedIndices{:});
selectedIndices = selectedIndices(randperm(numel(selectedIndices)));
balancedData = Data(selectedIndices, :);

% Calculate the total number of time-series rows for FaultCode 0 and not 0
totalRows_fault0 = sum(cellfun(@(tt) height(tt), balancedData.EngineCmd1(balancedData.FaultCode==0)));
totalRows_faultNot0 = sum(cellfun(@(tt) height(tt), balancedData.EngineCmd1(balancedData.FaultCode~=0)));
if totalRows_fault0 == 0
    error('No fault-free rows to undersample.');
end
undersample_ratio = totalRows_faultNot0 / totalRows_fault0;

fields = {'EngineCmd1','EngineCmd2','EngineCmd3','EngineCmd4','EngineCmd5',...
          'EngineCmd6','EngineCmd7','EngineCmd8','EngineCmd9',...
          'SurfaceCmd_1','SurfaceCmd_2','SurfaceCmd_3','SurfaceCmd_4','SurfaceCmd_5',...
          'Vtot','Omega_x','Omega_y','Omega_z',...
          'Accel_x','Accel_y','Accel_z',...
          'Euler_phi','Euler_theta','Euler_psi',...
          'Gamma','Chi'};

downsampleTT = @(tt, ratio) downsampleTimeseries(tt, ratio);
idxFault0 = find(balancedData.FaultCode==0);
for f = 1:length(fields)
    fieldName = fields{f};
    balancedData.(fieldName)(idxFault0) = cellfun(@(tt) downsampleTT(tt, undersample_ratio), balancedData.(fieldName)(idxFault0), 'UniformOutput', false);
end

eVTOL_Data_final = balancedData;
end

function tt_out = downsampleTimeseries(tt, ratio)
nRows = height(tt);
nSelect = round(nRows * ratio);
if nSelect < 1, nSelect = 1; end
if nSelect < nRows
    startIdx = randi(nRows - nSelect + 1);
    idxSel = startIdx:(startIdx+nSelect-1);
else
    idxSel = 1:nRows;
end
tt_out = tt(idxSel, :);
end
