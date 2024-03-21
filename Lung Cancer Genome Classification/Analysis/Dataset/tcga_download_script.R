# This code will get all clinical indexed data from TCGA-LUAD
library(data.table)
library(dplyr)
library(regexPipes)

TCGA_LUAD.clinical <- TCGAbiolinks:::getGDCprojects()$project_id %>% 
  regexPipes::grep("TCGA-LUAD",value = TRUE) %>% 
  sort %>% 
  plyr::alply(1,GDCquery_clinic, .progress = "text") %>% 
  rbindlist

TCGA_LUSC.clinical <- TCGAbiolinks:::getGDCprojects()$project_id %>% 
  regexPipes::grep("TCGA-LUSC",value = TRUE) %>% 
  sort %>% 
  plyr::alply(1,GDCquery_clinic, .progress = "text") %>% 
  rbindlist

#readr::write_csv(clinical,file = paste0("TCGA_LUSC_indexed.csv"))
#TCGA_LUSC <- read.csv("TCGA_LUSC_indexed.csv")

TCGA_LUAD.clinical <- TCGA_LUAD.clinical[-c(523:585), ]

TCGA_LUAD.clinical <- TCGA_LUAD.clinical %>% select(-c("NA."))

tcga.lungs.data <- rbind(TCGA_LUAD.clinical, TCGA_LUSC.clinical)

readr::write_csv(tcga.lungs.data,file = paste0("TCGA_Lungs_Indexed.csv"))

TCGA_LUAD.clinical$submitter_id

