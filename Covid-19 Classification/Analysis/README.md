# Covid-19 Cases Classification Using Ensemble Learning Classifiers & Artifical Neural Networks

This project focuses on classifying corona cases using ensemble learning classifiers. It employs Random Forest Classifier, Gradient Boosting Classifier, and Artificial Neural Network for classification tasks.

## Introduction

The project includes the following steps:

1. **Importing required libraries**
2. **Loading the dataset and performing an overview**
3. **Data cleaning**:
   - Handling null values
   - Dropping unnecessary columns
4. **Exploratory Data Analysis (EDA)**
5. **Data preprocessing**:
   - Encoding categorical variables
   - Extracting features and target
   - Addressing class imbalance using SMOTE
6. **Machine learning model training and evaluation**:
   - Random Forest Classifier
   - Gradient Boosting Classifier
   - Artificial Neural Network (ANN)
7. **Model Comparison**: The performance of each regression model is evaluated using the following evaluation metrics:
    - Classification Report 
    - Confusion Matrix 
    - F1 Score
    - Roc Curve

## Instructions

To run the analysis:

1. Ensure Python is installed on your system.
2. Install the required Python libraries using the `requirements.txt` file.
3. Execute the provided Python code in your preferred Python environment.
4. Load the corona dataset (assuming it's named "corona-dataset.csv") into your working directory.

## File Structure

- `corona-dataset.csv`: Dataset containing corona cases data.
- `README.md`: Overview of the project, steps performed, and instructions for running the analysis.
- `requirements.txt`: Text file containing a list of Python packages required to run the code.
- `covid_analysis.ipynb`: Contains the code for data preprocessing and analysis.

## Notes

- Modify the code and analyses as needed based on specific requirements or dataset characteristics.
- Ensure that all required libraries are installed before running the code.
