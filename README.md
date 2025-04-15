---

# ✈️ GUAM Predictive Maintenance – Fault Detection in Urban Air Mobility

This project uses **machine learning** to detect and classify control system faults in a simulated eVTOL (electric vertical take-off and landing) aircraft, helping enable early fault identification in Urban Air Mobility (UAM) operations.

---

## 📚 Table of Contents
- [🚀 Overview](#-overview)
- [🎯 Key Objectives and Contributions](#-key-objectives-and-contributions)
- [🗂️ Project Structure](#-project-structure)
- [🧰 Tools and Technologies](#-tools-and-technologies)
- [🛠️ Getting Started](#-getting-started)
- [🔍 Results](#-results)
- [📌 Final Summary](#-final-summary)
- [✅ Conclusion](#-conclusion)

---

## 🚀 Overview

Urban Air Mobility (UAM) systems (like autonomous air taxis) must be highly reliable. This project integrates NASA's **GUAM eVTOL flight simulator** with **machine learning techniques** to detect control system faults in real-time. By analyzing flight telemetry data from simulations, the system:

- Detects faults
- Identifies affected control surfaces
- Classifies fault types

The result is a **proof-of-concept predictive maintenance framework** tailored for next-generation air mobility platforms.

---

## 🎯 Key Objectives and Contributions

- ✅ **Simulated Fault Dataset**  
  Generate a rich dataset of normal and faulty flight scenarios using GUAM. Simulated faults mimic real-world control surface anomalies. Faults include control surface failures and other control system anomalies, injected on different aircraft control surfaces to 
  mimic real failure modes. This dataset provides the training and testing data for our models. 

- ⚙️ **Diagnostic Feature Extraction**  
   Develop a feature extraction pipeline to identify **key indicators of faults** from raw simulation signals. We analyze the vehicle telemetry (e.g. control surface commands, sensor readings, vehicle states) to extract features (statistical metrics, signal 
   characteristics like RMS, etc.) that correlate strongly with the presence of a fault. This step is critical to boost model accuracy by providing informative inputs. 

- 🤖 **Machine Learning Models**
  Train and evaluate multiple machine learning models for **fault detection and diagnosis**. The models learn to distinguish normal vs. faulty operation and further classify the **fault type** and the affected **control surface**. We experimented with various 
  classifiers (Linear Discriminant Analysis, Naive Bayes, Support Vector Machines, decision trees, and Neural Networks) to compare their performance on this problem. The outcome is an optimized model that can detect faults with high accuracy and generalize to new 
  flight scenarios, demonstrating an effective predictive maintenance approach for UAM vehicles.
  Train classifiers (LDA, SVM, Naive Bayes, Decision Trees) for:
  - Fault detection (binary)
  - Faulty surface identification (multi-class)
  - Fault type classification (multi-class)

---

## 🗂️ Project Structure
The repository is organized into two main components:

- **Dataset/** – Scripts for data generation and preprocessing from the GUAM simulator:
  - RUNME.m – Main script to orchestrate simulation data processing. It gathers flight simulation outputs for various fault scenarios and combines them into a structured dataset.
  - processTrajectory.m – Function to process a single simulated flight trajectory (reading simulation output files, extracting relevant signals and computing features).
  - downSample.m – Utility to down-sample or balance the dataset (useful for handling large simulation data and class imbalance).
  - dataTypeFault.m, checkSamples.m – Helper scripts for labeling data (e.g., encoding fault types, verifying sample counts per class) and sanity-checking the dataset composition.
  - *(Note: The actual GUAM simulation model and raw data files are not included in this repo due to size. Instead, these scripts assume you have run the GUAM simulator to produce output files for each scenario.)*

- **Classification_Learner/** – MATLAB code for training and evaluating the fault detection models, organized by classification task:
  - **Fault/** – Contains code and results for **fault detection (binary classification)** – determining if a flight had a fault or not. This includes the extracted feature table (featureTable.mat), scripts for feature ranking (rankTable.m, statistical tests) and training the fault classifier (trainClassifier.m). A saved model (faultModel.mat) and confusion matrix plotting script are provided.
  - **Surface/** – Contains code for **faulty control surface identification**. Given a fault has occurred, this multi-class classifier predicts *which control surface* (which actuator/surface) is failing. Includes feature data, training script, and a trained model (surfaceModel.mat).
  - **TypeFault/** – Contains code for **fault type classification**. Here the classifier distinguishes between different *failure modes* (types of faults, e.g. different kinds of control surface failures). This folder includes feature extraction and training scripts. (Subdirectories like Surface_2/ and Surface_5/ indicate analysis focused on specific surfaces in the simulation.)
  - **Cascade/** – (Optional) Contains an experimental **cascaded classification approach**, where fault detection and identification are performed in sequence. For example, a cascade might first detect if a fault exists, then trigger secondary classification to pinpoint the fault’s type or location. This folder can include combined workflows or additional analyses integrating the Fault, Surface, and Type classifiers.  

Each sub-folder in Classification_Learner includes MATLAB live scripts or functions for training the model, splitting data into training/validation sets (splitFeatureTable.m), visualizing confusion matrices, and assessing feature importance (e.g., via ANOVA or t-tests). The code is modular to allow experimenting with different algorithms and feature sets for each prediction task.

```markdown
📁 Dataset/
├── RUNME.m                  
├── processTrajectory.m     
├── downSample.m            
├── dataTypeFault.m         
├── checkSamples.m          

📁 Classification_Learner/
├── Fault/                  
│   ├── featureTable.mat
│   ├── trainClassifier.m
│   ├── plotConfusionMatrix.m
│   └── faultModel.mat
│
├── Surface/                
│   ├── surfaceModel.mat
│   └── trainClassifier.m
│
├── TypeFault/              
│   ├── Surface_2/
│   └── Surface_5/
│
└── Cascade/                
```

---

## 🧰 Tools and Technologies

- **MATLAB (R2023+)**  
  - Simulink (for GUAM simulation)  
  - Statistics & Machine Learning Toolbox  
  - Predictive Maintenance Toolbox

- **NASA GUAM**  
  Open-source high-fidelity eVTOL simulator developed by NASA. Simulates control systems, sensor feedback, and actuator behavior.

- **Machine Learning Models Used**  
  - Kernel Naive Bayes  
  - Linear Discriminant Analysis (LDA)  
  - Support Vector Machines (SVM)  
  - Decision Trees / Ensembles 

---

## 🛠️ Getting Started

1. **Install MATLAB + Toolboxes**
   - Required: Simulink, Predictive Maintenance Toolbox, Machine Learning Toolbox

2. **Clone this Repository**
   ```bash
   git clone https://github.com/your-username/GUAM-Predictive-Maintenance
   ```

3. **Prepare Dataset**
   - Option 1: **Use Preprocessed Data**  
     - Download [`eVTOL_Data.mat`](https://univpm-my.sharepoint.com/:u:/g/personal/s1119226_studenti_univpm_it/ESu7V-V7HcBDp-flhmTYx10BOWVegCdKfG4Gi9tD1fdLIw?e=Vs1TLv) and place it in `Dataset/`
   - Option 2: **Generate Your Own Data**
     - Set up the GUAM simulator and run scenarios
     - Execute: `RUNME.m`

4. **Train Models**
   - Navigate to folders like `Classification_Learner/Fault/`
   - Run `trainClassifier.m` to train and evaluate models
   - Use `plotConfusionMatrix.m` for visualization

5. **Experiment!**
   - Try new fault types or surfaces
   - Modify features or ML models
   - Extend to real-time inference (future work)

---

## 🔍 Results

Performance metrics for each classification task are summarized below.

### ✅ Fault Detection (Binary)

| Classifier              | Test Accuracy | Validation Accuracy | AUC (PR Curve) |
|------------------------|---------------|---------------------|----------------|
| **Kernel Naive Bayes** | **94.2%**     | 92.1%               | 0.987          |

---

### 🛠️ Faulty Surface Identification (Multi-Class)

| Classifier              | Test Accuracy | Validation Accuracy | AUC (Surface 2 / 5) |
|------------------------|---------------|---------------------|---------------------|
| **Kernel Naive Bayes** | **91.5%**     | 92.7%               | 0.9817 / 0.9817     |

---

### ⚙️ Fault Type Classification

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

Top-ranked by ANOVA and T-Test:

- `SurfaceCmd_5 / RMS`
- `SurfaceCmd_2 / PeakValue`
- `SurfaceCmd_1 / PeakValue`
- `EngineCmd_9 / Shape Factor`

---

## 📌 Final Summary

| Task                         | Accuracy        | Notes                             |
|------------------------------|-----------------|-----------------------------------|
| Fault Detection              | **94.2%**       | High binary classification performance  
| Surface Identification       | **91.5%**       | Multi-class localization is reliable  
| Fault Type Classification    | ~60–70%         | More challenging – improvement opportunity  

The framework demonstrates the potential of **ML-driven predictive maintenance** for UAM safety and autonomy.

---

## ✅ Conclusion

**GUAM-Predictive-Maintenance** provides a complete end-to-end example of how simulation + ML can enable **intelligent fault detection** in autonomous air mobility systems. With realistic flight data, a modular ML workflow, and strong detection accuracy, this work lays the foundation for:

- Real-time health monitoring
- Automated fault response
- Safer urban aviation operations

🔧 Developers and researchers are encouraged to expand on this by integrating additional fault modes, refining the feature pipeline, or testing on real flight hardware.

---
