%% Create set to apply cascade classifier
cd '/MATLAB Drive/Guam_Predictive_Maintenance/Classification_Learner/Cascade';
Data = table();
csvFile = 'Surface_2_post_scale.csv';

fault_code = 3;
surface_type = 2;

Data = processTrajectory(csvFile, fault_code, surface_type, Data);

%% Cascade Classifier

finalLabel = cascadeClassifier(Data);
fprintf('Risultato della classificazione: %s\n', finalLabel);