function finalLabel = cascadeClassifier(newData)
    % Fase 1: Estrazione delle feature per Fault
    cd('/MATLAB Drive/Guam_Predictive_Maintenance/Classification_Learner/Fault');
    load('faultModel.mat', 'faultModel');
    faultFeature = diagnosticFeatures(newData);
    faultPrediction = faultModel.predictFcn(faultFeature);
    
    % Fase 2: Se viene rilevato un fault, procedi con l'analisi della Surface
    if faultPrediction == 1
        cd('/MATLAB Drive/Guam_Predictive_Maintenance/Classification_Learner/Surface');
        load('surfaceModel.mat', 'surfaceModel');
        surfaceFeature = diagnosticFeatures(newData);
        surfacePrediction = surfaceModel.predictFcn(surfaceFeature);
        
        % Fase 3: Determina la tipologia di guasto in base alla superficie
        cd('/MATLAB Drive/Guam_Predictive_Maintenance/Classification_Learner/TypeFault');
        typeFeature = diagnosticFeatures(newData);
        if surfacePrediction == 2
            cd('Surface_2');
            load('typeFaultModel.mat', 'typeFaultModel');
        else
            cd('Surface_5');
            load('typeFaultModel.mat', 'typeFaultModel');
        end
        typeFaultPrediction = typeFaultModel.predictFcn(typeFeature);
        
        % Mappatura dei valori di typeFaultPrediction a stringhe descrittive
        switch typeFaultPrediction
            case 1
                faultTypeStr = 'Hold last';
            case 2
                faultTypeStr = 'Pre scale';
            case 3
                faultTypeStr = 'Post scale';
            case 8
                faultTypeStr = 'Control reversal';
            otherwise
                faultTypeStr = num2str(typeFaultPrediction);
        end
        
        finalLabel = sprintf('Guasto %s alla superficie %d', faultTypeStr, surfacePrediction);
        disp(finalLabel);
    else
        finalLabel = 'No fault detected';
        disp(finalLabel);
    end
end
