# **Predictive Modeling of Energy Consumption with Recurrent Neural Network Time Series Models**

This project focuses on forecasting energy consumption using time series models, aiming to provide accurate predictions for future energy demand. By leveraging historical energy consumption data, various time series models are employed to analyze patterns, trends, and seasonality in the data, ultimately generating forecasts for future energy usage. It employs LSTM, and GRU for time series prediction.

## Introduction

The project includes the following steps:

1. **Importing required libraries**
2. **Loading the dataset and performing an overview**
3. **Exploratory Data Analysis (EDA)**
4. **Data Preprocessing**:
   - Ensure Appropriate Data Types
   - Handled Missing Values
   - Resample to Hourly Frequency
   - Features Scalling and Data Splitting
   - Sequance Generation
   - Reshapping 
5. **Recurrent Neural Networks**:
   - LOng Short Term Memory (LSTM)
   - Gated Recurrent Unit (GRU)
7. **Model Comparison**: The performance of each regression model is evaluated using the following evaluation metrics:
   - Mean Squared Error (MSE)
   - Mean Absolute Error (MAE)
   - R2 Score (Coefficient of Determination)

## Instructions

To run the analysis:

1. Ensure Python is installed on your system.
2. Install the required Python libraries using the `requirements.txt` file.
3. Execute the provided Python code in your preferred Python environment.
4. Load the dataset (assuming it's named "Dataset.zip") into your working directory.

## File Structure

- `Dataset.zip`: Dataset containing data, unzip it.
- `README.md`: Overview of the project, steps performed, and instructions for running the analysis.
- `requirements.txt`: Text file containing a list of Python packages required to run the code.
- `project-code.ipynb`: Contains the code for data preprocessing and analysis.

## Notes

- Modify the code and analyses as needed based on specific requirements or dataset characteristics.
- Ensure that all required libraries are installed before running the code.
