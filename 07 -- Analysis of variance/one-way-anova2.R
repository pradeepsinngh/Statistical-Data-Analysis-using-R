# Author: Pradeep Singh
# Email: pradeepsingh7890@live.com

library(car)
data <- read.table(file.choose(), header = TRUE)

# clean the data
pima<- data[!(data$bmi >60),]
attach(pima)

# divide the pregnancies column dependng upon # of pregnancies in diff levels
group.h <- ifelse((pregnancies <= 3), "Low", ifelse((pregnancies >= 8), "High", "Mid"))
group = factor(group.h)

cleandata = data.frame(diastolic, group)

#----------------------------------------------
# Part A:

# H_0: mu(i) = mu(j)
# H_1: mu(i) != mu(j) for at least one pair of i,j (i,j = 1,2,3..) (i != j)
analysis = aov(diastolic ~ group, data = pima)
summary(analysis)  # F-test for equality of means

# Since the p-value is less than 0.05 we have sufficient evidence to reject H_0. Hence, 
# we can say that mu(i) != mu(j) for at least one pair of i,j (i,j = 1,2,3..) (i != j).

#----------------------------------------------

# Part B:

# H_0: var(i) = var(j)
# H_1: var(i) != var(j) for at least one pair of i,j (i,j = 1,2,3..) (i != j)
bartlett.test(diastolic ~ group, data=pima)

# Since the p-value is less than 0.05 we have sufficient evidence to reject H_0. 
# We can say that eqaulity of variance assumption is not true. Hence, we cannot 
# trust the conclusion of the ANOVA test in part A.

#----------------------------------------------

# Part C:

# The non-paramteric equivalance test of ANOVA is the Kruskal-Wallis Rank Sum test.
cleandata = data.frame(diastolic, group = factor(group.h))
#H_0: meadian(i) = meadian(j)
#H_1: meadian(i) != meadian(j) for at least one pair of i,j (i,j = 1,2,3..) (i != j)

kruskal.test(diastolic ~ group, data=cleandata)
# By using non parametric test (Kruskal-Wallis Rank Sum Test), we get the value of 
# chi-square test statistic of 46.276 with degrees of freedom 2 and p vlaue less than 
# 0.05. Hence we have sufficient evidence to reject H_0. Hence we can say that 
# median(i) != median(j) for at least one pair of i, j (i, j = 1,2,3) (i != j). 
# The results of this test is in line with the parametric test (ANOVA). This test 
# is valid even if the normality assumption of the data is not met.

# The location parameters of the distribution of diastolic are the not same 
# in each group. They differ in at least one pair.


#----------------------------------------------

# Part D:

# Stripchart
group.means <- tapply(diastolic, group, mean, na.rm = TRUE)
group.sds <- tapply(diastolic, group, sd, na.rm = TRUE)
group.sizes <- tapply(diastolic, group, length)
se <- group.sds / sqrt(group.sizes)
ci.lower <- group.means - 2 * se
ci.upper <-  group.means + 2 * se
stripchart(diastolic ~ group, method="jitter", jitter=0.2, pch=16, vert=T, 
           col = "orange", main="Stripchart")
arrows(1:3, ci.lower, 1:3, ci.upper, angle = 90, code = 3, length= 0.1, col = "blue")
lines(1:3, group.means, type = "b", cex = 1.5, col = "red")
#----------------------------------------------

# Part E:

summary(analysis)

alpha = 0.05 # 95 % CI
g = 3 # 3 CI's of mean differences
sigmahat =  sqrt(103112/725) # obtained from anova
tquant = qt(p = 1- alpha/(2*g), df = 725)
meandiff = c(group.means[2] - group.means[1],
             group.means[3] - group.means[1],
             group.means[3] - group.means[2])

meandiff[1] + tquant * c(-1,1) * sigmahat * sqrt(1/group.sizes[2] + 1/group.sizes[1])
meandiff[2] + tquant * c(-1,1) * sigmahat * sqrt(1/group.sizes[3] + 1/group.sizes[1])
meandiff[3] + tquant * c(-1,1) * sigmahat * sqrt(1/group.sizes[3] + 1/group.sizes[2])
