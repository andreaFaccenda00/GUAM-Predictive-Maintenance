function [Data] = processTrajectoryFile(csvFile, fault_code, surface_type, Data)
    % Verifica se il file CSV esiste
    if ~isfile(csvFile)
        fprintf('File not found: %s. Skipping...\n', csvFile);
        return;
    end

    % Legge la tabella dal file CSV
    T = readtable(csvFile);
    T.Time = seconds(T.Time);
    TT = table2timetable(T, 'RowTimes', 'Time');
    TT.Time.Format = 'mm:ss.SSS';

    % Filtra le righe dove Fault è uguale a 1
    TT = TT(TT.Fault == 1, :);

    % Seleziona 200 righe consecutive a partire da un tempo intero
    % (ad esempio, da 63.000 a 64.000 secondi)
    timeSeconds = seconds(TT.Time);
    % Trova gli indici in cui il tempo è un numero intero (con tolleranza per errori numerici)
    idxWhole = find(abs(mod(timeSeconds, 1)) < 1e-6);
    % Verifica che esistano indici validi che consentano di prelevare 200 righe
    idxValid = idxWhole(idxWhole <= height(TT) - 200 + 1);
    if ~isempty(idxValid)
        % Scegli un indice casuale tra quelli validi
        startIdx = idxValid(randi(length(idxValid)));
        TT = TT(startIdx:startIdx+200-1, :);
    else
        warning('Nessun inizio di secondo intero trovato con almeno 200 righe. Verrà usata l''intera tabella filtrata.');
    end

    noiseAmp = 0.01;  
    noiseVars = {'Vtot', 'Omeg_BIb_x', 'Omeg_BIb_y', 'Omeg_BIb_z', ...
                 'Accel_bIb_x', 'Accel_bIb_y', 'Accel_bIb_z', ...
                 'Euler_phi', 'Euler_theta', 'Euler_psi', 'gamma', 'chi'};
    
    % Funzione interna per aggiungere rumore alle variabili specificate
    function tt = convertToTimeDataTableNoise(TT_segment, varName)
        data = TT_segment.(varName);
        if ismember(varName, noiseVars)
            data = data + noiseAmp * randn(size(data));
        end
        tt = timetable(TT_segment.Time, data, 'VariableNames', {'Data'});
    end

    % Funzione nidificata per processare la colonna Fault:
    % Se tutti i valori sono uguali (tutti 0 o tutti 1), restituisce il valore unico,
    % altrimenti restituisce l'intero vettore.
    function faultOut = processFaultColumn(faultVector)
        uniqueVals = unique(faultVector);
        if numel(uniqueVals) == 1
            faultOut = uniqueVals;  % Ritorna il singolo valore
        else
            faultOut = faultVector; % Ritorna l'intero vettore
        end
    end

    % Funzione anonima per creare la riga dei dati a partire dal blocco selezionato.
    % Vengono aggiunte le colonne 'Surface', 'FaultCode' e viene elaborata la colonna 'Fault'
    createDataRow = @(TT_segment, faultCode, surface) table(...
        {convertToTimeDataTableNoise(TT_segment, 'EngineCmd1')}, {convertToTimeDataTableNoise(TT_segment, 'EngineCmd2')}, ...
        {convertToTimeDataTableNoise(TT_segment, 'EngineCmd3')}, {convertToTimeDataTableNoise(TT_segment, 'EngineCmd4')}, ...
        {convertToTimeDataTableNoise(TT_segment, 'EngineCmd5')}, {convertToTimeDataTableNoise(TT_segment, 'EngineCmd6')}, ...
        {convertToTimeDataTableNoise(TT_segment, 'EngineCmd7')}, {convertToTimeDataTableNoise(TT_segment, 'EngineCmd8')}, ...
        {convertToTimeDataTableNoise(TT_segment, 'EngineCmd9')}, ...
        {convertToTimeDataTableNoise(TT_segment, 'CtrlSurfaceCmd_1')}, {convertToTimeDataTableNoise(TT_segment, 'CtrlSurfaceCmd_2')}, ...
        {convertToTimeDataTableNoise(TT_segment, 'CtrlSurfaceCmd_3')}, {convertToTimeDataTableNoise(TT_segment, 'CtrlSurfaceCmd_4')}, ...
        {convertToTimeDataTableNoise(TT_segment, 'CtrlSurfaceCmd_5')}, ...
        {convertToTimeDataTableNoise(TT_segment, 'Vtot')}, ...
        {convertToTimeDataTableNoise(TT_segment, 'Omeg_BIb_x')}, {convertToTimeDataTableNoise(TT_segment, 'Omeg_BIb_y')}, {convertToTimeDataTableNoise(TT_segment, 'Omeg_BIb_z')}, ...
        {convertToTimeDataTableNoise(TT_segment, 'Accel_bIb_x')}, {convertToTimeDataTableNoise(TT_segment, 'Accel_bIb_y')}, {convertToTimeDataTableNoise(TT_segment, 'Accel_bIb_z')}, ...
        {convertToTimeDataTableNoise(TT_segment, 'Euler_phi')}, {convertToTimeDataTableNoise(TT_segment, 'Euler_theta')}, {convertToTimeDataTableNoise(TT_segment, 'Euler_psi')}, ...
        {convertToTimeDataTableNoise(TT_segment, 'gamma')}, {convertToTimeDataTableNoise(TT_segment, 'chi')}, ...
        surface, faultCode, processFaultColumn(TT_segment.Fault), ...
        'VariableNames', ...
        {'EngineCmd1','EngineCmd2','EngineCmd3','EngineCmd4','EngineCmd5','EngineCmd6','EngineCmd7','EngineCmd8','EngineCmd9', ...
         'SurfaceCmd_1','SurfaceCmd_2','SurfaceCmd_3','SurfaceCmd_4','SurfaceCmd_5', ...
         'Vtot', ...
         'Omega_x','Omega_y','Omega_z', ...
         'Accel_x','Accel_y','Accel_z', ...
         'Euler_phi','Euler_theta','Euler_psi', ...
         'Gamma','Chi','Surface','FaultCode','Fault'});
   
    % Crea la riga dati a partire dal blocco di 200 righe selezionato
    row = createDataRow(TT, fault_code, surface_type);
    Data = [Data; row];
end
