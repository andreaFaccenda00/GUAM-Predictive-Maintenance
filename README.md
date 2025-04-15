---

# ✈️ GUAM Predictive Maintenance – Fault Detection in Urban Air Mobility

**Predictive maintenance and fault detection system for a Generic Urban Air Mobility (GUAM) simulation.** This project uses **machine learning** to detect and classify control system faults in a simulated eVTOL (electric vertical take-off and landing) aircraft, helping enable early fault identification in Urban Air Mobility (UAM) operations.
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
  Generate a rich dataset of normal and faulty flight scenarios using GUAM. Simulated faults mimic real-world control surface anomalies.

- ⚙️ **Diagnostic Feature Extraction**  
  Extract key indicators (statistical features like RMS, peak, etc.) from flight signals to detect anomalies effectively.

- 🤖 **Machine Learning Models**  
  Train classifiers (LDA, SVM, Naive Bayes, Decision Trees, Neural Networks) for:
  - Fault detection (binary)
  - Faulty surface identification (multi-class)
  - Fault type classification (multi-class)

---

## 🗂️ Project Structure

```markdown
📁 Dataset/
├── RUNME.m                  → Main script to process GUAM simulation data
├── processTrajectory.m     → Extract features from a single flight
├── downSample.m            → Balance or reduce dataset size
├── dataTypeFault.m         → Encode fault types
├── checkSamples.m          → Sanity-check sample distribution

📁 Classification_Learner/
├── Fault/                  → Binary fault detection (normal vs. fault)
│   ├── featureTable.mat
│   ├── trainClassifier.m
│   ├── plotConfusionMatrix.m
│   └── faultModel.mat
│
├── Surface/                → Predict which control surface failed
│   ├── surfaceModel.mat
│   └── trainClassifier.m
│
├── TypeFault/              → Classify type of fault
│   ├── Surface_2/
│   └── Surface_5/
│
└── Cascade/                → Optional: cascade models (detection → type/location)
```

<details>
<summary><strong>📁 GUAM Simulation (Not Included)</strong></summary>

The GUAM simulator itself is not bundled due to size. To use it:

- Clone from [NASA’s GUAM GitHub](https://github.com/nasa/Generic-Urban-Air-Mobility-GUAM)
- Set up the model in MATLAB/Simulink
- Use it to generate raw SimOut flight data, then run `RUNME.m`

</details>

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
     Download `eVTOL_Data.mat` and place it in `Dataset/`
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
