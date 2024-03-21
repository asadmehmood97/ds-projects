library(tidyverse)
library(dplyr)
library(tidyr)
library(ggplot2)
library(GGally)
library(cluster)
library(factoextra)
library(caTools)
library(car)
library(glmnet)
library(caret)
# Load the dataset
data = read.csv("project_data.csv")

# Convert M/F into numeric values
data$M.F = ifelse(data$M.F == "M", 1, 0)

# Remove rows with Group = "Converted" and missing values
data = data %>%
  filter(Group != "Converted" & complete.cases(.))

# Convert Group to factor for proper ordering in the boxplot
data$Group = factor(data$Group, levels = c("Nondemented", "Demented"))

## Task 1: Descriptive Statistics

# Summary statistics
summary(data[,3:10])
colnames(data)

# Boxplots

# Reshape the data for boxplot
data_long = gather(data, key = "variable", value = "value", -Group)

# Create a grid of boxplots
boxplot_grid = ggplot(data_long, aes(x = Group, y = value)) +
  geom_boxplot() +
  facet_wrap(~variable, scales = "free_y") +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
        
# Show the boxplot grid
print(boxplot_grid)

ggplot(data_long, aes(x = value, fill = Group)) +
  geom_histogram(binwidth = 5, position = "identity", alpha = 0.5) +
  facet_wrap(~variable, scales = "free") +
  labs(x = "Value", y = "Frequency") +
  ggtitle("Histogram Grid") + theme_bw() +
  scale_fill_manual(values = c("#123456", "#100982")) 

response.vars = c("M.F","Age","EDUC","SES","MMSE","CDR","eTIV","nWBV","ASF")
target.var = "Group"

# Scatterplots
ggpairs(data, columns = response.vars, mapping = aes(color = target.var),
        title = "Scatter Plot Grid") + theme_bw()

## Task 2: Clustering 

# Define cluster_data
cluster_data = data %>% 
  select(-c("Group", "M.F")) %>% scale

# K-Means Clustering with Elbow Method
wss = numeric(10)

for (i in 1:10) {
  kmeans_model = kmeans(cluster_data, centers = i)
  wss[i] = sum(kmeans_model$withinss)
}

# Plot the elbow method
plot(1:10, wss, type = "b", pch = 19, frame = FALSE, 
     xlab = "Number of Clusters (K)", ylab = "Within Sum of Squares (WSS)",
     main = "Elbow Method for K-Means Clustering") 

# K-Means Clustering with K = 3
set.seed(123)  # for reproducibility
kmeans_model = kmeans(cluster_data, centers = 3)

# Add cluster assignment to the original data
data$Cluster = as.factor(kmeans_model$cluster)

# Create a grid of scatter plots for each feature
fviz_cluster(kmeans_model, geom = "point", data = cluster_data) +
  ggtitle("K-Means Clustering at k = 3") + theme_classic()

# Hierarchical Clustering with Dendrogram
hc_model = hclust(dist(cluster_data), method = "complete")
cutree_model = cutree(hc_model, k = 3)

# Plot the dendrogram
plot(hc_model, hang = -1, cex = 0.6, 
     main = "Dendrogram for Hierarchical Clustering")

### Should include these results in the report 
table(cutree_model)
table(kmeans_model$cluster)

data$Cluster_HC = as.factor(cutree_model)

# Task 3: Logistic Regression Model
# Check multicollinearity 
multicollinearity <- glm(data$Group ~ .,
                      data = data, family = "binomial")

# Calculate VIF
vif_values <- car::vif(multicollinearity)

# Display VIF values
print("VIF Values:")
print(vif_values)

data$Cluster_HC = as.numeric(data$Cluster_HC)
data$Cluster = as.numeric(data$Cluster)

regression_data = as.data.frame(data %>% select(-c("Group")) %>% scale)
regression_data$Group = data$Group

# Perform train-test split (70:30 ratio)
split = sample.split(regression_data$Group, SplitRatio = 0.7)
train_data = subset(regression_data, split == TRUE)
test_data = subset(regression_data, split == FALSE)

attach(train_data)
lr.model <- train(Group ~ M.F + Age + EDUC + SES + MMSE + eTIV + nWBV + ASF,
                  data = train_data,
                  method = "glm",
                  family=binomial())

summary(lr.model)
lr.model$results

# Task 4: Cross-Validation
# Perform 5-fold cross-validation
# define training control
train_control <- trainControl(method = "cv", number = 10)
cv_model <- train(Group ~ M.F + Age + EDUC + SES + MMSE + eTIV + nWBV + ASF,
               data = train_data,
               trControl = train_control,
               method = "glm",
               family=binomial())

summary(cv_model)$coef
cv_model$results

## Comparison 
results <- rbind(lr.model$results, cv_model$results)
# add a column for model type
results <- results %>% select(-c("parameter"))
results <- round(results, digits = 2)
results$model <- c("LR model", "LR with CV model")

results <- results %>% mutate(across(everything(), as.character))
# or specify the type of the value column
results_long <- pivot_longer(results, cols = -model, 
                             names_to = "metric", 
                             values_to = "value", 
                             values_ptypes = character())

ggplot(results_long, aes(x = model, y = value, fill = model)) +
  geom_col(position = "dodge") +
  facet_wrap(~metric, scales = "free") +
  labs(x = "Model type",
       y = "Value",
       fill = "Model type") +
  scale_fill_manual(values = c("blue", "red")) +
  theme_bw()
