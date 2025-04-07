function [trainTable, testTable] = splitFeatureTable(ft)
% splitFeatureTable - Suddivide una feature table in training e test mantenendo
%                     il bilanciamento delle classi in Surface (2 e 5).
%
% Sintassi:
%   [trainTable, testTable] = splitFeatureTable(ft)
%
% Input:
%   ft - Feature table contenente almeno la colonna 'Surface'
%
% Output:
%   trainTable - Tabella per il training (90% dei dati bilanciati)
%   testTable  - Tabella per il test (10% dei dati bilanciati)
%
% La funzione esegue i seguenti passi:
%   1. Separa i dati per Surface=2 e Surface=5.
%   2. Esegue l'undersampling della classe maggioritaria in modo da avere
%      lo stesso numero di campioni per ciascuna classe.
%   3. Unisce i dati bilanciati e li mescola.
%   4. Suddivide in training (90%) e test (10%).

    % Verifica che la tabella contenga la colonna 'Surface'
    if ~any(strcmp(ft.Properties.VariableNames, 'Surface'))
        error('La feature table non contiene la colonna ''Surface''.');
    end

    % Separazione dei dati in base al valore di Surface
    idxSurface2 = ft.Surface == 2;
    idxSurface5 = ft.Surface == 5;
    
    tableSurface2 = ft(idxSurface2, :);
    tableSurface5 = ft(idxSurface5, :);
    
    % Numero di campioni per ciascuna classe
    n2 = height(tableSurface2);
    n5 = height(tableSurface5);
    
    % Numero minimo di campioni fra le due classi
    minCount = min(n2, n5);
    
    % Imposta il seme per la generazione casuale (opzionale)
    rng('shuffle');
    
    % Selezione casuale di minCount campioni per ciascuna classe
    idx2 = randperm(n2, minCount);
    idx5 = randperm(n5, minCount);
    
    balancedSurface2 = tableSurface2(idx2, :);
    balancedSurface5 = tableSurface5(idx5, :);
    
    % Unisce le due tabelle bilanciate
    balancedTable = [balancedSurface2; balancedSurface5];
    
    % Mescola le righe della tabella bilanciata
    balancedTable = balancedTable(randperm(height(balancedTable)), :);
    
    % Calcola il numero di campioni per il training (90%)
    nTotal = height(balancedTable);
    nTrain = round(0.9 * nTotal);
    
    % Suddivide in training e test
    trainTable = balancedTable(1:nTrain, :);
    testTable  = balancedTable(nTrain+1:end, :);
end
