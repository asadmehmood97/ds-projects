# **Optimization of Credit Risk Assessment through Advanced Machine Learning and Hyperparameter Tunning**

This project focuses on efficiently optimized multiple machine learning models for credit risk assessment with hyperparameter Tunning. It employs Decision Tree Classifier, Logistic Regression, and KNeighbors Classifier, Random Forest Classifier, CatBoost Classifier and XGBoost Classifier for classification tasks.

## **Introduction**

The project includes the following steps:

1. **Importing required libraries**
2. **Loading the dataset and performing an overview**
3. **Exploratory Data Analysis (EDA)**
4. **Data Preprocessing**:
   - Handling null values
   - Handling duplicate values
   - Handling outliers
   - Design Data Scalling Pipelines 
      * `OrdinalEncoder` and `MinMaxScaler` for Categorical Ordinal Variables
      * `OneHotEncoder` for Categorical Nominal Variables
      * `SimpleImputer` and `RobustScaler` for Numerical Features
      * Train Test Split and Feature's Transformation using `fit_transform()`.
5. **Machine learning model training and evaluation**:
   - Decision Tree Classifier
   - Logistic Regression
   - KNeighbors Classifier
   - Random Forest Classifier
   - XGBoost Classifier
   - CatBoost Classifier
6. **Model Optimization using Hyperparameter Tunning**:
   - Random Forest Classifier
   - XGBoost Classifier
   - CatBoost Classifier
7. **Model Comparison**: The performance of each regression model is evaluated using the following evaluation metrics:
   - Classification Report 
   - Confusion Matrix 
   - F1 Score
   - Roc Curve
   - Precision Recall Curve
8. **Feature Importance**

## **Instructions**

To run the analysis:

1. Ensure Python is installed on your system.
2. Install the required Python libraries using the `requirements.txt` file.
3. Execute the provided Python code in your preferred Python environment.
4. Load the dataset (assuming it's named "credit_risk_dataset.csv") into your working directory.

## **File Structure**

- `credit_risk_dataset.csv`: Dataset containing corona cases data.
- `README.md`: Overview of the project, steps performed, and instructions for running the analysis.
- `requirements.txt`: Text file containing a list of Python packages required to run the code.
- `project-code.ipynb`: Contains the code for data preprocessing and analysis.

## **Notes**

- Modify the code and analyses as needed based on specific requirements or dataset characteristics.
- Ensure that all required libraries are installed before running the code.
