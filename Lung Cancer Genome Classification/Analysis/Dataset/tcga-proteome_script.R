library(TCGAbiolinks)
library(SummarizedExperiment)
library(tidyverse)
library(factoextra)

gdcproject <- getGDCprojects()
getProjectSummary('TCGA-LUAD')

TCGA_LUAD.proteome <- GDCquery(
  project = "TCGA-LUAD", 
  data.category = "Proteome Profiling"
)

GDCdownload(TCGA_LUAD.proteome)
TCGA_LUAD.proteome <- GDCprepare(TCGA_LUAD.proteome)
TCGA_LUAD.proteome <- TCGA_LUAD.proteome[,6:370]

TCGA_LUSC.proteome <- GDCquery(
  project = "TCGA-LUSC", 
  data.category = "Proteome Profiling"
)

GDCdownload(TCGA_LUSC.proteome)
TCGA_LUSC.proteome <- GDCprepare(TCGA_LUSC.proteome)
TCGA_LUSC.proteome <- TCGA_LUSC.proteome[,6:333]

TCGA_LUAD.proteome <- TCGA_LUAD.proteome[complete.cases(TCGA_LUAD.proteome), ]
TCGA_LUSC.proteome <- TCGA_LUSC.proteome[complete.cases(TCGA_LUSC.proteome), ]

TCGA_LUAD.proteome <- t(TCGA_LUAD.proteome)
TCGA_LUSC.proteome <- t(TCGA_LUSC.proteome)
#### K-Means Clustering on TCGA_LUAD.proteome
wss <- numeric(10)

for (i in 1:10) {
  kmeans_model <- kmeans(TCGA_LUAD.proteome, centers = i, nstart = 10)
  wss[i] <- sum(kmeans_model$withinss)
}

# Plot the Elbow Method
plot(1:10, wss, type = "b", pch = 19, frame = FALSE, 
     xlab = "Number of Clusters", ylab = "Within-Cluster Sum of Squares")

LUAD.proteome_kmeans <- kmeans(TCGA_LUAD.proteome, centers = 4, nstart = 10)

cluster_assignment <- LUAD.proteome_kmeans$cluster
length(cluster_assignment)

LUAD.proteome <- data.frame(Cluster = cluster_assignment, 
                                 protien = rownames(TCGA_LUAD.proteome))
row.names(LUAD.proteome) <- NULL

LUAD_pca_result <- prcomp(TCGA_LUAD.proteome, scale. = TRUE)

# Visualize clusters using fviz_cluster
fviz_cluster(LUAD.proteome_kmeans, data = LUAD_pca_result$x[, 1:10], 
             geom = "point", stand = FALSE)


#### K-Means Clustering on TCGA_LUSC.proteome
for (i in 1:10) {
  kmeans_model <- kmeans(TCGA_LUSC.proteome, centers = i, nstart = 10)
  wss[i] <- sum(kmeans_model$withinss)
}

# Plot the Elbow Method
plot(1:10, wss, type = "b", pch = 19, frame = FALSE, 
     xlab = "Number of Clusters", ylab = "Within-Cluster Sum of Squares",
     main = "Elbow Method for Optimal K in K-Means (TCGA LUSC Proteome)")

LUSC.proteome_kmeans <- kmeans(TCGA_LUSC.proteome, centers = 4, nstart = 10)

lusc_cluster_assignment <- LUSC.proteome_kmeans$cluster
length(lusc_cluster_assignment)


LUSC.proteome <- data.frame(Cluster = lusc_cluster_assignment, 
                            protien = rownames(TCGA_LUSC.proteome))
row.names(LUSC.proteome) <- NULL

LUSC_pca_result <- prcomp(TCGA_LUSC.proteome, scale. = TRUE)

# Visualize clusters using fviz_cluster
fviz_cluster(LUSC.proteome_kmeans, data = LUSC_pca_result$x[, 1:10], 
             geom = "point", stand = FALSE)

LUAD.proteome$protien <- gsub("-01A$", "", LUAD.proteome$protien)
LUSC.proteome$protien <- gsub("-01A$", "", LUSC.proteome$protien)

LUAD_Merged <- merge(TCGA_LUAD.clinical, LUAD.proteome, by.x = "submitter_id", 
      by.y = "protien", all.x = TRUE)

table(LUAD_Merged$ajcc_pathologic_stage, LUAD_Merged$Cluster)

LUSC_Merged <- merge(TCGA_LUSC.clinical, LUSC.proteome, by.x = "submitter_id", 
                     by.y = "protien", all.x = TRUE)

table(LUSC_Merged$ajcc_pathologic_stage, LUSC_Merged$Cluster)

Merged.data <- rbind(LUAD_Merged, LUSC_Merged)
readr::write_csv(Merged.data,file = paste0("TCGA_proteome_data.csv"))
