# GUAM Predictive Maintenance – Fault Detection in Urban Air Mobility

**Predictive maintenance and fault detection system for a Generic Urban Air Mobility (GUAM) simulation.** This project uses **machine learning** to detect and classify control system faults in a simulated eVTOL (electric vertical take-off and landing) aircraft, helping enable early fault identification in Urban Air Mobility (UAM) operations.

## Overview

Urban Air Mobility (UAM) vehicles (e.g. autonomous air taxis) require high reliability and **predictive maintenance** strategies to ensure safety. This project integrates the **NASA Generic UAM Simulation (GUAM)** – a MATLAB/Simulink-based eVTOL flight simulator – with machine learning techniques to detect anomalies and faults from flight data. We simulate various fault scenarios in the UAM vehicle’s control surfaces and actuators, extract diagnostic features from the flight telemetry, and train classifiers to **automatically identify faults** in real-time. The result is a proof-of-concept fault detection system that could warn of impending failures before they become critical, illustrating the potential of data-driven predictive maintenance in the UAM domain.

## Key Objectives and Contributions

- **Simulated Fault Dataset:** Generate a comprehensive dataset of simulated UAM flights under both normal conditions and a range of fault scenarios. Faults include control surface failures and other control system anomalies, injected on different aircraft control surfaces to mimic real failure modes. This dataset provides the training and testing data for our models.  
- **Diagnostic Feature Extraction:** Develop a feature extraction pipeline to identify **key indicators of faults** from raw simulation signals. We analyze the vehicle telemetry (e.g. control surface commands, sensor readings, vehicle states) to extract features (statistical metrics, signal characteristics like RMS, etc.) that correlate strongly with the presence of a fault. This step is critical to boost model accuracy by providing informative inputs.  
- **Machine Learning Fault Detection:** Train and evaluate multiple machine learning models for **fault detection and diagnosis**. The models learn to distinguish normal vs. faulty operation and further classify the **fault type** and the affected **control surface**. We experimented with various classifiers (Linear Discriminant Analysis, Naive Bayes, Support Vector Machines, decision trees, and Neural Networks) to compare their performance on this problem. The outcome is an optimized model that can detect faults with high accuracy and generalize to new flight scenarios, demonstrating an effective predictive maintenance approach for UAM vehicles.

## Project Structure

The repository is organized into two main components:

- **`Dataset/`** – Scripts for data generation and preprocessing from the GUAM simulator:
  - `RUNME.m` – Main script to orchestrate simulation data processing. It gathers flight simulation outputs for various fault scenarios and combines them into a structured dataset.
  - `processTrajectory.m` – Function to process a single simulated flight trajectory (reading simulation output files, extracting relevant signals and computing features).
  - `downSample.m` – Utility to down-sample or balance the dataset (useful for handling large simulation data and class imbalance).
  - `dataTypeFault.m`, `checkSamples.m` – Helper scripts for labeling data (e.g., encoding fault types, verifying sample counts per class) and sanity-checking the dataset composition.
  - *(Note: The actual GUAM simulation model and raw data files are not included in this repo due to size. Instead, these scripts assume you have run the GUAM simulator to produce output files for each scenario.)*

- **`Classification_Learner/`** – MATLAB code for training and evaluating the fault detection models, organized by classification task:
  - **`Fault/`** – Contains code and results for **fault detection (binary classification)** – determining if a flight had a fault or not. This includes the extracted feature table (`featureTable.mat`), scripts for feature ranking (`rankTable.m`, statistical tests) and training the fault classifier (`trainClassifier.m`). A saved model (`faultModel.mat`) and confusion matrix plotting script are provided.
  - **`Surface/`** – Contains code for **faulty control surface identification**. Given a fault has occurred, this multi-class classifier predicts *which control surface* (which actuator/surface) is failing. Includes feature data, training script, and a trained model (`surfaceModel.mat`).
  - **`TypeFault/`** – Contains code for **fault type classification**. Here the classifier distinguishes between different *failure modes* (types of faults, e.g. different kinds of control surface failures). This folder includes feature extraction and training scripts. (Subdirectories like `Surface_2/` and `Surface_5/` indicate analysis focused on specific surfaces in the simulation.)
  - **`Cascade/`** – (Optional) Contains an experimental **cascaded classification approach**, where fault detection and identification are performed in sequence. For example, a cascade might first detect if a fault exists, then trigger secondary classification to pinpoint the fault’s type or location. This folder can include combined workflows or additional analyses integrating the Fault, Surface, and Type classifiers.  

Each sub-folder in `Classification_Learner` includes MATLAB live scripts or functions for training the model, splitting data into training/validation sets (`splitFeatureTable.m`), visualizing confusion matrices, and assessing feature importance (e.g., via ANOVA or t-tests). The code is modular to allow experimenting with different algorithms and feature sets for each prediction task.

## Tools and Technologies

- **MATLAB** (R2023 or later) – Core development environment for simulation, data processing, and machine learning. Both the simulation and analysis are conducted within MATLAB/Simulink. Key MATLAB toolboxes used include:
  - *Simulink* – to run the GUAM vehicle simulation models (providing the physics-based flight data).
  - *Predictive Maintenance Toolbox / Statistics & Machine Learning Toolbox* – for signal processing, feature extraction (using apps like the Diagnostic Feature Designer), and training classifiers (e.g., Classification Learner or programmatic training functions).
- **NASA GUAM Simulation** – The *Generic Urban Air Mobility* simulator is an open-source MATLAB/Simulink framework provided by NASA for eVTOL aircraft dynamics. It was used to generate realistic flight data under various scenarios. *(See NASA’s GUAM repository for more details.)* The simulator provides the **SimIn/SimOut** interface: we configure fault injection scenarios (SimIn) and collect time-series output data (SimOut) for each flight.
- **Machine Learning Algorithms** – A variety of algorithms were applied using MATLAB’s ML tools: Linear Discriminant Analysis, Naive Bayes classifiers, Support Vector Machines (SVM), Decision Trees, Ensemble methods, and Neural Networks (multi-layer perceptron). This allowed us to benchmark simpler models against more complex ones for the fault detection task.

No external libraries beyond MATLAB’s built-in toolboxes are required. The project demonstrates a complete pipeline from simulation to ML within the MATLAB environment, which could be of interest to researchers and developers in aerospace prognostics and health management.

## Getting Started

To explore or replicate this project, follow these steps:

1. **Prerequisites:** Ensure you have MATLAB installed (with Simulink and relevant toolboxes mentioned above). If you plan to regenerate the simulation data, you will need access to the NASA GUAM simulation model. You can obtain GUAM from the [NASA GitHub repository](https://github.com/nasa/Generic-Urban-Air-Mobility-GUAM) and set it up in MATLAB.  
2. **Clone this Repository:** Download or clone `GUAM-Predictive-Maintenance` into your MATLAB workspace. Add the folders to your MATLAB path.  
3. **Generate/Prepare Dataset:** If you do not wish to regenerate the data, you can directly download the pre-processed dataset here:
👉 Download eVTOL_Data.mat
Place this file in the Dataset/ directory.
If you want to generate the dataset from scratch:
Run the GUAM simulator for the desired scenarios (configured in Dataset/RUNME.m).
Execute Dataset/RUNME.m – this will process simulation output files and produce eVTOL_Data.mat.
4. **Train and Evaluate Models:** Use the scripts in the `Classification_Learner` folder to train the classifiers on the dataset:
   - For example, to perform **fault detection**, navigate to `Classification_Learner/Fault/` and run **`trainClassifier.m`**. This will load the feature table, split it into training and test sets, train a classifier (you can adjust the algorithm in the script), and output performance metrics (confusion matrix, accuracy, etc.). You can similarly run the scripts in `Surface/` and `TypeFault/` for those classification tasks.  
   - Alternatively, you can load the provided trained models (e.g., `faultModel.mat`, `surfaceModel.mat`) and use them to predict on new data or inspect their properties. The **`plotConfusionMatrix.m`** scripts can be used to visualize the confusion matrices for each trained model on test data.  
5. **Experiment:** Feel free to modify the feature extraction or try different ML models. The code is organized to easily swap in different classifier types or perform feature selection. For instance, you might integrate a different neural network architecture or adjust which features are used, and then observe the impact on fault detection accuracy.

*(Note: This project is a simulation-based study. Deploying it in a real UAM vehicle would require additional steps like real sensor integration and real-time execution, but the workflow and learnings here form a foundation for such future work.)*
Sure! Here's the **"Results"** section written in English, formatted to fit seamlessly into your `README.md`, with a clean, markdown-friendly structure and a clear conclusion at the end.

---

## 🔍 Results

This section summarizes the performance of the developed predictive maintenance models based on simulated flight data from the GUAM environment. The classification tasks include fault detection, identification of the affected control surface, and classification of fault types. The dataset includes a wide range of injected failure modes across multiple flight trajectories.

### ✅ Fault Detection (Binary Classification)

The goal is to detect whether a fault has occurred during flight. Several classifiers were evaluated:

| Classifier              | Test Accuracy | Validation Accuracy | AUC (PR) |
|------------------------|---------------|---------------------|----------|
| **Kernel Naive Bayes** | **94.2%**     | 92.1%               | 0.987    |

---

### 🛠️ Faulty Surface Identification (Multi-Class Classification)

Given a detected fault, the next task is to determine which control surface was affected:

| Classifier              | Test Accuracy | Validation Accuracy | AUC (Surface 2 / 5) |
|------------------------|---------------|---------------------|---------------------|
| **Kernel Naive Bayes** | **91.5%**     | 92.7%               | 0.9817 / 0.9817     |

---

### ⚙️ Fault Type Classification

Each control surface can experience different types of faults. For surfaces 2 and 5, the classifier performance is:

#### Surface 2 – *Coarse Gaussian SVM*

- Test Accuracy: **61.8%**
- Validation Accuracy: **55.2%**
- AUC by Fault Type:  
  - Type 1: 0.776  
  - Type 2: 0.696  
  - Type 3: 0.802  
  - Type 8: 0.875  

#### Surface 5 – *Coarse Gaussian SVM*

- Test Accuracy: **69.5%**
- Validation Accuracy: **52.4%**
- AUC by Fault Type:  
  - Type 1: 0.560  
  - Type 2: 0.906  
  - Type 3: 0.806  
  - Type 8: 0.991  

---

### 📊 Most Informative Features

Diagnostic feature selection was performed using **T-Test** and **ANOVA**, identifying the most discriminative features:

- `SurfaceCmd_5 / RMS`
- `SurfaceCmd_2 / PeakValue`
- `SurfaceCmd_1 / PeakValue`
- `EngineCmd_9 / Shape Factor`

These features consistently ranked highest in separating faulty and normal conditions.

---

## 📌 Final Summary

The proposed system demonstrates strong potential for predictive maintenance in Urban Air Mobility applications. Among the tested models:

- **Fault detection** reached up to **94.2% accuracy**, enabling reliable identification of anomalies.
- **Fault localization** (surface identification) achieved **91.5% accuracy**.
- **Fault type classification** remains more challenging, with accuracy around **60–70%**, suggesting opportunities for future improvement.

These results confirm the **feasibility of using machine learning for early fault detection** in autonomous eVTOL vehicles, paving the way for smarter and safer urban flight systems.

---

## Conclusion

**GUAM-Predictive-Maintenance** provides a framework for applying machine learning to **aerospace predictive maintenance**. By leveraging a high-fidelity UAM simulator and data-driven modeling, we can detect faults early and classify their nature, potentially enabling proactive maintenance and improved safety in urban air mobility operations. Developers and researchers can use this repository as a starting point for further exploration, such as trying additional fault modes, refining feature extraction methods, or deploying the models in real-time simulations. We hope this project sparks further research into intelligent health monitoring for next-generation aerial vehicles.

