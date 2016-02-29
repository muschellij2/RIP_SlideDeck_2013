rm(list=  ls())
library(fslr)
library(dplyr)
setwd("~/Dropbox/CTR/DHanley/CT_Registration/RIP_SlideDeck/RIP_2015_Dec/pred/")

template = readNIfTI("scct_unsmooth_SS_0.01.nii.gz")

img = readNIfTI("100-362_20100126_1926_CT_2_CT_ROUTINE_SS_0.01_SyN.nii.gz")
roi = readNIfTI("100-362_20100126_1926_CT_2_CT_ROUTINE_SS_0.01_SyN_ROI.nii.gz")

atlas = readNIfTI("JHU_MNI_SS_WMPM_Type-I_to_Rorden_brain.nii.gz")
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
df$Engagement = round(df$Freq/sum(df$Freq) * 100, 1)

################
# Combining left and right
################


n = 5
xdf = arrange(df, desc(Engagement)) %>% 
    select(Area, Engagement)  %>% 
    head(n = n)

write.table(xdf, file = "../Subject_Table.txt")


t2 = window_img(template, window = c(0, 100))
t2[ roi == 1] = 200

a = atlas
a[ a == 0] = NA

dd = dropEmptyImageDimensions(a > 0, other.imgs = list(t2 = t2, a = a, roi = roi))

t2 = dd$other.imgs$t2
a = dd$other.imgs$a
xroi = dd$other.imgs$roi

# ortho2(a, col = rainbow(100))
# ortho2(template, a, col.y = rainbow(100))
png("../figure/Eve_Atlas_Comparison.png", 
    res = 600, units = "in", height = 3.5, width = 7)
  double_ortho(t2, a, col.y = rainbow(100), 
               xyz = xyz(xroi), add.orient = FALSE)
dev.off()

