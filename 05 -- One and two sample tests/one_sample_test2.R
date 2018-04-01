# Author: Pradeep Singh
# Email: pradeepsingh7890@live.com

# load the data set
data <- read.table(file.choose(), header = TRUE)

# clean the data
pima<- data[!(data$bmi >60),]

# convert col insulin values in log scale
log_insulin = log(pima$insulin)
pima$log_insulin <- log_insulin
attach(pima)

#------------------------------------

# Part A

# 95% CI for population mean in log scale
t.test(log_insulin, conf.level = 0.95)

# The 95 percent confidence interval for popultaion mean of the variable log(insulin) 
# is 4.739142 -- 4.878260. Therefore, we are 95 percent confidence that the value of 
# popultation mean of variable insulin lies between 4.739142 to 4.878260 in log scale.

# CI for population median in orginal scale
wilcox.test(insulin, conf.level = 0.95, conf.int = TRUE)

# The 95 percent confidence interval for popultaion median of the variable insulin 
# is 126.5 - 145.00. Therefore, we are 95 percent confidence that the value of 
# popultation median of variable insulin lies between 126.5 - 145.00 in orignal scale.

#-----------------------------------------

# Part B

log_insulin.N <- log_insulin[test=="negative"]
log_insulin.P <- log_insulin[test=="positive"]
t.test(log_insulin.N, log_insulin.P, var.equal = TRUE, paired = FALSE)

# The 95 percent confidence interval for the mean difference between the "negative" 
# and "positive" (test) groups is -0.6608 -0.3831. Moreover, we are confident that the
# population mean for negative test goup is greater than that of the positive test 
# group (because we are confident that the difference pop.meanN − pop.meanP is negative).

qqnorm(log_insulin)

# As we can see points in Q-Q plot are close to diagonal, we can say that 
# log_insulin (log scale) follows the normal distribution. And, median and 
# mean are equal in the log scale if variable follows the normal distribution.
# Once we back transformed those t-tests (CI -- log scale) tell us about ratios 
# of medians of the populations of response (CI -- origanl scale)

exp(0.6608202) # from t-test
exp(0.3831835)

# So, CI for the ratio of population medians in the orginal scale is 1.466947 - 1.93638.

#-----------------------------------------

# Part C

# H_0: mu.n - mu.p = 0 (Null Hypotheses) [Mean diff is zero]
# H_1: mu.n - mu.p != 0 (Alternate Hypotheses) [Mean diff is not zero]
t.test(log_insulin.N, log_insulin.P, var.equal = TRUE, paired = FALSE)

# As the p$-$value of the test is 8.84$e-$13, which is less than 0.05, we 
# have sifficient evidence to reject H_0, that mean difference between negative 
# and positive test group is not zero. Therefore, we can say that there is 
# difference in means of positive and negative test group.

#-----------------------------------------

# Part D:

# Are the equal SDs assumption valid?

# H_0: var.n = var.p  [equal variance nehative and poistive group]
# H_1: var.n != var.p [not equal variance nehative and poistive group]
var.test (log_insulin.N, log_insulin.P)

# We can observe, as 1 lies in the confidence interval (p-value is greater 
# than 0.05) for the variable insulin. Hence, we have no evidence to reject 
# H_0 that var.n = var.p. Hence, we can say equal SD assumption is appropriate.

#-----------------------------------------

# Part E:

# H_0: X.n - X.p = 0
# H_1: X.n - X.p != 0, where X = location parameter
wilcox.test(log_insulin.N,log_insulin.P, X=0,  conf.level= 0.95, conf.int = TRUE) 

# As the p-value of the test is 9.105e-14, which is less than 0.05, we have 
# sufficient evidence to reject H_0, that location difference between negative 
# and positive test group is not zero. Therefore, we can say that there is 
# difference in location paramter of of positive and negative test groups.

