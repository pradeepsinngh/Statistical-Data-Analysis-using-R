# Author: Pradeep Singh
# Email: pradeepsingh7890@live.com

#######################
#      Problem 2      #
#######################

# load the data
#HData <- read.table("hdata.txt", header = TRUE)
HData <- read.table(file.choose(), header = TRUE)

# If the SBP >= 140, label it as "High SBP", else "Normal SBP"
SBP.H <- ifelse(HData$SBP >= 140, "High SBP", "Normal SBP")

# Add SBP.H as a col to HData
HData$SBP.H <- SBP.H

# Factor SBP.H
SBP.H <- factor(SBP.H)

par(mfrow=c(1,2))
hist(HData$DBP[HData$SBP.H == "High SBP"])
hist(HData$DBP[HData$SBP.H == "Normal SBP"])

boxplot(HData$DBP~HData$SBP.H)

summary(HData$DBP)
summary(HData$DBP[HData$SBP.H == "High SBP"])
summary(HData$DBP[HData$SBP.H == "Normal SBP"])

DBP.H <- ifelse(HData$DBP >= 90, "High DBP", "Normal DBP")

# Add SBP.H as a col to HData
HData$DBP.H <- DBP.H

# Factor SBP.H
DBP.H <- factor(DBP.H)

# Freq table for SBP.H
freq_table <- table(DBP.H)

# 2 X 2 Freq table for SBP Level and Gender
freqtable <- table(HData$SBP.H, HData$DBP.H)
rfreq <- prop.table(freqtable, margin = 2) * 100
round(rfreq, 3)


freqtable1 <- table(HData$SBP.H, HData$DBP.H)
rfreq1 <- prop.table(freqtable, margin = 1) * 100
round(rfreq1, 3)
