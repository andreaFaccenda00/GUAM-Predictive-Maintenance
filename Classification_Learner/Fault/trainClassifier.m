function [trainedClassifier, validationAccuracy] = trainClassifier(trainingData, selectedRankTable)
% trainClassifier trains a Naive Bayes classifier using predictors selected
% from a ranking table.
%
% Inputs:
%   trainingData - A table containing the predictor and response columns.
%   selectedRankTable - A table that contains the selected features in the
%       'Feature' column.
%
% Output:
%   trainedClassifier - A struct containing the trained classifier and a
%       predict function.
%   validationAccuracy - The cross-validation accuracy as a percentage.

% Process the training data.
inputTable = trainingData;

% Extract the predictor features from the ranking table.
% Ensure that the Feature column is a cell array.
if ~iscell(selectedRankTable.Feature)
    predictorFeatures = cellstr(selectedRankTable.Feature);
else
    predictorFeatures = selectedRankTable.Feature;
end

% Construct predictorNames by including a fixed identifier column and the 
% features from the ranking table.
predictorNames = [{'EnsembleID_'}, predictorFeatures(:)'];

% Extract predictors and response.
predictors = inputTable(:, predictorNames);
response = inputTable.Fault;

% Assume the first predictor is categorical and the rest are numeric.
isCategoricalPredictor = [true, repmat(false, 1, numel(predictorFeatures))];
classNames = [0; 1];

% Build distribution names: use 'Kernel' for numeric and 'mvmn' for categorical.
distributionNames = repmat({'Kernel'}, 1, length(isCategoricalPredictor));
distributionNames(isCategoricalPredictor) = {'mvmn'};

% Train a Naive Bayes classifier.
if any(strcmp(distributionNames, 'Kernel'))
    classificationNaiveBayes = fitcnb(...
        predictors, ...
        response, ...
        'Kernel', 'Normal', ...
        'Support', 'Unbounded', ...
        'Standardize', true, ...
        'DistributionNames', distributionNames, ...
        'ClassNames', classNames);
else
    classificationNaiveBayes = fitcnb(...
        predictors, ...
        response, ...
        'DistributionNames', distributionNames, ...
        'ClassNames', classNames);
end

% Create the result struct with predict function.
predictorExtractionFcn = @(t) t(:, predictorNames);
naiveBayesPredictFcn = @(x) predict(classificationNaiveBayes, x);
trainedClassifier.predictFcn = @(x) naiveBayesPredictFcn(predictorExtractionFcn(x));

% Add additional fields to the result struct.
trainedClassifier.RequiredVariables = predictorNames;
trainedClassifier.ClassificationNaiveBayes = classificationNaiveBayes;
trainedClassifier.About = 'This struct is a trained model exported from Classification Learner R2024b.';
trainedClassifier.HowToPredict = sprintf(['To make predictions on a new table, T, use:\n' ...
    '  [yfit,scores] = c.predictFcn(T)\n' ...
    'replacing ''c'' with the name of this struct, e.g. ''trainedModel''.\n\n' ...
    'The table, T, must contain the variables returned by:\n' ...
    '  c.RequiredVariables\n' ...
    'Variable formats must match the original training data.']);

% Perform cross-validation.
partitionedModel = crossval(trainedClassifier.ClassificationNaiveBayes, 'KFold', 5);
[validationPredictions, validationScores] = kfoldPredict(partitionedModel);
validationAccuracy = 1 - kfoldLoss(partitionedModel, 'LossFun', 'ClassifError');
end
