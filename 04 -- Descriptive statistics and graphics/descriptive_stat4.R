
# Author: Pradeep Singh
# Email: pradeepsingh7890@live.com

# load data
data <- read.table(file.choose(), header = TRUE)

pima<- data[!(data$bmi >60),]
attach(pima)

# divide the pregnancies column dependng upon # of pregnancies in diff levels
group.h <- ifelse((pregnancies <= 3), "Low", ifelse((pregnancies >= 8), "High", "Mid"))
group = factor(group.h)
levels(group)

#------------------------------------------------------------
# freq table for variable group

freq_table = table(group)
table(factor(group))

#------------------------------------------------------------
# 3-by-2 freq table for groupa and test

freqtable = table(group, test)
rfreq <- prop.table(freqtable, margin = 1) * 100
round(rfreq, 3)

# 26.85 % of women in the low group were tested positive for diabetes.
# On the basis of our findings we can say that womens in the high group 
# (women with 8 or more pregnancies) are more likely to have diabetes.

#------------------------------------------------------------
# Piecharts for variables -- group and test

pie(table(group), col=c("blue","red","yellow"),radius = .4, main = 
      "Pregnancies in Womens", font.main = 2)

pie(table(test), col=c("blue","red"),radius = .4, main = "Diabetes 
    Test in Womens", font.main = 2)

#------------------------------------------------------------
# Stacked bar charts
barplot(table(test, group), col=c("blue", "red"), legend = levels(test), 
        main = "Diabetes Test in Womens by Pregnancies", font.main = 2,
        xlab = "Pregnancy Group in Womens", ylab = "Frequency")

# Clustered bar charts
barplot(table(test, group), col=c("blue", "red"), legend = levels(test), 
        beside = TRUE, main = "Diabetes Test in Womens by Pregnancies", 
        font.main = 2, xlab = "Pregnancie Group in Womens", ylab = "Frequency")

#------------------------------------------------------------
# Histogram and boxplot

# boxplot
boxplot(diastolic~group, main = "Diastolic by Pregnancy Groups", 
        col=c("red", "blue","yellow"), ylab = "Diastolic")

break.pt <- seq(from=0, to=150, by=5)
par(mfrow=c(1,3))

# histograms
hist(diastolic[group=="Low"],main = "Diastolic for Low Pregnancy Group", 
     breaks = break.pt,xlab = "Low",col = "red", ylim=c(0, 100))
hist(diastolic[group=="Mid"],main = "Diastolic for Mid Pregnancy Group", 
     breaks = break.pt,xlab = "Mid",col = "blue", ylim=c(0, 100))
hist(diastolic[group=="High"],main = "Diastolic for High Pregnancy Group", 
     breaks = break.pt,xlab = "High",col = "yellow", ylim=c(0, 100))

dev.off()



