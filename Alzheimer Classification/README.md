# Alzheimer's Disease Data Analysis Project

## Overview
This project involves the analysis of a dataset containing various characteristics of individuals with Alzheimer's disease. The aim is to investigate the relationship between these characteristics and the diagnosis of Alzheimer's disease. The analysis is conducted using R, incorporating statistical techniques such as descriptive statistics, clustering algorithms, and logistic regression modeling.

## Main Tasks
1. **Descriptive Statistics Analysis**: Analyze the dataset using both graphical and numerical representations. Generate appropriate summary tables and graphs including boxplots, histograms, and scatterplots.
   
2. **Clustering Algorithms**: Implement clustering algorithms to identify patterns in the data and comment on the results.

3. **Logistic Regression Model**: Fit a logistic regression model to predict the diagnosis variable based on other characteristics. Describe the produced model and comment on its implications, considering feature importance.

4. **Cross Validation**: Use cross-validation techniques with logistic regression to predict the diagnosis variable and compare the results with the previous logistic regression model.

## Instructions
To replicate the analysis conducted in this project, follow these steps:

1. **Install Required Packages**:
   - Ensure you have R installed on your system.
   - Install the following R packages:
     ```R
     install.packages(c("tidyverse", "dplyr", "tidyr", "ggplot2", "GGally", "cluster", "factoextra", "caTools", "car", "glmnet", "caret"))
     ```

2. **Download the Dataset**:
   - Place the provided dataset `project_data.csv` in the project directory.

3. **Run the Code**:
   - Open R or RStudio.
   - Copy and paste the provided R code into your R environment.
   - Run each section of the code sequentially to conduct the analysis step by step.

4. **Review Results**:
   - Review the generated tables, graphs, and model summaries to understand the findings of the analysis.

5. **Report Generation**:
   - For the final report, compile the findings, interpretations, and visualizations into a PDF document as specified.

## Code Details
### Libraries Used:
- `tidyverse`, `dplyr`, `tidyr`, `ggplot2`, `GGally`, `cluster`, `factoextra`, `caTools`, `car`, `glmnet`, `caret`

### Functions and Techniques:
- Data preprocessing including conversion of categorical variables, removal of specific rows, and handling missing values.
- Descriptive statistics analysis including summary statistics, boxplots, histograms, and scatterplots.
- Implementation of clustering algorithms (K-Means, Hierarchical) with visualization.
- Fitting logistic regression models and evaluating model performance.
- Cross-validation techniques for model validation.

## Notes
- Ensure the dataset `project_data.csv` is formatted correctly and located in the project directory before running the code.
- This README provides an overview and instructions for replicating the analysis. Detailed explanations of the analysis techniques and interpretations of results should be included in the final report.
