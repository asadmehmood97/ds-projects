# Biodiversity Analysis: Species Richness from 7 Taxonomic Groups

This project focuses on analyzing the species richness of seven taxonomic groups. The dataset used is "proportional_species_richness_V2.csv".

## Introduction

The project includes the following analyses:

1. **Univariate Analysis**: Examination of the distribution of species richness for each taxonomic group individually, including:
   - Vascular Plants
   - Isopods
   - Macromoths
   - Dominant Land Class
   - Easting
   - Northing
   
2. **Hypothesis Testing**: Application of statistical tests to investigate differences in species richness between taxonomic groups, including:
   - T-Test for Two Independent Samples
   - Wilcoxon Signed-Rank Test for Paired Samples

3. **Linear Regression**:
   - Simple Linear Regression for BD7 vs. BD11 Overall and by Period
   - Multiple Linear Regression to predict BD4 using the species richness of all seven taxonomic groups
   
4. **Feature Selection**:
   - Feature selection based on p-values and AIC through stepwise backward elimination

5. **Open Analysis**:
   - Linear regression of BD7 and BD4 against the "period" variable to explore temporal trends in species richness.

## Taxonomic Groups Analyzed

The following taxonomic groups were analyzed:
- Bees
- Bryophytes
- Carabids
- Isopods
- Ladybirds
- Macromoths
- Vascular Plants

## Instructions

To run the analysis:

1. Load the dataset "proportional_species_richness_V2.csv" into your working environment.
2. Execute the provided R code in your preferred R environment.
3. Ensure that all required R packages are installed.

## File Structure

- `proportional_species_richness_V2.csv`: Dataset containing species richness data.
- `README.md`: Overview of the project, analyses conducted, and taxonomic groups analyzed.
- `project-code.R`: Contains the R code for data analysis, hypothesis testing, regression modeling, and feature selection.

## Notes

- Interpret the results obtained from the analyses to gain insights into the species richness of the taxonomic groups studied.
- Modify the code and analyses as needed based on specific research questions or dataset characteristics.
