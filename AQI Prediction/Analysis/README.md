# **Forecasting Air Quality Index Utilizing Ensemble and Boosting Regression Models with Hyperparameter Tuning**

This project involves predicting the Air Quality Index (AQI) using various regression models. The dataset used is the "air-quality-dataset-India.csv".

## **Introduction**

The project follows the following steps:

1. **Data Loading**: The dataset containing air quality information is loaded into a pandas DataFrame.

2. **Exploratory Data Analysis & Data Preprocessing**: This step involves exploring the dataset to understand its structure and characteristics. Data preprocessing techniques such as handling missing values, normalization, and feature engineering are applied.

3. **Regression Modelling**: Several regression models are implemented to predict the AQI based on the preprocessed data. The following models are implemented:

    - Linear Regression
    - Lasso Regression
    - Ridge Regression
    - Random Forest Regressor
    - AdaBoost Regressor
    - Bagging Regressor
    - Extra Trees Regressor
    - Gradient Boosting Regressor

4. **Model Comparison**: The performance of each regression model is evaluated using the following evaluation metrics:

    - Mean Squared Error (MSE)
    - Root Mean Squared Error (RMSE)
    - Mean Absolute Error (MAE)
    - R-squared (R2)

## **Instructions**

To run the code:

1. Install the required Python packages listed in the `requirements.txt` file.
2. Ensure you have the dataset file "air-quality-dataset-India.csv" in the `Dataset` directory.
3. Run the Python script containing the code.

Ensure that Python is installed on your system and that you have access to the necessary dataset file.

## **File Structure**

- `Dataset/`: Directory containing the dataset file.
- `README.md`: Overview of the project, detailed steps, implemented models, and evaluation metrics.
- `requirements.txt`: File listing the required Python packages for running the code.
- `air-quality-index-prediction.ipynb`: Contains the code for data analysis, regression modelling, and model comparison.

## **Notes**

- Adjust parameters and configurations in the code as needed based on specific requirements or dataset characteristics.
- Interpret the results obtained from the regression models for insights into predicting the Air Quality Index.
