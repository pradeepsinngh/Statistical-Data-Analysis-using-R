# STAT 596 -- Take Home Exam -- Problem 2
# Pradeep Singh

data <- read.table(file.choose(), header = TRUE)

pima<- data[!(data$bmi >60),]

log_insulin = log(pima$insulin)
pima$log_insulin <- log_insulin
attach(pima)
#------------------------------------

t.test(log_insulin, conf.level = 0.95)


wilcox.test(insulin, conf.level = 0.95,conf.int = TRUE)
#Mann-Whitney-Wilcoxon Test

#-----------------------------------------
# B
log_insulin.N <- log_insulin[test=="negative"]
log_insulin.P <- log_insulin[test=="positive"]

t.test(log_insulin.N, log_insulin.P, var.equal = TRUE)

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
# C
t.test(log_insulin.N, log_insulin.P, var.equal = TRUE, paired = FALSE)

#-----------------------------------------
# D
var.test (log_insulin.N, log_insulin.P)

#-----------------------------------------
# E

wilcox.test(log_insulin.N, log_insulin.P, X=0,  conf.level= 0.95, conf.int = TRUE) 

# ====================================================================
#








#-----------------------------------------