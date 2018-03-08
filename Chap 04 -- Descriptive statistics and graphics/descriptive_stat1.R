# Author: Pradeep Singh
# Email: pradeepsingh7890@live.com

#######################
#      Problem 1      #
#######################
# load the data
# HData <- read.table("health_dataset.txt", header = TRUE)
HData <- read.table(file.choose(), header = TRUE)

# If the SBP >= 140, label it as "High SBP", else "Normal SBP"
SBP.H <- ifelse(HData$SBP >= 140, "High SBP", "Normal SBP")

# Add SBP.H as a col to HData
HData$SBP.H <- SBP.H

# Factor SBP.H
SBP.H <- factor(SBP.H)

# Freq table for SBP.H
freq_table <- table(SBP.H)

# 2 X 2 Freq table for SBP Level and Gender
freqtable <- table(HData$SBP.H, HData$GENDER)
rfreq <- prop.table(freqtable, margin = 2) * 100
round(rfreq, 3)            # round upto 3 decimal points

# Pie chart
pie(table(HData$SBP.H), col=c("blue", "red"),radius = .8, main = "Levels of Systolic Blood Pressure", 
    font.main = 3)

# Stacked bar charts
barplot(table(HData$SBP.H, HData$GENDER), col=c("blue", "red"), legend = levels(SBP.H), 
              main = "Systolic Blood Pressure level in Male & Female", font.main = 4)
        
# Clustered bar charts
barplot(table(HData$SBP.H, HData$GENDER), col=c("blue", "red"), legend = levels(SBP.H), 
        beside = TRUE, main = "Systolic Blood Pressure level in Male & Female", font.main = 4)

