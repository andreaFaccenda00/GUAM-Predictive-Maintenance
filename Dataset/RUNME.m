%% Clear all
clc;
clear;
%% Generate Dataset

mainFolder = '/MATLAB Drive/Guam_Predictive_Maintenance/Dataset';
surfaces = {'Surface_2', 'Surface_5'};
faults = { ...
    struct('subFolder', 'Hold_last', 'csv_name', '%s_hold_last.csv', 'fault_code', 1), ...
    struct('subFolder', 'Pre_scale', 'csv_name', '%s_pre_scale.csv', 'fault_code', 2), ...
    struct('subFolder', 'Post_scale', 'csv_name', '%s_post_scale.csv', 'fault_code', 3), ...
    struct('subFolder', 'Control_reversal', 'csv_name', '%s_control_reversal.csv', 'fault_code', 8) ...
};
numTrajectories = 200;
final_eVTOL_Data = [];

for s = 1:length(surfaces)
    surfaceName = surfaces{s};
    eVTOL_Data = [];
    for k = 1:length(faults)
        cfg = faults{k};
        csvName = sprintf(cfg.csv_name, surfaceName);
        baseFolder = fullfile(mainFolder, surfaceName, cfg.subFolder);
        Data = [];
        for i = 1:numTrajectories
            Data = processTrajectory(i, baseFolder, csvName, cfg.fault_code, Data);
        end
        if ~isempty(Data)
            if contains(surfaceName, '2')
                Data.Surface = repmat(2, height(Data), 1);
            else
                Data.Surface = repmat(5, height(Data), 1);
            end
            Data.Fault = double(Data.FaultCode ~= 0);
        end
        
        eVTOL_Data = [eVTOL_Data; Data];
    end
    final_eVTOL_Data = [final_eVTOL_Data; eVTOL_Data];
end

save(fullfile(mainFolder, 'eVTOL_Dataset_AllSurfaces.mat'), 'final_eVTOL_Data', '-v7.3');
clear;
clc;

%% DownSampling Data

%load('eVTOL_Dataset_AllSurfaces.mat');
baseFolder = '/MATLAB Drive/Guam_Predictive_Maintenance/Dataset';
seed = 3; % Change random seed
eVTOL_Data = downSample(final_eVTOL_Data, seed);
save(fullfile(baseFolder, 'eVTOL_Data.mat'), 'eVTOL_Data', '-v7.3');

%% Check samples in Dataset

[totalSurface2, totalSurface2_fault0, totalSurface2_fault1, totalSurface2_fault2, totalSurface2_fault3, totalSurface2_fault8, ...
 totalSurface5, totalSurface5_fault0, totalSurface5_fault1, totalSurface5_fault2, totalSurface5_fault3, totalSurface5_fault8] = checkSamples(eVTOL_Data);

fprintf('\n--- Total Samples after Downsampling ---\n');

fprintf('Surface 2:\n');
fprintf('%-35s %10d\n', 'Total samples for Surface 2:', round(totalSurface2/200));
fprintf('%-35s %10d\n', '  Fault Code 0:', round(totalSurface2_fault0/200));
fprintf('%-35s %10d\n', '  Fault Code 1:', round(totalSurface2_fault1/200));
fprintf('%-35s %10d\n', '  Fault Code 2:', round(totalSurface2_fault2/200));
fprintf('%-35s %10d\n', '  Fault Code 3:', round(totalSurface2_fault3/200));
fprintf('%-35s %10d\n', '  Fault Code 8:', round(totalSurface2_fault8/200));

fprintf('\nSurface 5:\n');
fprintf('%-35s %10d\n', 'Total samples for Surface 5:', round(totalSurface5/200));
fprintf('%-35s %10d\n', '  Fault Code 0:', round(totalSurface5_fault0/200));
fprintf('%-35s %10d\n', '  Fault Code 1:', round(totalSurface5_fault1/200));
fprintf('%-35s %10d\n', '  Fault Code 2:', round(totalSurface5_fault2/200));
fprintf('%-35s %10d\n', '  Fault Code 3:', round(totalSurface5_fault3/200));
fprintf('%-35s %10d\n', '  Fault Code 8:', round(totalSurface5_fault8/200));

fprintf('-----------------------------------------\n');
clear;
clc;


