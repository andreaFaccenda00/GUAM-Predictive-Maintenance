function [trainTable, testTable] = splitFeatureTable(ft)
% splitFeatureTable - Suddivide una feature table in training e test mantenendo
%                     il bilanciamento delle classi in Fault (0 e 1).
%
% Sintassi:
%   [trainTable, testTable] = splitFeatureTable(ft)
%
% Input:
%   ft - Feature table contenente almeno la colonna 'Fault'
%
% Output:
%   trainTable - Tabella per il training (90% dei dati bilanciati)
%   testTable  - Tabella per il test (10% dei dati bilanciati)
%
% La funzione esegue i seguenti passi:
%   1. Separa i dati per Fault=0 e Fault=1.
%   2. Esegue l'undersampling della classe maggioritaria in modo da avere
%      lo stesso numero di campioni per ciascuna classe.
%   3. Unisce i dati bilanciati e li mescola.
%   4. Suddivide in training (90%) e test (10%).

    % Verifica che la tabella contenga la colonna 'Fault'
    if ~any(strcmp(ft.Properties.VariableNames, 'Fault'))
        error('La feature table non contiene la colonna ''Fault''.');
    end

    % Separazione dei dati in base al valore di Fault
    % Assumiamo che Fault sia una variabile logica oppure 0/1.
    idxFault0 = ft.Fault == 0 | ft.Fault == false;
    idxFault1 = ft.Fault == 1 | ft.Fault == true;
    
    tableFault0 = ft(idxFault0, :);
    tableFault1 = ft(idxFault1, :);
    
    % Numero di campioni per ciascuna classe
    n0 = height(tableFault0);
    n1 = height(tableFault1);
    
    % Numero minimo di campioni fra le due classi
    minCount = min(n0, n1);
    
    % Imposta il seme per la generazione casuale (opzionale)
    rng('shuffle');
    
    % Selezione casuale di minCount campioni per ciascuna classe
    idx0 = randperm(n0, minCount);
    idx1 = randperm(n1, minCount);
    
    balancedFault0 = tableFault0(idx0, :);
    balancedFault1 = tableFault1(idx1, :);
    
    % Unisce le due tabelle bilanciate
    balancedTable = [balancedFault0; balancedFault1];
    
    % Mescola le righe della tabella bilanciata
    balancedTable = balancedTable(randperm(height(balancedTable)), :);
    
    % Calcola il numero di campioni per il training (90%)
    nTotal = height(balancedTable);
    nTrain = round(0.9 * nTotal);
    
    % Suddivide in training e test
    trainTable = balancedTable(1:nTrain, :);
    testTable  = balancedTable(nTrain+1:end, :);
end 