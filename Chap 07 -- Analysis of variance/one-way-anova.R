# Author: Pradeep Singh
# Email: pradeepsingh7890@live.com

# load the data
data <- read.csv("/Users/pradeepsingh/Desktop/MLB2015data.csv", header = TRUE)
attach(data)
library(car)

# divide the Pos column dependng upon position of player in diff levels
data.h <- ifelse((Pos == "LF") | (Pos == "CF") | (Pos == "RF"), "Outfielders", 
                 ifelse((Pos == "SS") | (Pos == "2B"), "Mid-Infielders", "Others"))

# creating a factor variable named "type"
type = factor(data.h)
levels(type)

# preparing (cleaning) data for aov func
cleandata = data.frame(HR, type)

# F-test for equality of means
# One-way ANOVA model
# H_0: mu(1) = mu(2) = ... = mu(a) (Null Hypotheses)
# H_1: mu(i) != mu(j) for at least one pair (i,j) (Alternate Hypotheses)
  
analysis = aov(HR ~ type, data= cleandata)
summary(analysis)

# As p-value for the test is 4.09e-07, which is less than 0.05, therefore 
# we reject the Null Hypothesis (H_0) and it seems that alternative
# hypothesis is plausible.

# ----------------------------------------------

# Non-paramteric test -- test equality of means for the variable HR
# H_0: mu(1) = mu(2) = ... = 0 (Null Hypotheses)
# H_1: mu(i) != mu(j) for at least one pair (i,j) (Alternate Hypotheses)

wilcox.test(HR, mu=0, data = cleandata) # Wilcoxon test

# As p-value for the test is 2.2e-16, which is less than 0.05, therefore 
# we reject the Null Hypothesis (H_0) i.e. the means for the variable HR
# are not equal and it seems that the alternative hypothesis is plausible.

# The results seems to be valid. We have used two methods -- One-way ANOVA
# and Wilcox Test and both the methods seems to be giving similar results
# about the equality of means. So, we can say that the means for the variable
# HR are not equal.

  # Test equality of variances 
  # H_0: sigma(1) = sigma(2) = ... = sigma(a) (Null Hypotheses)
  # H_1: sigma(i) != sigma(j) (Alternate Hypotheses)
  # for at least one pair (i,j)
  
  bartlett.test(HR ~ type, data=cleandata)

# As p-value is 0.00369, which is less than 0.05, therefore we reject the
# null hypothesis and it seems that the alternate hypothesis is plausible.
# Therefore, we conclude that equality of variances does not exist.

# Conclusion in part B seems to be correct as means for the variable HR are not 
# same or equal, the variances also tends to diverge from equality, which is 
# what we got in bartlett.test results. This seems plausible.


  # make a stripchart
  group.means <- tapply(HR, type, mean)
group.sds <- tapply(HR, type, sd)
group.sizes <- tapply(HR, type, length)
se <- group.sds / sqrt(group.sizes)
stripchart(HR ~ type, method="jitter", jitter=0.05, pch=16, vert=T, 
           xlab="Player Positions", ylab="Home Runs" )
arrows(1:3, group.means-se, 1:3, group.means+se, angle=90, code=3, length=0.1 )
lines(1:3, group.means, pch=4, type = "b", cex = 2, col = "red")
