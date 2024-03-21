## Bees, Bryophytes,	Carabids,	Isopods,	Ladybirds,	Macromoths,	Vascular_plants	

data <- read.csv("proportional_species_richness_V2.csv")

str(data)

# Select relevant columns for the taxonomic groups
selected_groups <- c("Bees", "Bryophytes", "Carabids", "Isopods", 
                     "Ladybirds", "Macromoths", "Vascular_plants")

# Calculate BD7
data$BD7 <- rowMeans(data[selected_groups], na.rm = TRUE)

# Calculate BD11
data$BD11 <- rowMeans(data[, c("Bees", "Bird", "Bryophytes", "Butterflies", 
                                               "Carabids", "Hoverflies", "Isopods", 
                                               "Ladybirds", "Macromoths", "Grasshoppers_._Crickets", 
                                               "Vascular_plants")], na.rm = TRUE)

## 1. Univariate Analysis
summary(data$Vascular_plants)
# Distribution of Vascular Plants Proportional Species Richness
hist(data$Vascular_plants, xlab = "Vascular Plants Richness")


summary(data$Isopods)
# Distribution of Isopods Proportional Species Richness
hist(data$Isopods, xlab = "Isopods Richness")

summary(data$Macromoths)
# Distribution of Macromoths Proportional Species Richness
hist(data$Macromoths, xlab = "Macromoths Richness")

# Distribution of Dominant Land Class
barplot(table(data$dominantLandClass), 
        xlab = "Land Class", ylab = "Count")

# Distribution of Easting
barplot(table(data$Easting),  
        xlab = "Easting", ylab = "Count")

# Distribution of Northing
barplot(table(data$Northing), 
        xlab = "Northing", ylab = "Count")

summary(data[,selected_groups])

## 2. Hypothesis Test

### T-Test for Two Independent Samples
t.test(data$Bees, data$Vascular_plants, alternative = "two.sided")

t.test(data$Bryophytes, data$Macromoths, alternative = "two.sided")

t.test(data$Carabids, data$Ladybirds, alternative = "two.sided")

### Wilcoxon Signed-Rank Test for Paired Samples
wilcox.test(data$Ladybirds, data$Macromoths, 
            paired = TRUE, alternative = "two.sided")

wilcox.test(data$Bryophytes, data$Isopods, 
            paired = TRUE, alternative = "two.sided")

wilcox.test(data$Vascular_plants, data$Carabids, 
            paired = TRUE, alternative = "two.sided")

## 3. Linear Regression

## Simple Linear Regression for BD7 vs. BD11 Overall

regression_overall <- lm(BD7 ~ BD11, data = data)

# Summary of the regression
summary(regression_overall)

## Simple Linear Regression for BD7 vs. BD11 by Period

# Create separate data frames for each period
periods <- unique(data$period)

# Perform regression for each period
regression_by_period <- lapply(periods, function(period) {
  subset_data <- subset(data, period == period)
  lm(BD7 ~ BD11, data = subset_data)
})

# Display summaries for each regression
lapply(seq_along(regression_by_period), function(i) {
  cat("\nSummary for Period", periods[i], ":\n")
  print(summary(regression_by_period[[i]]))
})

## 4. Multiple Linear Regression

cleand_data <- na.omit(data)
attach(cleand_data)

# Calculate BD4 (mean of the remaining four taxonomic groups)
cleand_data$BD4 <- rowMeans(cleand_data[, c("Bird", "Butterflies", 
                              "Hoverflies", "Grasshoppers_._Crickets")], 
                     na.rm = TRUE)

# Multiple linear regression
multiple_regression <- lm(BD4 ~ Bees + Bryophytes + Carabids + 
                            Isopods + Ladybirds + Macromoths + Vascular_plants, 
                          data = cleand_data)

# Summary of the regression
summary(multiple_regression)

### Feature Selection based on P-values and AIC

# Perform stepwise backward elimination based on AIC
backward_selection <- step(multiple_regression, direction = "forward")

# Display the final model
summary(backward_selection)

## 5. Open Analysis
# Linear regression of BD7 against the "period" variable
regression_bd7_period <- lm(BD7 ~ period, data = cleand_data)

# Summary of the regression
summary(regression_bd7_period)


# Linear regression of BD7 against the "period" variable
regression_bd4_period <- lm(BD4 ~ period, data = cleand_data)

# Summary of the regression
summary(regression_bd4_period)

