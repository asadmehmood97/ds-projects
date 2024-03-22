# Anomalous Behavior Detection in Bitcoin Blockchain: Comparative Analysis Using Machine Learning

## Overview
This project focuses on detecting anomalous behavior in the Bitcoin blockchain using various machine learning techniques. The comparative analysis involves methods such as Isolation Forest, K-Means clustering, Autoencoder, Gaussian Mixture Model (GMM), and One-Class Support Vector Machine (SVM). Each method is evaluated based on its ability to detect anomalies in the blockchain data.

## Requirements
- Python 3.x
- Libraries: `numpy`, `pandas`, `matplotlib`, `seaborn`, `scikit-learn`, `tensorflow`, `pytz`

## Dataset
The dataset used in this project is collected from `bigquery-public-data.bitcoin_blockchain.blocks` and `bigquery-public-data.bitcoin_blockchain.transactions`. It contains information about Bitcoin transactions, including the number of transactions, blocks, and output Satoshis.

## Code Structure
- **Data Loading and Preprocessing**: Load the dataset, merge relevant columns, and preprocess the data.
- **Exploratory Data Analysis (EDA)**: Visualize the distribution of key features such as Blocks, Transactions, and Output Satoshis.
- **Model Building and Evaluation**:
  - **Isolation Forest**: Detect anomalies using the Isolation Forest algorithm and visualize the results.
  - **K-Means Clustering**: Perform clustering analysis using K-Means and visualize the clusters.
  - **Autoencoder**: Implement an autoencoder model to detect anomalies and evaluate its performance.
  - **Gaussian Mixture Model (GMM)**: Train a GMM to identify anomalies in the data.
  - **One-Class SVM**: Use One-Class SVM for anomaly detection and evaluate its effectiveness.
- **Performance Evaluation**: Compare the performance of each method based on metrics such as F1-score, silhouette score, AIC, BIC, etc.
- **Anomaly Visualization**: Visualize detected anomalies in the blockchain data over time.

## Instructions
1. **Clone Repository**: Clone the project repository to your local machine.
2. **Install Dependencies**: Install the required Python libraries mentioned in the `requirements.txt` file.
3. **Run the Code**: Execute the Python script `anomaly_detection.py` to run the analysis.
4. **Review Results**: Examine the generated plots and evaluation metrics to understand the performance of each anomaly detection method.
5. **Interpretation**: Interpret the findings and insights from the analysis, considering the effectiveness of each method in detecting anomalies in the Bitcoin blockchain.

## Notes
- Ensure that the dataset files (`blocks.csv` and `transactions.csv`) are located in the `Dataset` directory before running the code.
- Experiment with different hyperparameters and algorithms to optimize anomaly detection performance.
- Detailed explanations of the analysis techniques and interpretations of results should be included in the final report or documentation.