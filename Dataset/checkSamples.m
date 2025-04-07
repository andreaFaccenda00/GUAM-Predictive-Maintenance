function [totalSurface2, totalSurface2_fault0, totalSurface2_fault1, totalSurface2_fault2, totalSurface2_fault3, totalSurface2_fault8, ...
          totalSurface5, totalSurface5_fault0, totalSurface5_fault1, totalSurface5_fault2, totalSurface5_fault3, totalSurface5_fault8] = checkSamples(Data)
% checkSamples calculates the total number of time-series rows for each surface (2 and 5)
% and provides a breakdown by FaultCode (0, 1, 2, 3, and 8) for each surface.
%
%   For Surface 2:
%       totalSurface2         - Total rows for Surface 2.
%       totalSurface2_fault0  - Total rows for Surface 2 with FaultCode 0.
%       totalSurface2_fault1  - Total rows for Surface 2 with FaultCode 1.
%       totalSurface2_fault2  - Total rows for Surface 2 with FaultCode 2.
%       totalSurface2_fault3  - Total rows for Surface 2 with FaultCode 3.
%       totalSurface2_fault8  - Total rows for Surface 2 with FaultCode 8.
%
%   For Surface 5:
%       totalSurface5         - Total rows for Surface 5.
%       totalSurface5_fault0  - Total rows for Surface 5 with FaultCode 0.
%       totalSurface5_fault1  - Total rows for Surface 5 with FaultCode 1.
%       totalSurface5_fault2  - Total rows for Surface 5 with FaultCode 2.
%       totalSurface5_fault3  - Total rows for Surface 5 with FaultCode 3.
%       totalSurface5_fault8  - Total rows for Surface 5 with FaultCode 8.

totalSurface2 = 0;
totalSurface2_fault0 = 0;
totalSurface2_fault1 = 0;
totalSurface2_fault2 = 0;
totalSurface2_fault3 = 0;
totalSurface2_fault8 = 0;

totalSurface5 = 0;
totalSurface5_fault0 = 0;
totalSurface5_fault1 = 0;
totalSurface5_fault2 = 0;
totalSurface5_fault3 = 0;
totalSurface5_fault8 = 0;

for i = 1:height(Data)
    currentSurface = Data.Surface(i);    % Expected to be 2 or 5
    currentFaultCode = Data.FaultCode(i);  % FaultCode: 0, 1, 2, 3, or 8
    currentTimetable = Data.EngineCmd1{i};
    numTimetableRows = height(currentTimetable);
    
    if currentSurface == 2
        totalSurface2 = totalSurface2 + numTimetableRows;
        switch currentFaultCode
            case 0
                totalSurface2_fault0 = totalSurface2_fault0 + numTimetableRows;
            case 1
                totalSurface2_fault1 = totalSurface2_fault1 + numTimetableRows;
            case 2
                totalSurface2_fault2 = totalSurface2_fault2 + numTimetableRows;
            case 3
                totalSurface2_fault3 = totalSurface2_fault3 + numTimetableRows;
            case 8
                totalSurface2_fault8 = totalSurface2_fault8 + numTimetableRows;
        end
    elseif currentSurface == 5
        totalSurface5 = totalSurface5 + numTimetableRows;
        switch currentFaultCode
            case 0
                totalSurface5_fault0 = totalSurface5_fault0 + numTimetableRows;
            case 1
                totalSurface5_fault1 = totalSurface5_fault1 + numTimetableRows;
            case 2
                totalSurface5_fault2 = totalSurface5_fault2 + numTimetableRows;
            case 3
                totalSurface5_fault3 = totalSurface5_fault3 + numTimetableRows;
            case 8
                totalSurface5_fault8 = totalSurface5_fault8 + numTimetableRows;
        end
    end
end
end
