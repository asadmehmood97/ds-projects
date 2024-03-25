# MBTI Personality Predictor using Machine Learning and Natural Language Processing (NLP)

This project investigates the cognitive peculiarities and communicative patterns found in various MBTI personality types, as observed through individuals' most recent 50 tweets. We carefully analyze word choices, sentence structures, and preferred themes among different personality types to discover possible connections between MBTI typologies and communication styles. This endeavor is of great importance in understanding the effectiveness of the MBTI in predicting or categorizing behavioral tendencies. It employs Decision Tree Classifier, Logistic Regression, KNeighbors Classifier, Random Forest Classifier, Gradient Descent Classifier and XGBoost Classifier for classification tasks.

## Introduction

The project includes the following steps:

1. **Importing required libraries**
2. **Loading the dataset and performing an overview**
3. **Exploratory Data Analysis (EDA)**
4. **Data Preprocessing and Text Cleaning**:
   - Remove URL Links 
   - Keep the End of Sentence Characters
   - Strip Punctation
   - Remove Multiple Fullstops
   - Remove Special Characters
   - Lowercase Covertion of Text
   - Remove Repeating Words
   - Remove Very Short and Long Words
   - Remove MBTI Personality Words {'INFP' ,'INFJ', 'INTP', 'INTJ','ENTP', 'ENFP', 'ISTP', 'ISFP' ,'ENTJ',
                                    'ISTJ','ENFJ', 'ISFJ' ,'ESTP', 'ESFP' ,'ESFJ' ,'ESTJ'}
5. **Feature Engineering**:
   - Label Encoder
   - Count Vectorizer
   - Data Splitting (Training and Evaluation)
6. **Machine learning model training and evaluation**:
   - Logistic Regression
   - KNeighbors Classifier
   - Decision Tree Classifier
   - Random Forest Classifier
   - XGBoost Classifier
   - Gradient Descent Classifier
7. **Model Comparison**
8. **Classification across MBTI axis**:
   - Added Axis (IE, NS, TF, JP):  Assign 1 to each MBTI axis based on personality traits by calculating introverted/extroverted posts and exploring   MBTI personality indices.
   - Distribution Across Types Indicators
   - Data Preprocessing:
      - Lemmatization
      - Remove Stop Words
      - Binarizing
      - Text Cleaning
   - Feature Engineering:
      - CountVectorizer to obtain a matrix of token counts for the model
      - Transform the count matrix to a normalized tf or tf-idf representation using TfidfTransformer
      - Data Splitting (Training and Evaluation)
   - Machine Learning Model Training and Evaluation:
      - Logistic Regression
      - KNeighbors Classifier
      - Decision Tree Classifier
      - Random Forest Classifier
      - XGBoost Classifier
      - Gradient Descent Classifier
   - Model Comparison


## Instructions

To run the analysis:

1. Ensure Python is installed on your system.
2. Install the required Python libraries using the `requirements.txt` file.
3. Execute the provided Python code in your preferred Python environment.
4. Load the dataset (assuming it's named "twitter-mbit.csv") into your working directory.

## File Structure

- `twitter-mbit.csv`: Dataset containing twitter posts data.
- `README.md`: Overview of the project, steps performed, and instructions for running the analysis.
- `requirements.txt`: Text file containing a list of Python packages required to run the code.
- `project-code.ipynb`: Contains the code for data preprocessing and analysis.

## Notes

- Modify the code and analyses as needed based on specific requirements or dataset characteristics.
- Ensure that all required libraries are installed before running the code.
