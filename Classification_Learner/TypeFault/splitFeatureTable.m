function [trainTable, testTable] = splitFeatureTable(ft)

    % Verifica che la tabella contenga la colonna 'FaultCode'
    if ~any(strcmp(ft.Properties.VariableNames, 'FaultCode'))
        error('La feature table non contiene la colonna ''FaultCode''.');
    end

    % Definisce i FaultCode da bilanciare
    faultCodes = [1, 2, 3, 8];

    % Inizializza cell array e vettore per memorizzare le tabelle e il numero di campioni
    tables = cell(length(faultCodes), 1);
    counts = zeros(length(faultCodes), 1);
    
    % Estrae i dati per ogni FaultCode e ne conta i campioni
    for i = 1:length(faultCodes)
        code = faultCodes(i);
        idx = ft.FaultCode == code;
        tables{i} = ft(idx, :);
        counts(i) = height(tables{i});
    end
    
    % Determina il numero minimo di campioni tra le classi
    minCount = min(counts);
    
    % Imposta il seme per la generazione casuale (opzionale)
    rng('shuffle');
    
    % Esegue l'undersampling per ciascun FaultCode
    balancedTables = cell(length(faultCodes), 1);
    for i = 1:length(faultCodes)
        nSamples = height(tables{i});
        idxRand = randperm(nSamples, minCount);
        balancedTables{i} = tables{i}(idxRand, :);
    end
    
    % Unisce le tabelle bilanciate
    balancedTable = vertcat(balancedTables{:});
    
    % Mescola le righe della tabella bilanciata
    balancedTable = balancedTable(randperm(height(balancedTable)), :);
    
    % Calcola il numero di campioni per il training (90%)
    nTotal = height(balancedTable);
    nTrain = round(0.9 * nTotal);
    
    % Suddivide in training e test
    trainTable = balancedTable(1:nTrain, :);
    testTable  = balancedTable(nTrain+1:end, :);
end
