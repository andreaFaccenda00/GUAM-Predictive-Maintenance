%% Main Script - Guam Predictive Maintenance
clear; clc;

%% Load Dataset
baseFolder = '/MATLAB Drive/Guam_Predictive_Maintenance';
dataFolder = fullfile(baseFolder, 'Dataset');
load(fullfile(dataFolder, 'eVTOL_Data.mat'));

%% Fault

disp('Compute Feature Fault');
cd '/MATLAB Drive/Guam_Predictive_Maintenance/Classification_Learner/Fault';
fileName = 'featureTable.mat';

if isfile(fileName)
    disp('Load featureTable from local file...');
    load('/MATLAB Drive/Guam_Predictive_Maintenance/Classification_Learner/Fault/featureTable.mat');
else
    disp('Compute featureTable...');
    [featureTable, outputTable] = diagnosticFeatures(eVTOL_Data);
    save(fileName, 'featureTable');
end

% Ranking feature
[trainTable, testTable] = splitFeatureTable(featureTable);
rank = 20;
[rankedFeatures, pValues, resultsTable] = t_Test(featureTable, 'Fault');
selectedRankTable = resultsTable(1:rank, :);
trainTable = rankTable(trainTable, selectedRankTable);
testTable = rankTable(testTable, selectedRankTable);

% Training
modelFileName = 'faultModel.mat';
if isfile(modelFileName)
    disp('Load model from local file...');
    load('/MATLAB Drive/Guam_Predictive_Maintenance/Classification_Learner/Fault/faultModel.mat');
else
    disp('Training model...');
    [faultModel, validationAccuracy] = trainClassifier(trainTable,selectedRankTable);
    fprintf('Validation Accuracy = %.2f%%\n', validationAccuracy * 100);
    modelFileName = 'faultModel.mat';
    save(modelFileName, 'faultModel');
end

% Test 
predictedLabels = faultModel.predictFcn(testTable);
trueLabels = testTable.Fault;
testAccuracy = sum(predictedLabels == trueLabels) / length(trueLabels);
fprintf('Test Accuracy = %.2f%%\n', testAccuracy * 100);
confMat = confusionmat(trueLabels, predictedLabels);
plotConfusionMatrix(confMat);

%% Surface 

disp('Compute Feature Surface');
cd '/MATLAB Drive/Guam_Predictive_Maintenance/Classification_Learner/Surface';

fileName = 'featureTable.mat';

if isfile(fileName)
    disp('Load featureTable from local file...');
    load('/MATLAB Drive/Guam_Predictive_Maintenance/Classification_Learner/Surface/featureTable.mat');
else
    disp('Compute featureTable...');
    [featureTable, outputTable] = diagnosticFeatures(eVTOL_Data);
    save(fileName, 'featureTable');
end

% Ranking Feature
[trainTable, testTable] = splitFeatureTable(featureTable);
rank = 20;
[rankedFeatures, pValues, resultsTable] = t_Test(featureTable, 'Surface');
selectedRankTable = resultsTable(1:rank, :);
trainTable = rankTable(trainTable, selectedRankTable);
testTable = rankTable(testTable, selectedRankTable);

% Training
modelFileName = 'surfaceModel.mat';
if isfile(modelFileName)
    disp('Load model from local file...');
    load('/MATLAB Drive/Guam_Predictive_Maintenance/Classification_Learner/Surface/surfaceModel.mat');
else
    disp('Training model...');
    [surfaceModel, validationAccuracy] = trainClassifier(trainTable,selectedRankTable);
    fprintf('Validation Accuracy = %.2f%%\n', validationAccuracy * 100);
    save(modelFileName, 'surfaceModel');
end

% Test 
predictedLabels = surfaceModel.predictFcn(testTable);
trueLabels = testTable.Surface;
testAccuracy = sum(predictedLabels == trueLabels) / length(trueLabels);
fprintf('Test Accuracy = %.2f%%\n', testAccuracy * 100);
confMat = confusionmat(trueLabels, predictedLabels);
plotConfusionMatrix(confMat);

%% Type Fault Surface 2
disp('Compute Type Fault');
cd '/MATLAB Drive/Guam_Predictive_Maintenance/Dataset';

if exist('tableSurface2.mat', 'file') == 2 && exist('tableSurface5.mat', 'file') == 2
    load('tableSurface2.mat', 'tableSurface2'); 
else
    [tableSurface2, tableSurface5] = dataTypeFault(eVTOL_Data);
end

cd '/MATLAB Drive/Guam_Predictive_Maintenance/Classification_Learner/TypeFault/Surface_2';
fileName = 'featureTable.mat';

if isfile(fileName)
    disp('Load featureTable from local file...');
    load('/MATLAB Drive/Guam_Predictive_Maintenance/Classification_Learner/TypeFault/Surface_2/featureTable.mat');
else
    disp('Compute featureTable...');
    cd '/MATLAB Drive/Guam_Predictive_Maintenance/Classification_Learner/TypeFault/';
    [featureTable, outputTable] = diagnosticFeatures(tableSurface2);
    baseFolder = '/MATLAB Drive/Guam_Predictive_Maintenance/Classification_Learner/TypeFault/Surface_2/';
    fullFileName = fullfile(baseFolder, fileName);
    save(fullFileName, 'featureTable');
end
cd '/MATLAB Drive/Guam_Predictive_Maintenance/Classification_Learner/TypeFault/';
[trainTable, testTable] = splitFeatureTable(featureTable);
rank = 20;
[rankedFeatures, pValues, resultsTable] = anovaTest(featureTable, 'FaultCode');
selectedRankTable = resultsTable(1:rank, :);
trainTable = rankTable(trainTable, selectedRankTable);
testTable = rankTable(testTable, selectedRankTable);

% Training
cd '/MATLAB Drive/Guam_Predictive_Maintenance/Classification_Learner/TypeFault/Surface_2';
modelFileName = 'typeFaultModel.mat';
if isfile(modelFileName)
    disp('Load model from local file...');
    load('/MATLAB Drive/Guam_Predictive_Maintenance/Classification_Learner/TypeFault/Surface_2/typeFaultModel.mat');
else
    disp('Training model...');
    cd '/MATLAB Drive/Guam_Predictive_Maintenance/Classification_Learner/TypeFault/';
    [typeFaultModel, validationAccuracy] = trainClassifier(trainTable,selectedRankTable);
    fprintf('Validation Accuracy = %.2f%%\n', validationAccuracy * 100);
    baseFolder = '/MATLAB Drive/Guam_Predictive_Maintenance/Classification_Learner/TypeFault/Surface_2/';
    fullFileName = fullfile(baseFolder, modelFileName);
    save(fullFileName, 'typeFaultModel');
end

% Test 
cd '/MATLAB Drive/Guam_Predictive_Maintenance/Classification_Learner/TypeFault/';
predictedLabels = typeFaultModel.predictFcn(testTable);
trueLabels = testTable.FaultCode;
testAccuracy = sum(predictedLabels == trueLabels) / length(trueLabels);
fprintf('Test Accuracy = %.2f%%\n', testAccuracy * 100);
confMat = confusionmat(trueLabels, predictedLabels);
plotConfusionMatrix(confMat);

%% Type Fault Surface 5
disp('Compute Type Fault');
cd '/MATLAB Drive/Guam_Predictive_Maintenance/Dataset';

if exist('tableSurface2.mat', 'file') == 2 && exist('tableSurface5.mat', 'file') == 2
    load('tableSurface5.mat', 'tableSurface5'); 
else
    [tableSurface2, tableSurface5] = dataTypeFault(eVTOL_Data);
end

cd '/MATLAB Drive/Guam_Predictive_Maintenance/Classification_Learner/TypeFault/Surface_5';
fileName = 'featureTable.mat';

if isfile(fileName)
    disp('Load featureTable from local file...');
    load('/MATLAB Drive/Guam_Predictive_Maintenance/Classification_Learner/TypeFault/Surface_5/featureTable.mat');
else
    disp('Compute featureTable...');
    cd '/MATLAB Drive/Guam_Predictive_Maintenance/Classification_Learner/TypeFault/';
    [featureTable, outputTable] = diagnosticFeatures(tableSurface5);
    baseFolder = '/MATLAB Drive/Guam_Predictive_Maintenance/Classification_Learner/TypeFault/Surface_5/';
    fullFileName = fullfile(baseFolder, fileName);
    save(fullFileName, 'featureTable');
end
cd '/MATLAB Drive/Guam_Predictive_Maintenance/Classification_Learner/TypeFault/';
[trainTable, testTable] = splitFeatureTable(featureTable);
rank = 20;
[rankedFeatures, pValues, resultsTable] = anovaTest(featureTable, 'FaultCode');
selectedRankTable = resultsTable(1:rank, :);
trainTable = rankTable(trainTable, selectedRankTable);
testTable = rankTable(testTable, selectedRankTable);

% Training
cd '/MATLAB Drive/Guam_Predictive_Maintenance/Classification_Learner/TypeFault/Surface_5';
modelFileName = 'typeFaultModel.mat';
if isfile(modelFileName)
    disp('Load model from local file...');
    load('/MATLAB Drive/Guam_Predictive_Maintenance/Classification_Learner/TypeFault/Surface_5/typeFaultModel.mat');
else
    disp('Training model...');
    cd '/MATLAB Drive/Guam_Predictive_Maintenance/Classification_Learner/TypeFault/';
    [typeFaultModel, validationAccuracy] = trainClassifier(trainTable,selectedRankTable);
    fprintf('Validation Accuracy = %.2f%%\n', validationAccuracy * 100);
    baseFolder = '/MATLAB Drive/Guam_Predictive_Maintenance/Classification_Learner/TypeFault/Surface_5/';
    fullFileName = fullfile(baseFolder, modelFileName);
    save(fullFileName, 'typeFaultModel');
end

% Test 
cd '/MATLAB Drive/Guam_Predictive_Maintenance/Classification_Learner/TypeFault/';
predictedLabels = typeFaultModel.predictFcn(testTable);
trueLabels = testTable.FaultCode;
testAccuracy = sum(predictedLabels == trueLabels) / length(trueLabels);
fprintf('Test Accuracy = %.2f%%\n', testAccuracy * 100);
confMat = confusionmat(trueLabels, predictedLabels);
plotConfusionMatrix(confMat);