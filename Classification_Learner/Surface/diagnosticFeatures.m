function [featureTable,outputTable] = diagnosticFeatures(inputData)
%DIAGNOSTICFEATURES recreates results in Diagnostic Feature Designer.
%
% Input:
%  inputData: A table or a cell array of tables/matrices containing the
%  data as those imported into the app.
%
% Output:
%  featureTable: A table containing all features and condition variables.
%  outputTable: A table containing the computation results.
%
% This function computes features:
%  EngineCmd1_sigstats/ClearanceFactor
%  EngineCmd1_sigstats/CrestFactor
%  EngineCmd1_sigstats/ImpulseFactor
%  EngineCmd1_sigstats/Kurtosis
%  EngineCmd1_sigstats/Mean
%  EngineCmd1_sigstats/PeakValue
%  EngineCmd1_sigstats/RMS
%  EngineCmd1_sigstats/SINAD
%  EngineCmd1_sigstats/SNR
%  EngineCmd1_sigstats/ShapeFactor
%  EngineCmd1_sigstats/Skewness
%  EngineCmd1_sigstats/Std
%  EngineCmd1_sigstats/THD
%  EngineCmd2_sigstats/ClearanceFactor
%  EngineCmd2_sigstats/CrestFactor
%  EngineCmd2_sigstats/ImpulseFactor
%  EngineCmd2_sigstats/Kurtosis
%  EngineCmd2_sigstats/Mean
%  EngineCmd2_sigstats/PeakValue
%  EngineCmd2_sigstats/RMS
%  EngineCmd2_sigstats/SINAD
%  EngineCmd2_sigstats/SNR
%  EngineCmd2_sigstats/ShapeFactor
%  EngineCmd2_sigstats/Skewness
%  EngineCmd2_sigstats/Std
%  EngineCmd2_sigstats/THD
%  EngineCmd3_sigstats/ClearanceFactor
%  EngineCmd3_sigstats/CrestFactor
%  EngineCmd3_sigstats/ImpulseFactor
%  EngineCmd3_sigstats/Kurtosis
%  EngineCmd3_sigstats/Mean
%  EngineCmd3_sigstats/PeakValue
%  EngineCmd3_sigstats/RMS
%  EngineCmd3_sigstats/SINAD
%  EngineCmd3_sigstats/SNR
%  EngineCmd3_sigstats/ShapeFactor
%  EngineCmd3_sigstats/Skewness
%  EngineCmd3_sigstats/Std
%  EngineCmd3_sigstats/THD
%  EngineCmd4_sigstats/ClearanceFactor
%  EngineCmd4_sigstats/CrestFactor
%  EngineCmd4_sigstats/ImpulseFactor
%  EngineCmd4_sigstats/Kurtosis
%  EngineCmd4_sigstats/Mean
%  EngineCmd4_sigstats/PeakValue
%  EngineCmd4_sigstats/RMS
%  EngineCmd4_sigstats/SINAD
%  EngineCmd4_sigstats/SNR
%  EngineCmd4_sigstats/ShapeFactor
%  EngineCmd4_sigstats/Skewness
%  EngineCmd4_sigstats/Std
%  EngineCmd4_sigstats/THD
%  EngineCmd5_sigstats/ClearanceFactor
%  EngineCmd5_sigstats/CrestFactor
%  EngineCmd5_sigstats/ImpulseFactor
%  EngineCmd5_sigstats/Kurtosis
%  EngineCmd5_sigstats/Mean
%  EngineCmd5_sigstats/PeakValue
%  EngineCmd5_sigstats/RMS
%  EngineCmd5_sigstats/SINAD
%  EngineCmd5_sigstats/SNR
%  EngineCmd5_sigstats/ShapeFactor
%  EngineCmd5_sigstats/Skewness
%  EngineCmd5_sigstats/Std
%  EngineCmd5_sigstats/THD
%  EngineCmd6_sigstats/ClearanceFactor
%  EngineCmd6_sigstats/CrestFactor
%  EngineCmd6_sigstats/ImpulseFactor
%  EngineCmd6_sigstats/Kurtosis
%  EngineCmd6_sigstats/Mean
%  EngineCmd6_sigstats/PeakValue
%  EngineCmd6_sigstats/RMS
%  EngineCmd6_sigstats/SINAD
%  EngineCmd6_sigstats/SNR
%  EngineCmd6_sigstats/ShapeFactor
%  EngineCmd6_sigstats/Skewness
%  EngineCmd6_sigstats/Std
%  EngineCmd6_sigstats/THD
%  EngineCmd7_sigstats/ClearanceFactor
%  EngineCmd7_sigstats/CrestFactor
%  EngineCmd7_sigstats/ImpulseFactor
%  EngineCmd7_sigstats/Kurtosis
%  EngineCmd7_sigstats/Mean
%  EngineCmd7_sigstats/PeakValue
%  EngineCmd7_sigstats/RMS
%  EngineCmd7_sigstats/SINAD
%  EngineCmd7_sigstats/SNR
%  EngineCmd7_sigstats/ShapeFactor
%  EngineCmd7_sigstats/Skewness
%  EngineCmd7_sigstats/Std
%  EngineCmd7_sigstats/THD
%  EngineCmd8_sigstats/ClearanceFactor
%  EngineCmd8_sigstats/CrestFactor
%  EngineCmd8_sigstats/ImpulseFactor
%  EngineCmd8_sigstats/Kurtosis
%  EngineCmd8_sigstats/Mean
%  EngineCmd8_sigstats/PeakValue
%  EngineCmd8_sigstats/RMS
%  EngineCmd8_sigstats/SINAD
%  EngineCmd8_sigstats/SNR
%  EngineCmd8_sigstats/ShapeFactor
%  EngineCmd8_sigstats/Skewness
%  EngineCmd8_sigstats/Std
%  EngineCmd8_sigstats/THD
%  EngineCmd9_sigstats/ClearanceFactor
%  EngineCmd9_sigstats/CrestFactor
%  EngineCmd9_sigstats/ImpulseFactor
%  EngineCmd9_sigstats/Kurtosis
%  EngineCmd9_sigstats/Mean
%  EngineCmd9_sigstats/PeakValue
%  EngineCmd9_sigstats/RMS
%  EngineCmd9_sigstats/SINAD
%  EngineCmd9_sigstats/SNR
%  EngineCmd9_sigstats/ShapeFactor
%  EngineCmd9_sigstats/Skewness
%  EngineCmd9_sigstats/Std
%  EngineCmd9_sigstats/THD
%  SurfaceCmd_1_sigstats/ClearanceFactor
%  SurfaceCmd_1_sigstats/CrestFactor
%  SurfaceCmd_1_sigstats/ImpulseFactor
%  SurfaceCmd_1_sigstats/Kurtosis
%  SurfaceCmd_1_sigstats/Mean
%  SurfaceCmd_1_sigstats/PeakValue
%  SurfaceCmd_1_sigstats/RMS
%  SurfaceCmd_1_sigstats/SINAD
%  SurfaceCmd_1_sigstats/SNR
%  SurfaceCmd_1_sigstats/ShapeFactor
%  SurfaceCmd_1_sigstats/Skewness
%  SurfaceCmd_1_sigstats/Std
%  SurfaceCmd_1_sigstats/THD
%  SurfaceCmd_2_sigstats/ClearanceFactor
%  SurfaceCmd_2_sigstats/CrestFactor
%  SurfaceCmd_2_sigstats/ImpulseFactor
%  SurfaceCmd_2_sigstats/Kurtosis
%  SurfaceCmd_2_sigstats/Mean
%  SurfaceCmd_2_sigstats/PeakValue
%  SurfaceCmd_2_sigstats/RMS
%  SurfaceCmd_2_sigstats/SINAD
%  SurfaceCmd_2_sigstats/SNR
%  SurfaceCmd_2_sigstats/ShapeFactor
%  SurfaceCmd_2_sigstats/Skewness
%  SurfaceCmd_2_sigstats/Std
%  SurfaceCmd_2_sigstats/THD
%  SurfaceCmd_3_sigstats/ClearanceFactor
%  SurfaceCmd_3_sigstats/CrestFactor
%  SurfaceCmd_3_sigstats/ImpulseFactor
%  SurfaceCmd_3_sigstats/Kurtosis
%  SurfaceCmd_3_sigstats/Mean
%  SurfaceCmd_3_sigstats/PeakValue
%  SurfaceCmd_3_sigstats/RMS
%  SurfaceCmd_3_sigstats/SINAD
%  SurfaceCmd_3_sigstats/SNR
%  SurfaceCmd_3_sigstats/ShapeFactor
%  SurfaceCmd_3_sigstats/Skewness
%  SurfaceCmd_3_sigstats/Std
%  SurfaceCmd_3_sigstats/THD
%  SurfaceCmd_4_sigstats/ClearanceFactor
%  SurfaceCmd_4_sigstats/CrestFactor
%  SurfaceCmd_4_sigstats/ImpulseFactor
%  SurfaceCmd_4_sigstats/Kurtosis
%  SurfaceCmd_4_sigstats/Mean
%  SurfaceCmd_4_sigstats/PeakValue
%  SurfaceCmd_4_sigstats/RMS
%  SurfaceCmd_4_sigstats/SINAD
%  SurfaceCmd_4_sigstats/SNR
%  SurfaceCmd_4_sigstats/ShapeFactor
%  SurfaceCmd_4_sigstats/Skewness
%  SurfaceCmd_4_sigstats/Std
%  SurfaceCmd_4_sigstats/THD
%  SurfaceCmd_5_sigstats/ClearanceFactor
%  SurfaceCmd_5_sigstats/CrestFactor
%  SurfaceCmd_5_sigstats/ImpulseFactor
%  SurfaceCmd_5_sigstats/Kurtosis
%  SurfaceCmd_5_sigstats/Mean
%  SurfaceCmd_5_sigstats/PeakValue
%  SurfaceCmd_5_sigstats/RMS
%  SurfaceCmd_5_sigstats/SINAD
%  SurfaceCmd_5_sigstats/SNR
%  SurfaceCmd_5_sigstats/ShapeFactor
%  SurfaceCmd_5_sigstats/Skewness
%  SurfaceCmd_5_sigstats/Std
%  SurfaceCmd_5_sigstats/THD
%  Vtot_sigstats/ClearanceFactor
%  Vtot_sigstats/CrestFactor
%  Vtot_sigstats/ImpulseFactor
%  Vtot_sigstats/Kurtosis
%  Vtot_sigstats/Mean
%  Vtot_sigstats/PeakValue
%  Vtot_sigstats/RMS
%  Vtot_sigstats/SINAD
%  Vtot_sigstats/SNR
%  Vtot_sigstats/ShapeFactor
%  Vtot_sigstats/Skewness
%  Vtot_sigstats/Std
%  Vtot_sigstats/THD
%  Omega_x_sigstats/ClearanceFactor
%  Omega_x_sigstats/CrestFactor
%  Omega_x_sigstats/ImpulseFactor
%  Omega_x_sigstats/Kurtosis
%  Omega_x_sigstats/Mean
%  Omega_x_sigstats/PeakValue
%  Omega_x_sigstats/RMS
%  Omega_x_sigstats/SINAD
%  Omega_x_sigstats/SNR
%  Omega_x_sigstats/ShapeFactor
%  Omega_x_sigstats/Skewness
%  Omega_x_sigstats/Std
%  Omega_x_sigstats/THD
%  Omega_y_sigstats/ClearanceFactor
%  Omega_y_sigstats/CrestFactor
%  Omega_y_sigstats/ImpulseFactor
%  Omega_y_sigstats/Kurtosis
%  Omega_y_sigstats/Mean
%  Omega_y_sigstats/PeakValue
%  Omega_y_sigstats/RMS
%  Omega_y_sigstats/SINAD
%  Omega_y_sigstats/SNR
%  Omega_y_sigstats/ShapeFactor
%  Omega_y_sigstats/Skewness
%  Omega_y_sigstats/Std
%  Omega_y_sigstats/THD
%  Omega_z_sigstats/ClearanceFactor
%  Omega_z_sigstats/CrestFactor
%  Omega_z_sigstats/ImpulseFactor
%  Omega_z_sigstats/Kurtosis
%  Omega_z_sigstats/Mean
%  Omega_z_sigstats/PeakValue
%  Omega_z_sigstats/RMS
%  Omega_z_sigstats/SINAD
%  Omega_z_sigstats/SNR
%  Omega_z_sigstats/ShapeFactor
%  Omega_z_sigstats/Skewness
%  Omega_z_sigstats/Std
%  Omega_z_sigstats/THD
%  Accel_x_sigstats/ClearanceFactor
%  Accel_x_sigstats/CrestFactor
%  Accel_x_sigstats/ImpulseFactor
%  Accel_x_sigstats/Kurtosis
%  Accel_x_sigstats/Mean
%  Accel_x_sigstats/PeakValue
%  Accel_x_sigstats/RMS
%  Accel_x_sigstats/SINAD
%  Accel_x_sigstats/SNR
%  Accel_x_sigstats/ShapeFactor
%  Accel_x_sigstats/Skewness
%  Accel_x_sigstats/Std
%  Accel_x_sigstats/THD
%  Accel_y_sigstats/ClearanceFactor
%  Accel_y_sigstats/CrestFactor
%  Accel_y_sigstats/ImpulseFactor
%  Accel_y_sigstats/Kurtosis
%  Accel_y_sigstats/Mean
%  Accel_y_sigstats/PeakValue
%  Accel_y_sigstats/RMS
%  Accel_y_sigstats/SINAD
%  Accel_y_sigstats/SNR
%  Accel_y_sigstats/ShapeFactor
%  Accel_y_sigstats/Skewness
%  Accel_y_sigstats/Std
%  Accel_y_sigstats/THD
%  Accel_z_sigstats/ClearanceFactor
%  Accel_z_sigstats/CrestFactor
%  Accel_z_sigstats/ImpulseFactor
%  Accel_z_sigstats/Kurtosis
%  Accel_z_sigstats/Mean
%  Accel_z_sigstats/PeakValue
%  Accel_z_sigstats/RMS
%  Accel_z_sigstats/SINAD
%  Accel_z_sigstats/SNR
%  Accel_z_sigstats/ShapeFactor
%  Accel_z_sigstats/Skewness
%  Accel_z_sigstats/Std
%  Accel_z_sigstats/THD
%  Euler_phi_sigstats/ClearanceFactor
%  Euler_phi_sigstats/CrestFactor
%  Euler_phi_sigstats/ImpulseFactor
%  Euler_phi_sigstats/Kurtosis
%  Euler_phi_sigstats/Mean
%  Euler_phi_sigstats/PeakValue
%  Euler_phi_sigstats/RMS
%  Euler_phi_sigstats/SINAD
%  Euler_phi_sigstats/SNR
%  Euler_phi_sigstats/ShapeFactor
%  Euler_phi_sigstats/Skewness
%  Euler_phi_sigstats/Std
%  Euler_phi_sigstats/THD
%  Euler_theta_sigstats/ClearanceFactor
%  Euler_theta_sigstats/CrestFactor
%  Euler_theta_sigstats/ImpulseFactor
%  Euler_theta_sigstats/Kurtosis
%  Euler_theta_sigstats/Mean
%  Euler_theta_sigstats/PeakValue
%  Euler_theta_sigstats/RMS
%  Euler_theta_sigstats/SINAD
%  Euler_theta_sigstats/SNR
%  Euler_theta_sigstats/ShapeFactor
%  Euler_theta_sigstats/Skewness
%  Euler_theta_sigstats/Std
%  Euler_theta_sigstats/THD
%  Euler_psi_sigstats/ClearanceFactor
%  Euler_psi_sigstats/CrestFactor
%  Euler_psi_sigstats/ImpulseFactor
%  Euler_psi_sigstats/Kurtosis
%  Euler_psi_sigstats/Mean
%  Euler_psi_sigstats/PeakValue
%  Euler_psi_sigstats/RMS
%  Euler_psi_sigstats/SINAD
%  Euler_psi_sigstats/SNR
%  Euler_psi_sigstats/ShapeFactor
%  Euler_psi_sigstats/Skewness
%  Euler_psi_sigstats/Std
%  Euler_psi_sigstats/THD
%  Gamma_sigstats/ClearanceFactor
%  Gamma_sigstats/CrestFactor
%  Gamma_sigstats/ImpulseFactor
%  Gamma_sigstats/Kurtosis
%  Gamma_sigstats/Mean
%  Gamma_sigstats/PeakValue
%  Gamma_sigstats/RMS
%  Gamma_sigstats/SINAD
%  Gamma_sigstats/SNR
%  Gamma_sigstats/ShapeFactor
%  Gamma_sigstats/Skewness
%  Gamma_sigstats/Std
%  Gamma_sigstats/THD
%  Chi_sigstats/ClearanceFactor
%  Chi_sigstats/CrestFactor
%  Chi_sigstats/ImpulseFactor
%  Chi_sigstats/Kurtosis
%  Chi_sigstats/Mean
%  Chi_sigstats/PeakValue
%  Chi_sigstats/RMS
%  Chi_sigstats/SINAD
%  Chi_sigstats/SNR
%  Chi_sigstats/ShapeFactor
%  Chi_sigstats/Skewness
%  Chi_sigstats/Std
%  Chi_sigstats/THD
%
% Frame Policy:
%  Frame name: FRM_1
%  Frame size: 1 seconds
%  Frame rate: 1 seconds
%
% Organization of the function:
% 1. Compute signals/spectra/features
% 2. Extract computed features into a table
%
% Modify the function to add or remove data processing, feature generation
% or ranking operations.

% Auto-generated by MATLAB on 27-Mar-2025 17:36:42

% Create output ensemble.
outputEnsemble = workspaceEnsemble(inputData,'DataVariables',["EngineCmd1";"EngineCmd2";"EngineCmd3";"EngineCmd4";"EngineCmd5";"EngineCmd6";"EngineCmd7";"EngineCmd8";"EngineCmd9";"SurfaceCmd_1";"SurfaceCmd_2";"SurfaceCmd_3";"SurfaceCmd_4";"SurfaceCmd_5";"Vtot";"Omega_x";"Omega_y";"Omega_z";"Accel_x";"Accel_y";"Accel_z";"Euler_phi";"Euler_theta";"Euler_psi";"Gamma";"Chi";"FaultCode";"Fault"],'ConditionVariables',"Surface");

% Reset the ensemble to read from the beginning of the ensemble.
reset(outputEnsemble);

% Append new frame policy name to DataVariables.
outputEnsemble.DataVariables = [outputEnsemble.DataVariables;"FRM_1"];

% Set SelectedVariables to select variables to read from the ensemble.
outputEnsemble.SelectedVariables = ["EngineCmd1","EngineCmd2","EngineCmd3","EngineCmd4","EngineCmd5","EngineCmd6","EngineCmd7","EngineCmd8","EngineCmd9","SurfaceCmd_1","SurfaceCmd_2","SurfaceCmd_3","SurfaceCmd_4","SurfaceCmd_5","Vtot","Omega_x","Omega_y","Omega_z","Accel_x","Accel_y","Accel_z","Euler_phi","Euler_theta","Euler_psi","Gamma","Chi"];

% Initialize a cell array to store all the results.
allMembersResult = {};

% Loop through all ensemble members to read and write data.
while hasdata(outputEnsemble)
    % Read one member.
    member = read(outputEnsemble);

    % Read signals.
    EngineCmd1_full = readMemberData(member,"EngineCmd1",["Time","Data"]);
    EngineCmd2_full = readMemberData(member,"EngineCmd2",["Time","Data"]);
    EngineCmd3_full = readMemberData(member,"EngineCmd3",["Time","Data"]);
    EngineCmd4_full = readMemberData(member,"EngineCmd4",["Time","Data"]);
    EngineCmd5_full = readMemberData(member,"EngineCmd5",["Time","Data"]);
    EngineCmd6_full = readMemberData(member,"EngineCmd6",["Time","Data"]);
    EngineCmd7_full = readMemberData(member,"EngineCmd7",["Time","Data"]);
    EngineCmd8_full = readMemberData(member,"EngineCmd8",["Time","Data"]);
    EngineCmd9_full = readMemberData(member,"EngineCmd9",["Time","Data"]);
    SurfaceCmd_1_full = readMemberData(member,"SurfaceCmd_1",["Time","Data"]);
    SurfaceCmd_2_full = readMemberData(member,"SurfaceCmd_2",["Time","Data"]);
    SurfaceCmd_3_full = readMemberData(member,"SurfaceCmd_3",["Time","Data"]);
    SurfaceCmd_4_full = readMemberData(member,"SurfaceCmd_4",["Time","Data"]);
    SurfaceCmd_5_full = readMemberData(member,"SurfaceCmd_5",["Time","Data"]);
    Vtot_full = readMemberData(member,"Vtot",["Time","Data"]);
    Omega_x_full = readMemberData(member,"Omega_x",["Time","Data"]);
    Omega_y_full = readMemberData(member,"Omega_y",["Time","Data"]);
    Omega_z_full = readMemberData(member,"Omega_z",["Time","Data"]);
    Accel_x_full = readMemberData(member,"Accel_x",["Time","Data"]);
    Accel_y_full = readMemberData(member,"Accel_y",["Time","Data"]);
    Accel_z_full = readMemberData(member,"Accel_z",["Time","Data"]);
    Euler_phi_full = readMemberData(member,"Euler_phi",["Time","Data"]);
    Euler_theta_full = readMemberData(member,"Euler_theta",["Time","Data"]);
    Euler_psi_full = readMemberData(member,"Euler_psi",["Time","Data"]);
    Gamma_full = readMemberData(member,"Gamma",["Time","Data"]);
    Chi_full = readMemberData(member,"Chi",["Time","Data"]);

    % Get the frame intervals.
    lowerBound = min([EngineCmd1_full.Time(1),EngineCmd2_full.Time(1),EngineCmd3_full.Time(1),EngineCmd4_full.Time(1),EngineCmd5_full.Time(1),EngineCmd6_full.Time(1),EngineCmd7_full.Time(1),EngineCmd8_full.Time(1),EngineCmd9_full.Time(1),SurfaceCmd_1_full.Time(1),SurfaceCmd_2_full.Time(1),SurfaceCmd_3_full.Time(1),SurfaceCmd_4_full.Time(1),SurfaceCmd_5_full.Time(1),Vtot_full.Time(1),Omega_x_full.Time(1),Omega_y_full.Time(1),Omega_z_full.Time(1),Accel_x_full.Time(1),Accel_y_full.Time(1),Accel_z_full.Time(1),Euler_phi_full.Time(1),Euler_theta_full.Time(1),Euler_psi_full.Time(1),Gamma_full.Time(1),Chi_full.Time(1)]);
    upperBound = max([EngineCmd1_full.Time(end),EngineCmd2_full.Time(end),EngineCmd3_full.Time(end),EngineCmd4_full.Time(end),EngineCmd5_full.Time(end),EngineCmd6_full.Time(end),EngineCmd7_full.Time(end),EngineCmd8_full.Time(end),EngineCmd9_full.Time(end),SurfaceCmd_1_full.Time(end),SurfaceCmd_2_full.Time(end),SurfaceCmd_3_full.Time(end),SurfaceCmd_4_full.Time(end),SurfaceCmd_5_full.Time(end),Vtot_full.Time(end),Omega_x_full.Time(end),Omega_y_full.Time(end),Omega_z_full.Time(end),Accel_x_full.Time(end),Accel_y_full.Time(end),Accel_z_full.Time(end),Euler_phi_full.Time(end),Euler_theta_full.Time(end),Euler_psi_full.Time(end),Gamma_full.Time(end),Chi_full.Time(end)]);
    fullIntervals = frameintervals([lowerBound upperBound],1,1,'FrameUnit',"seconds");
    intervals = fullIntervals;

    % Initialize a table to store frame results.
    frames = table;

    % Loop through all frame intervals and compute results.
    for ct = 1:height(intervals)
        % Get all input variables.
        EngineCmd1 = EngineCmd1_full(EngineCmd1_full.Time>=intervals{ct,1}&EngineCmd1_full.Time<intervals{ct,2},:);
        EngineCmd2 = EngineCmd2_full(EngineCmd2_full.Time>=intervals{ct,1}&EngineCmd2_full.Time<intervals{ct,2},:);
        EngineCmd3 = EngineCmd3_full(EngineCmd3_full.Time>=intervals{ct,1}&EngineCmd3_full.Time<intervals{ct,2},:);
        EngineCmd4 = EngineCmd4_full(EngineCmd4_full.Time>=intervals{ct,1}&EngineCmd4_full.Time<intervals{ct,2},:);
        EngineCmd5 = EngineCmd5_full(EngineCmd5_full.Time>=intervals{ct,1}&EngineCmd5_full.Time<intervals{ct,2},:);
        EngineCmd6 = EngineCmd6_full(EngineCmd6_full.Time>=intervals{ct,1}&EngineCmd6_full.Time<intervals{ct,2},:);
        EngineCmd7 = EngineCmd7_full(EngineCmd7_full.Time>=intervals{ct,1}&EngineCmd7_full.Time<intervals{ct,2},:);
        EngineCmd8 = EngineCmd8_full(EngineCmd8_full.Time>=intervals{ct,1}&EngineCmd8_full.Time<intervals{ct,2},:);
        EngineCmd9 = EngineCmd9_full(EngineCmd9_full.Time>=intervals{ct,1}&EngineCmd9_full.Time<intervals{ct,2},:);
        SurfaceCmd_1 = SurfaceCmd_1_full(SurfaceCmd_1_full.Time>=intervals{ct,1}&SurfaceCmd_1_full.Time<intervals{ct,2},:);
        SurfaceCmd_2 = SurfaceCmd_2_full(SurfaceCmd_2_full.Time>=intervals{ct,1}&SurfaceCmd_2_full.Time<intervals{ct,2},:);
        SurfaceCmd_3 = SurfaceCmd_3_full(SurfaceCmd_3_full.Time>=intervals{ct,1}&SurfaceCmd_3_full.Time<intervals{ct,2},:);
        SurfaceCmd_4 = SurfaceCmd_4_full(SurfaceCmd_4_full.Time>=intervals{ct,1}&SurfaceCmd_4_full.Time<intervals{ct,2},:);
        SurfaceCmd_5 = SurfaceCmd_5_full(SurfaceCmd_5_full.Time>=intervals{ct,1}&SurfaceCmd_5_full.Time<intervals{ct,2},:);
        Vtot = Vtot_full(Vtot_full.Time>=intervals{ct,1}&Vtot_full.Time<intervals{ct,2},:);
        Omega_x = Omega_x_full(Omega_x_full.Time>=intervals{ct,1}&Omega_x_full.Time<intervals{ct,2},:);
        Omega_y = Omega_y_full(Omega_y_full.Time>=intervals{ct,1}&Omega_y_full.Time<intervals{ct,2},:);
        Omega_z = Omega_z_full(Omega_z_full.Time>=intervals{ct,1}&Omega_z_full.Time<intervals{ct,2},:);
        Accel_x = Accel_x_full(Accel_x_full.Time>=intervals{ct,1}&Accel_x_full.Time<intervals{ct,2},:);
        Accel_y = Accel_y_full(Accel_y_full.Time>=intervals{ct,1}&Accel_y_full.Time<intervals{ct,2},:);
        Accel_z = Accel_z_full(Accel_z_full.Time>=intervals{ct,1}&Accel_z_full.Time<intervals{ct,2},:);
        Euler_phi = Euler_phi_full(Euler_phi_full.Time>=intervals{ct,1}&Euler_phi_full.Time<intervals{ct,2},:);
        Euler_theta = Euler_theta_full(Euler_theta_full.Time>=intervals{ct,1}&Euler_theta_full.Time<intervals{ct,2},:);
        Euler_psi = Euler_psi_full(Euler_psi_full.Time>=intervals{ct,1}&Euler_psi_full.Time<intervals{ct,2},:);
        Gamma = Gamma_full(Gamma_full.Time>=intervals{ct,1}&Gamma_full.Time<intervals{ct,2},:);
        Chi = Chi_full(Chi_full.Time>=intervals{ct,1}&Chi_full.Time<intervals{ct,2},:);

        % Initialize a table to store results for one frame interval.
        frame = intervals(ct,:);

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = EngineCmd1.Data;
            ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
            CrestFactor = peak2rms(inputSignal);
            ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            SINAD = sinad(inputSignal);
            SNR = snr(inputSignal);
            ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');
            THD = thd(inputSignal);

            % Concatenate signal features.
            featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,SINAD,SNR,ShapeFactor,Skewness,Std,THD];

            % Store computed features in a table.
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
            EngineCmd1_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,13);
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
            EngineCmd1_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({EngineCmd1_sigstats},'VariableNames',{'EngineCmd1_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = EngineCmd2.Data;
            ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
            CrestFactor = peak2rms(inputSignal);
            ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            SINAD = sinad(inputSignal);
            SNR = snr(inputSignal);
            ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');
            THD = thd(inputSignal);

            % Concatenate signal features.
            featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,SINAD,SNR,ShapeFactor,Skewness,Std,THD];

            % Store computed features in a table.
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
            EngineCmd2_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,13);
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
            EngineCmd2_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({EngineCmd2_sigstats},'VariableNames',{'EngineCmd2_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = EngineCmd3.Data;
            ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
            CrestFactor = peak2rms(inputSignal);
            ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            SINAD = sinad(inputSignal);
            SNR = snr(inputSignal);
            ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');
            THD = thd(inputSignal);

            % Concatenate signal features.
            featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,SINAD,SNR,ShapeFactor,Skewness,Std,THD];

            % Store computed features in a table.
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
            EngineCmd3_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,13);
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
            EngineCmd3_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({EngineCmd3_sigstats},'VariableNames',{'EngineCmd3_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = EngineCmd4.Data;
            ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
            CrestFactor = peak2rms(inputSignal);
            ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            SINAD = sinad(inputSignal);
            SNR = snr(inputSignal);
            ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');
            THD = thd(inputSignal);

            % Concatenate signal features.
            featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,SINAD,SNR,ShapeFactor,Skewness,Std,THD];

            % Store computed features in a table.
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
            EngineCmd4_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,13);
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
            EngineCmd4_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({EngineCmd4_sigstats},'VariableNames',{'EngineCmd4_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = EngineCmd5.Data;
            ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
            CrestFactor = peak2rms(inputSignal);
            ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            SINAD = sinad(inputSignal);
            SNR = snr(inputSignal);
            ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');
            THD = thd(inputSignal);

            % Concatenate signal features.
            featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,SINAD,SNR,ShapeFactor,Skewness,Std,THD];

            % Store computed features in a table.
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
            EngineCmd5_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,13);
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
            EngineCmd5_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({EngineCmd5_sigstats},'VariableNames',{'EngineCmd5_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = EngineCmd6.Data;
            ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
            CrestFactor = peak2rms(inputSignal);
            ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            SINAD = sinad(inputSignal);
            SNR = snr(inputSignal);
            ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');
            THD = thd(inputSignal);

            % Concatenate signal features.
            featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,SINAD,SNR,ShapeFactor,Skewness,Std,THD];

            % Store computed features in a table.
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
            EngineCmd6_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,13);
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
            EngineCmd6_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({EngineCmd6_sigstats},'VariableNames',{'EngineCmd6_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = EngineCmd7.Data;
            ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
            CrestFactor = peak2rms(inputSignal);
            ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            SINAD = sinad(inputSignal);
            SNR = snr(inputSignal);
            ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');
            THD = thd(inputSignal);

            % Concatenate signal features.
            featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,SINAD,SNR,ShapeFactor,Skewness,Std,THD];

            % Store computed features in a table.
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
            EngineCmd7_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,13);
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
            EngineCmd7_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({EngineCmd7_sigstats},'VariableNames',{'EngineCmd7_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = EngineCmd8.Data;
            ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
            CrestFactor = peak2rms(inputSignal);
            ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            SINAD = sinad(inputSignal);
            SNR = snr(inputSignal);
            ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');
            THD = thd(inputSignal);

            % Concatenate signal features.
            featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,SINAD,SNR,ShapeFactor,Skewness,Std,THD];

            % Store computed features in a table.
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
            EngineCmd8_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,13);
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
            EngineCmd8_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({EngineCmd8_sigstats},'VariableNames',{'EngineCmd8_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = EngineCmd9.Data;
            ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
            CrestFactor = peak2rms(inputSignal);
            ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            SINAD = sinad(inputSignal);
            SNR = snr(inputSignal);
            ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');
            THD = thd(inputSignal);

            % Concatenate signal features.
            featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,SINAD,SNR,ShapeFactor,Skewness,Std,THD];

            % Store computed features in a table.
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
            EngineCmd9_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,13);
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
            EngineCmd9_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({EngineCmd9_sigstats},'VariableNames',{'EngineCmd9_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = SurfaceCmd_1.Data;
            ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
            CrestFactor = peak2rms(inputSignal);
            ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            SINAD = sinad(inputSignal);
            SNR = snr(inputSignal);
            ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');
            THD = thd(inputSignal);

            % Concatenate signal features.
            featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,SINAD,SNR,ShapeFactor,Skewness,Std,THD];

            % Store computed features in a table.
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
            SurfaceCmd_1_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,13);
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
            SurfaceCmd_1_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({SurfaceCmd_1_sigstats},'VariableNames',{'SurfaceCmd_1_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = SurfaceCmd_2.Data;
            ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
            CrestFactor = peak2rms(inputSignal);
            ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            SINAD = sinad(inputSignal);
            SNR = snr(inputSignal);
            ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');
            THD = thd(inputSignal);

            % Concatenate signal features.
            featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,SINAD,SNR,ShapeFactor,Skewness,Std,THD];

            % Store computed features in a table.
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
            SurfaceCmd_2_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,13);
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
            SurfaceCmd_2_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({SurfaceCmd_2_sigstats},'VariableNames',{'SurfaceCmd_2_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = SurfaceCmd_3.Data;
            ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
            CrestFactor = peak2rms(inputSignal);
            ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            SINAD = sinad(inputSignal);
            SNR = snr(inputSignal);
            ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');
            THD = thd(inputSignal);

            % Concatenate signal features.
            featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,SINAD,SNR,ShapeFactor,Skewness,Std,THD];

            % Store computed features in a table.
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
            SurfaceCmd_3_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,13);
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
            SurfaceCmd_3_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({SurfaceCmd_3_sigstats},'VariableNames',{'SurfaceCmd_3_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = SurfaceCmd_4.Data;
            ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
            CrestFactor = peak2rms(inputSignal);
            ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            SINAD = sinad(inputSignal);
            SNR = snr(inputSignal);
            ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');
            THD = thd(inputSignal);

            % Concatenate signal features.
            featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,SINAD,SNR,ShapeFactor,Skewness,Std,THD];

            % Store computed features in a table.
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
            SurfaceCmd_4_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,13);
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
            SurfaceCmd_4_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({SurfaceCmd_4_sigstats},'VariableNames',{'SurfaceCmd_4_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = SurfaceCmd_5.Data;
            ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
            CrestFactor = peak2rms(inputSignal);
            ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            SINAD = sinad(inputSignal);
            SNR = snr(inputSignal);
            ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');
            THD = thd(inputSignal);

            % Concatenate signal features.
            featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,SINAD,SNR,ShapeFactor,Skewness,Std,THD];

            % Store computed features in a table.
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
            SurfaceCmd_5_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,13);
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
            SurfaceCmd_5_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({SurfaceCmd_5_sigstats},'VariableNames',{'SurfaceCmd_5_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = Vtot.Data;
            ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
            CrestFactor = peak2rms(inputSignal);
            ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            SINAD = sinad(inputSignal);
            SNR = snr(inputSignal);
            ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');
            THD = thd(inputSignal);

            % Concatenate signal features.
            featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,SINAD,SNR,ShapeFactor,Skewness,Std,THD];

            % Store computed features in a table.
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
            Vtot_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,13);
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
            Vtot_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({Vtot_sigstats},'VariableNames',{'Vtot_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = Omega_x.Data;
            ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
            CrestFactor = peak2rms(inputSignal);
            ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            SINAD = sinad(inputSignal);
            SNR = snr(inputSignal);
            ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');
            THD = thd(inputSignal);

            % Concatenate signal features.
            featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,SINAD,SNR,ShapeFactor,Skewness,Std,THD];

            % Store computed features in a table.
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
            Omega_x_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,13);
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
            Omega_x_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({Omega_x_sigstats},'VariableNames',{'Omega_x_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = Omega_y.Data;
            ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
            CrestFactor = peak2rms(inputSignal);
            ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            SINAD = sinad(inputSignal);
            SNR = snr(inputSignal);
            ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');
            THD = thd(inputSignal);

            % Concatenate signal features.
            featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,SINAD,SNR,ShapeFactor,Skewness,Std,THD];

            % Store computed features in a table.
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
            Omega_y_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,13);
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
            Omega_y_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({Omega_y_sigstats},'VariableNames',{'Omega_y_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = Omega_z.Data;
            ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
            CrestFactor = peak2rms(inputSignal);
            ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            SINAD = sinad(inputSignal);
            SNR = snr(inputSignal);
            ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');
            THD = thd(inputSignal);

            % Concatenate signal features.
            featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,SINAD,SNR,ShapeFactor,Skewness,Std,THD];

            % Store computed features in a table.
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
            Omega_z_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,13);
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
            Omega_z_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({Omega_z_sigstats},'VariableNames',{'Omega_z_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = Accel_x.Data;
            ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
            CrestFactor = peak2rms(inputSignal);
            ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            SINAD = sinad(inputSignal);
            SNR = snr(inputSignal);
            ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');
            THD = thd(inputSignal);

            % Concatenate signal features.
            featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,SINAD,SNR,ShapeFactor,Skewness,Std,THD];

            % Store computed features in a table.
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
            Accel_x_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,13);
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
            Accel_x_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({Accel_x_sigstats},'VariableNames',{'Accel_x_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = Accel_y.Data;
            ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
            CrestFactor = peak2rms(inputSignal);
            ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            SINAD = sinad(inputSignal);
            SNR = snr(inputSignal);
            ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');
            THD = thd(inputSignal);

            % Concatenate signal features.
            featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,SINAD,SNR,ShapeFactor,Skewness,Std,THD];

            % Store computed features in a table.
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
            Accel_y_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,13);
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
            Accel_y_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({Accel_y_sigstats},'VariableNames',{'Accel_y_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = Accel_z.Data;
            ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
            CrestFactor = peak2rms(inputSignal);
            ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            SINAD = sinad(inputSignal);
            SNR = snr(inputSignal);
            ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');
            THD = thd(inputSignal);

            % Concatenate signal features.
            featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,SINAD,SNR,ShapeFactor,Skewness,Std,THD];

            % Store computed features in a table.
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
            Accel_z_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,13);
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
            Accel_z_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({Accel_z_sigstats},'VariableNames',{'Accel_z_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = Euler_phi.Data;
            ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
            CrestFactor = peak2rms(inputSignal);
            ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            SINAD = sinad(inputSignal);
            SNR = snr(inputSignal);
            ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');
            THD = thd(inputSignal);

            % Concatenate signal features.
            featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,SINAD,SNR,ShapeFactor,Skewness,Std,THD];

            % Store computed features in a table.
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
            Euler_phi_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,13);
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
            Euler_phi_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({Euler_phi_sigstats},'VariableNames',{'Euler_phi_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = Euler_theta.Data;
            ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
            CrestFactor = peak2rms(inputSignal);
            ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            SINAD = sinad(inputSignal);
            SNR = snr(inputSignal);
            ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');
            THD = thd(inputSignal);

            % Concatenate signal features.
            featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,SINAD,SNR,ShapeFactor,Skewness,Std,THD];

            % Store computed features in a table.
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
            Euler_theta_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,13);
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
            Euler_theta_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({Euler_theta_sigstats},'VariableNames',{'Euler_theta_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = Euler_psi.Data;
            ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
            CrestFactor = peak2rms(inputSignal);
            ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            SINAD = sinad(inputSignal);
            SNR = snr(inputSignal);
            ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');
            THD = thd(inputSignal);

            % Concatenate signal features.
            featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,SINAD,SNR,ShapeFactor,Skewness,Std,THD];

            % Store computed features in a table.
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
            Euler_psi_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,13);
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
            Euler_psi_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({Euler_psi_sigstats},'VariableNames',{'Euler_psi_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = Gamma.Data;
            ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
            CrestFactor = peak2rms(inputSignal);
            ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            SINAD = sinad(inputSignal);
            SNR = snr(inputSignal);
            ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');
            THD = thd(inputSignal);

            % Concatenate signal features.
            featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,SINAD,SNR,ShapeFactor,Skewness,Std,THD];

            % Store computed features in a table.
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
            Gamma_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,13);
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
            Gamma_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({Gamma_sigstats},'VariableNames',{'Gamma_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = Chi.Data;
            ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
            CrestFactor = peak2rms(inputSignal);
            ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            SINAD = sinad(inputSignal);
            SNR = snr(inputSignal);
            ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');
            THD = thd(inputSignal);

            % Concatenate signal features.
            featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,SINAD,SNR,ShapeFactor,Skewness,Std,THD];

            % Store computed features in a table.
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
            Chi_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,13);
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
            Chi_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({Chi_sigstats},'VariableNames',{'Chi_sigstats'})];

        %% Concatenate frames.
        frames = [frames;frame]; %#ok<*AGROW>
    end
    % Append all member results to the cell array.
    memberResult = table({frames},'VariableNames',"FRM_1");
    allMembersResult = [allMembersResult; {memberResult}]; %#ok<AGROW>
end

% Write the results for all members to the ensemble.
writeToMembers(outputEnsemble,allMembersResult)

% Gather all features into a table.
selectedFeatureNames = ["FRM_1/EngineCmd1_sigstats/ClearanceFactor","FRM_1/EngineCmd1_sigstats/CrestFactor","FRM_1/EngineCmd1_sigstats/ImpulseFactor","FRM_1/EngineCmd1_sigstats/Kurtosis","FRM_1/EngineCmd1_sigstats/Mean","FRM_1/EngineCmd1_sigstats/PeakValue","FRM_1/EngineCmd1_sigstats/RMS","FRM_1/EngineCmd1_sigstats/SINAD","FRM_1/EngineCmd1_sigstats/SNR","FRM_1/EngineCmd1_sigstats/ShapeFactor","FRM_1/EngineCmd1_sigstats/Skewness","FRM_1/EngineCmd1_sigstats/Std","FRM_1/EngineCmd1_sigstats/THD","FRM_1/EngineCmd2_sigstats/ClearanceFactor","FRM_1/EngineCmd2_sigstats/CrestFactor","FRM_1/EngineCmd2_sigstats/ImpulseFactor","FRM_1/EngineCmd2_sigstats/Kurtosis","FRM_1/EngineCmd2_sigstats/Mean","FRM_1/EngineCmd2_sigstats/PeakValue","FRM_1/EngineCmd2_sigstats/RMS","FRM_1/EngineCmd2_sigstats/SINAD","FRM_1/EngineCmd2_sigstats/SNR","FRM_1/EngineCmd2_sigstats/ShapeFactor","FRM_1/EngineCmd2_sigstats/Skewness","FRM_1/EngineCmd2_sigstats/Std","FRM_1/EngineCmd2_sigstats/THD","FRM_1/EngineCmd3_sigstats/ClearanceFactor","FRM_1/EngineCmd3_sigstats/CrestFactor","FRM_1/EngineCmd3_sigstats/ImpulseFactor","FRM_1/EngineCmd3_sigstats/Kurtosis","FRM_1/EngineCmd3_sigstats/Mean","FRM_1/EngineCmd3_sigstats/PeakValue","FRM_1/EngineCmd3_sigstats/RMS","FRM_1/EngineCmd3_sigstats/SINAD","FRM_1/EngineCmd3_sigstats/SNR","FRM_1/EngineCmd3_sigstats/ShapeFactor","FRM_1/EngineCmd3_sigstats/Skewness","FRM_1/EngineCmd3_sigstats/Std","FRM_1/EngineCmd3_sigstats/THD","FRM_1/EngineCmd4_sigstats/ClearanceFactor","FRM_1/EngineCmd4_sigstats/CrestFactor","FRM_1/EngineCmd4_sigstats/ImpulseFactor","FRM_1/EngineCmd4_sigstats/Kurtosis","FRM_1/EngineCmd4_sigstats/Mean","FRM_1/EngineCmd4_sigstats/PeakValue","FRM_1/EngineCmd4_sigstats/RMS","FRM_1/EngineCmd4_sigstats/SINAD","FRM_1/EngineCmd4_sigstats/SNR","FRM_1/EngineCmd4_sigstats/ShapeFactor","FRM_1/EngineCmd4_sigstats/Skewness","FRM_1/EngineCmd4_sigstats/Std","FRM_1/EngineCmd4_sigstats/THD","FRM_1/EngineCmd5_sigstats/ClearanceFactor","FRM_1/EngineCmd5_sigstats/CrestFactor","FRM_1/EngineCmd5_sigstats/ImpulseFactor","FRM_1/EngineCmd5_sigstats/Kurtosis","FRM_1/EngineCmd5_sigstats/Mean","FRM_1/EngineCmd5_sigstats/PeakValue","FRM_1/EngineCmd5_sigstats/RMS","FRM_1/EngineCmd5_sigstats/SINAD","FRM_1/EngineCmd5_sigstats/SNR","FRM_1/EngineCmd5_sigstats/ShapeFactor","FRM_1/EngineCmd5_sigstats/Skewness","FRM_1/EngineCmd5_sigstats/Std","FRM_1/EngineCmd5_sigstats/THD","FRM_1/EngineCmd6_sigstats/ClearanceFactor","FRM_1/EngineCmd6_sigstats/CrestFactor","FRM_1/EngineCmd6_sigstats/ImpulseFactor","FRM_1/EngineCmd6_sigstats/Kurtosis","FRM_1/EngineCmd6_sigstats/Mean","FRM_1/EngineCmd6_sigstats/PeakValue","FRM_1/EngineCmd6_sigstats/RMS","FRM_1/EngineCmd6_sigstats/SINAD","FRM_1/EngineCmd6_sigstats/SNR","FRM_1/EngineCmd6_sigstats/ShapeFactor","FRM_1/EngineCmd6_sigstats/Skewness","FRM_1/EngineCmd6_sigstats/Std","FRM_1/EngineCmd6_sigstats/THD","FRM_1/EngineCmd7_sigstats/ClearanceFactor","FRM_1/EngineCmd7_sigstats/CrestFactor","FRM_1/EngineCmd7_sigstats/ImpulseFactor","FRM_1/EngineCmd7_sigstats/Kurtosis","FRM_1/EngineCmd7_sigstats/Mean","FRM_1/EngineCmd7_sigstats/PeakValue","FRM_1/EngineCmd7_sigstats/RMS","FRM_1/EngineCmd7_sigstats/SINAD","FRM_1/EngineCmd7_sigstats/SNR","FRM_1/EngineCmd7_sigstats/ShapeFactor","FRM_1/EngineCmd7_sigstats/Skewness","FRM_1/EngineCmd7_sigstats/Std","FRM_1/EngineCmd7_sigstats/THD","FRM_1/EngineCmd8_sigstats/ClearanceFactor","FRM_1/EngineCmd8_sigstats/CrestFactor","FRM_1/EngineCmd8_sigstats/ImpulseFactor","FRM_1/EngineCmd8_sigstats/Kurtosis","FRM_1/EngineCmd8_sigstats/Mean","FRM_1/EngineCmd8_sigstats/PeakValue","FRM_1/EngineCmd8_sigstats/RMS","FRM_1/EngineCmd8_sigstats/SINAD","FRM_1/EngineCmd8_sigstats/SNR","FRM_1/EngineCmd8_sigstats/ShapeFactor","FRM_1/EngineCmd8_sigstats/Skewness","FRM_1/EngineCmd8_sigstats/Std","FRM_1/EngineCmd8_sigstats/THD","FRM_1/EngineCmd9_sigstats/ClearanceFactor","FRM_1/EngineCmd9_sigstats/CrestFactor","FRM_1/EngineCmd9_sigstats/ImpulseFactor","FRM_1/EngineCmd9_sigstats/Kurtosis","FRM_1/EngineCmd9_sigstats/Mean","FRM_1/EngineCmd9_sigstats/PeakValue","FRM_1/EngineCmd9_sigstats/RMS","FRM_1/EngineCmd9_sigstats/SINAD","FRM_1/EngineCmd9_sigstats/SNR","FRM_1/EngineCmd9_sigstats/ShapeFactor","FRM_1/EngineCmd9_sigstats/Skewness","FRM_1/EngineCmd9_sigstats/Std","FRM_1/EngineCmd9_sigstats/THD","FRM_1/SurfaceCmd_1_sigstats/ClearanceFactor","FRM_1/SurfaceCmd_1_sigstats/CrestFactor","FRM_1/SurfaceCmd_1_sigstats/ImpulseFactor","FRM_1/SurfaceCmd_1_sigstats/Kurtosis","FRM_1/SurfaceCmd_1_sigstats/Mean","FRM_1/SurfaceCmd_1_sigstats/PeakValue","FRM_1/SurfaceCmd_1_sigstats/RMS","FRM_1/SurfaceCmd_1_sigstats/SINAD","FRM_1/SurfaceCmd_1_sigstats/SNR","FRM_1/SurfaceCmd_1_sigstats/ShapeFactor","FRM_1/SurfaceCmd_1_sigstats/Skewness","FRM_1/SurfaceCmd_1_sigstats/Std","FRM_1/SurfaceCmd_1_sigstats/THD","FRM_1/SurfaceCmd_2_sigstats/ClearanceFactor","FRM_1/SurfaceCmd_2_sigstats/CrestFactor","FRM_1/SurfaceCmd_2_sigstats/ImpulseFactor","FRM_1/SurfaceCmd_2_sigstats/Kurtosis","FRM_1/SurfaceCmd_2_sigstats/Mean","FRM_1/SurfaceCmd_2_sigstats/PeakValue","FRM_1/SurfaceCmd_2_sigstats/RMS","FRM_1/SurfaceCmd_2_sigstats/SINAD","FRM_1/SurfaceCmd_2_sigstats/SNR","FRM_1/SurfaceCmd_2_sigstats/ShapeFactor","FRM_1/SurfaceCmd_2_sigstats/Skewness","FRM_1/SurfaceCmd_2_sigstats/Std","FRM_1/SurfaceCmd_2_sigstats/THD","FRM_1/SurfaceCmd_3_sigstats/ClearanceFactor","FRM_1/SurfaceCmd_3_sigstats/CrestFactor","FRM_1/SurfaceCmd_3_sigstats/ImpulseFactor","FRM_1/SurfaceCmd_3_sigstats/Kurtosis","FRM_1/SurfaceCmd_3_sigstats/Mean","FRM_1/SurfaceCmd_3_sigstats/PeakValue","FRM_1/SurfaceCmd_3_sigstats/RMS","FRM_1/SurfaceCmd_3_sigstats/SINAD","FRM_1/SurfaceCmd_3_sigstats/SNR","FRM_1/SurfaceCmd_3_sigstats/ShapeFactor","FRM_1/SurfaceCmd_3_sigstats/Skewness","FRM_1/SurfaceCmd_3_sigstats/Std","FRM_1/SurfaceCmd_3_sigstats/THD","FRM_1/SurfaceCmd_4_sigstats/ClearanceFactor","FRM_1/SurfaceCmd_4_sigstats/CrestFactor","FRM_1/SurfaceCmd_4_sigstats/ImpulseFactor","FRM_1/SurfaceCmd_4_sigstats/Kurtosis","FRM_1/SurfaceCmd_4_sigstats/Mean","FRM_1/SurfaceCmd_4_sigstats/PeakValue","FRM_1/SurfaceCmd_4_sigstats/RMS","FRM_1/SurfaceCmd_4_sigstats/SINAD","FRM_1/SurfaceCmd_4_sigstats/SNR","FRM_1/SurfaceCmd_4_sigstats/ShapeFactor","FRM_1/SurfaceCmd_4_sigstats/Skewness","FRM_1/SurfaceCmd_4_sigstats/Std","FRM_1/SurfaceCmd_4_sigstats/THD","FRM_1/SurfaceCmd_5_sigstats/ClearanceFactor","FRM_1/SurfaceCmd_5_sigstats/CrestFactor","FRM_1/SurfaceCmd_5_sigstats/ImpulseFactor","FRM_1/SurfaceCmd_5_sigstats/Kurtosis","FRM_1/SurfaceCmd_5_sigstats/Mean","FRM_1/SurfaceCmd_5_sigstats/PeakValue","FRM_1/SurfaceCmd_5_sigstats/RMS","FRM_1/SurfaceCmd_5_sigstats/SINAD","FRM_1/SurfaceCmd_5_sigstats/SNR","FRM_1/SurfaceCmd_5_sigstats/ShapeFactor","FRM_1/SurfaceCmd_5_sigstats/Skewness","FRM_1/SurfaceCmd_5_sigstats/Std","FRM_1/SurfaceCmd_5_sigstats/THD","FRM_1/Vtot_sigstats/ClearanceFactor","FRM_1/Vtot_sigstats/CrestFactor","FRM_1/Vtot_sigstats/ImpulseFactor","FRM_1/Vtot_sigstats/Kurtosis","FRM_1/Vtot_sigstats/Mean","FRM_1/Vtot_sigstats/PeakValue","FRM_1/Vtot_sigstats/RMS","FRM_1/Vtot_sigstats/SINAD","FRM_1/Vtot_sigstats/SNR","FRM_1/Vtot_sigstats/ShapeFactor","FRM_1/Vtot_sigstats/Skewness","FRM_1/Vtot_sigstats/Std","FRM_1/Vtot_sigstats/THD","FRM_1/Omega_x_sigstats/ClearanceFactor","FRM_1/Omega_x_sigstats/CrestFactor","FRM_1/Omega_x_sigstats/ImpulseFactor","FRM_1/Omega_x_sigstats/Kurtosis","FRM_1/Omega_x_sigstats/Mean","FRM_1/Omega_x_sigstats/PeakValue","FRM_1/Omega_x_sigstats/RMS","FRM_1/Omega_x_sigstats/SINAD","FRM_1/Omega_x_sigstats/SNR","FRM_1/Omega_x_sigstats/ShapeFactor","FRM_1/Omega_x_sigstats/Skewness","FRM_1/Omega_x_sigstats/Std","FRM_1/Omega_x_sigstats/THD","FRM_1/Omega_y_sigstats/ClearanceFactor","FRM_1/Omega_y_sigstats/CrestFactor","FRM_1/Omega_y_sigstats/ImpulseFactor","FRM_1/Omega_y_sigstats/Kurtosis","FRM_1/Omega_y_sigstats/Mean","FRM_1/Omega_y_sigstats/PeakValue","FRM_1/Omega_y_sigstats/RMS","FRM_1/Omega_y_sigstats/SINAD","FRM_1/Omega_y_sigstats/SNR","FRM_1/Omega_y_sigstats/ShapeFactor","FRM_1/Omega_y_sigstats/Skewness","FRM_1/Omega_y_sigstats/Std","FRM_1/Omega_y_sigstats/THD","FRM_1/Omega_z_sigstats/ClearanceFactor","FRM_1/Omega_z_sigstats/CrestFactor","FRM_1/Omega_z_sigstats/ImpulseFactor","FRM_1/Omega_z_sigstats/Kurtosis","FRM_1/Omega_z_sigstats/Mean","FRM_1/Omega_z_sigstats/PeakValue","FRM_1/Omega_z_sigstats/RMS","FRM_1/Omega_z_sigstats/SINAD","FRM_1/Omega_z_sigstats/SNR","FRM_1/Omega_z_sigstats/ShapeFactor","FRM_1/Omega_z_sigstats/Skewness","FRM_1/Omega_z_sigstats/Std","FRM_1/Omega_z_sigstats/THD","FRM_1/Accel_x_sigstats/ClearanceFactor","FRM_1/Accel_x_sigstats/CrestFactor","FRM_1/Accel_x_sigstats/ImpulseFactor","FRM_1/Accel_x_sigstats/Kurtosis","FRM_1/Accel_x_sigstats/Mean","FRM_1/Accel_x_sigstats/PeakValue","FRM_1/Accel_x_sigstats/RMS","FRM_1/Accel_x_sigstats/SINAD","FRM_1/Accel_x_sigstats/SNR","FRM_1/Accel_x_sigstats/ShapeFactor","FRM_1/Accel_x_sigstats/Skewness","FRM_1/Accel_x_sigstats/Std","FRM_1/Accel_x_sigstats/THD","FRM_1/Accel_y_sigstats/ClearanceFactor","FRM_1/Accel_y_sigstats/CrestFactor","FRM_1/Accel_y_sigstats/ImpulseFactor","FRM_1/Accel_y_sigstats/Kurtosis","FRM_1/Accel_y_sigstats/Mean","FRM_1/Accel_y_sigstats/PeakValue","FRM_1/Accel_y_sigstats/RMS","FRM_1/Accel_y_sigstats/SINAD","FRM_1/Accel_y_sigstats/SNR","FRM_1/Accel_y_sigstats/ShapeFactor","FRM_1/Accel_y_sigstats/Skewness","FRM_1/Accel_y_sigstats/Std","FRM_1/Accel_y_sigstats/THD","FRM_1/Accel_z_sigstats/ClearanceFactor","FRM_1/Accel_z_sigstats/CrestFactor","FRM_1/Accel_z_sigstats/ImpulseFactor","FRM_1/Accel_z_sigstats/Kurtosis","FRM_1/Accel_z_sigstats/Mean","FRM_1/Accel_z_sigstats/PeakValue","FRM_1/Accel_z_sigstats/RMS","FRM_1/Accel_z_sigstats/SINAD","FRM_1/Accel_z_sigstats/SNR","FRM_1/Accel_z_sigstats/ShapeFactor","FRM_1/Accel_z_sigstats/Skewness","FRM_1/Accel_z_sigstats/Std","FRM_1/Accel_z_sigstats/THD","FRM_1/Euler_phi_sigstats/ClearanceFactor","FRM_1/Euler_phi_sigstats/CrestFactor","FRM_1/Euler_phi_sigstats/ImpulseFactor","FRM_1/Euler_phi_sigstats/Kurtosis","FRM_1/Euler_phi_sigstats/Mean","FRM_1/Euler_phi_sigstats/PeakValue","FRM_1/Euler_phi_sigstats/RMS","FRM_1/Euler_phi_sigstats/SINAD","FRM_1/Euler_phi_sigstats/SNR","FRM_1/Euler_phi_sigstats/ShapeFactor","FRM_1/Euler_phi_sigstats/Skewness","FRM_1/Euler_phi_sigstats/Std","FRM_1/Euler_phi_sigstats/THD","FRM_1/Euler_theta_sigstats/ClearanceFactor","FRM_1/Euler_theta_sigstats/CrestFactor","FRM_1/Euler_theta_sigstats/ImpulseFactor","FRM_1/Euler_theta_sigstats/Kurtosis","FRM_1/Euler_theta_sigstats/Mean","FRM_1/Euler_theta_sigstats/PeakValue","FRM_1/Euler_theta_sigstats/RMS","FRM_1/Euler_theta_sigstats/SINAD","FRM_1/Euler_theta_sigstats/SNR","FRM_1/Euler_theta_sigstats/ShapeFactor","FRM_1/Euler_theta_sigstats/Skewness","FRM_1/Euler_theta_sigstats/Std","FRM_1/Euler_theta_sigstats/THD","FRM_1/Euler_psi_sigstats/ClearanceFactor","FRM_1/Euler_psi_sigstats/CrestFactor","FRM_1/Euler_psi_sigstats/ImpulseFactor","FRM_1/Euler_psi_sigstats/Kurtosis","FRM_1/Euler_psi_sigstats/Mean","FRM_1/Euler_psi_sigstats/PeakValue","FRM_1/Euler_psi_sigstats/RMS","FRM_1/Euler_psi_sigstats/SINAD","FRM_1/Euler_psi_sigstats/SNR","FRM_1/Euler_psi_sigstats/ShapeFactor","FRM_1/Euler_psi_sigstats/Skewness","FRM_1/Euler_psi_sigstats/Std","FRM_1/Euler_psi_sigstats/THD","FRM_1/Gamma_sigstats/ClearanceFactor","FRM_1/Gamma_sigstats/CrestFactor","FRM_1/Gamma_sigstats/ImpulseFactor","FRM_1/Gamma_sigstats/Kurtosis","FRM_1/Gamma_sigstats/Mean","FRM_1/Gamma_sigstats/PeakValue","FRM_1/Gamma_sigstats/RMS","FRM_1/Gamma_sigstats/SINAD","FRM_1/Gamma_sigstats/SNR","FRM_1/Gamma_sigstats/ShapeFactor","FRM_1/Gamma_sigstats/Skewness","FRM_1/Gamma_sigstats/Std","FRM_1/Gamma_sigstats/THD","FRM_1/Chi_sigstats/ClearanceFactor","FRM_1/Chi_sigstats/CrestFactor","FRM_1/Chi_sigstats/ImpulseFactor","FRM_1/Chi_sigstats/Kurtosis","FRM_1/Chi_sigstats/Mean","FRM_1/Chi_sigstats/PeakValue","FRM_1/Chi_sigstats/RMS","FRM_1/Chi_sigstats/SINAD","FRM_1/Chi_sigstats/SNR","FRM_1/Chi_sigstats/ShapeFactor","FRM_1/Chi_sigstats/Skewness","FRM_1/Chi_sigstats/Std","FRM_1/Chi_sigstats/THD"];
featureTable = readFeatureTable(outputEnsemble,"FRM_1",'Features',selectedFeatureNames,'ConditionVariables',outputEnsemble.ConditionVariables,'IncludeMemberID',true);

% Set SelectedVariables to select variables to read from the ensemble.
outputEnsemble.SelectedVariables = unique([outputEnsemble.DataVariables;outputEnsemble.ConditionVariables;outputEnsemble.IndependentVariables],'stable');

% Gather results into a table.
if nargout > 1
    outputTable = readall(outputEnsemble);
end
end
