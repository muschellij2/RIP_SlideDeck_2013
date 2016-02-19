rm(list=  ls())
library(fslr)
library(dplyr)
setwd("~/Dropbox/CTR/DHanley/CT_Registration/RIP_SlideDeck/RIP_2015_Dec/pred/")

img = readnii("100-362_20100126_1926_CT_2_CT_ROUTINE_SS_0.01_SyN.nii.gz")
roi = readnii("100-362_20100126_1926_CT_2_CT_ROUTINE_SS_0.01_SyN_ROI.nii.gz")

atlas = readnii("JHU_MNI_SS_WMPM_Type-I_to_Rorden_brain.nii.gz")
# aimg = readnii("betsct1_unsmooth.nii.gz")

xx = read.table("JHU_MNI_SS_WMPM_Type-I_SlicerLUT.txt", stringsAsFactors = FALSE)
xx = xx[, 1:2]
colnames(xx) = c("index", "Area")
xx = rbind(xx, c(-99, "Outside Brain Mask"))
xx$index = as.numeric(xx$index)
jhut1.df = xx

ind = atlas[which(roi > 0.5)]
df = as.data.frame(table(index = ind))
df = merge(df, jhut1.df, all.x = TRUE)

stopifnot(!grepl("left", df$Area))
df$Area = gsub("_(left|right)", "", 
    df$Area)
df$Area = gsub("_", " ", df$Area)

# coldf = group_by(df, nolr_area) %>% 
#     summarise(sum_area = sum(Freq))
df$Prevalence = round(df$Freq/sum(df$Freq) * 100, 1)

################
# Combining left and right
################


n = 5
xdf = arrange(df, desc(Prevalence)) %>% 
    select(Area, Prevalence)  %>% 
    head(n = n)

write.table(xdf, file = "../Subject_Table.txt")

