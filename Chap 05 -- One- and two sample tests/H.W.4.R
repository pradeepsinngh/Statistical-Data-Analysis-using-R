# H.W.4 -- STAT 596

# read the file
health <- read.table(file.choose(), header=TRUE)  
attach(health)

#########################################
# Problem 1 -- Test if there are gender (mean) differences for different variables.
#########################################

# a) SBP

SBP.M <- SBP[GENDER == "Male"]
SBP.F <- SBP[GENDER == "Female"]

# H_0: gender mean difference = 0  (Null Hypotheses)
# H_1: gender mean difference != 0 (Alternative Hypotheses)

# Test mean SBP difference = 0 (Male - Female)
t.test(SBP.M, SBP.F, var.equal = TRUE, paired = FALSE)
# Test mean SBP difference = 0 (Female - Male)
t.test(SBP ~ GENDER, var.equal = TRUE, paired = FALSE)  

# As p-value for the test is 1.637e-07, which is less than 0.05, therefore
# we reject the Null Hypothesis (H_0) and there is enough evidence to accept
# alternative hypothesis. 

# Conclusion: The difference between gender (Male & Female) mean of SBP 
# variable is not equal to 0. There is significant difference between gender mean of SBP variable. 

# Are the SDs for SBP the same for both genders?  
var.test (SBP.M, SBP.F)

# The p-value of F-test is p = 0.3021 which is greater than the significance level 0.05. 
# In conclusion, there is no significant difference between the two variances. So, we can
# say that the equal SD (variance) assumption is appropriate.

########################################################

# b) HDL

HDL.M <- HDL[GENDER == "Male"]
HDL.F <- HDL[GENDER == "Female"]

# H_0: gender mean difference = 0  (Null Hypotheses)
# H_1: gender mean difference != 0 (Alternative Hypotheses)

# Test mean HDL difference = 0 (Male - Female)
t.test(HDL.M, HDL.F, var.equal = TRUE, paired = FALSE)
# Test mean HDL difference = 0 (Female - Male)
t.test(HDL ~ GENDER, var.equal = TRUE, paired = FALSE)  

# As p-value for the test is 5.233e-14, which is less than 0.05,
# we reject the Null Hypothesis (H_0) and there is enough evidence to accept
# alternative hypothesis. 

# Conclusion: The difference between gender (Male & Female) mean of HDL 
# variable is not equal to 0. There is significant difference between gender mean of HDL variable. 

# Are the SDs for HDL the same for both genders?  
var.test (HDL.M, HDL.F)

# The p-value of F-test is p = 6.913e-06 which is less than the significance level 0.05. 
# In conclusion, there is significant difference between the two variances. So, we can
# say that the equal SD (variance) assumption is not appropriate in this case.

##########################################################

# c) CHOL

CHOL.M <- CHOL[GENDER == "Male"]
CHOL.F <- CHOL[GENDER == "Female"]

# H_0: gender mean difference = 0  (Null Hypotheses)
# H_1: gender mean difference != 0 (Alternative Hypotheses)

# Test mean CHOL difference = 0 (Male - Female)
t.test(CHOL.M, CHOL.F, var.equal = TRUE, paired = FALSE)
# Test mean CHOL difference = 0 (Female - Male)
t.test(CHOL ~ GENDER, var.equal = TRUE, paired = FALSE)  

# As p-value for the test is 0.03124, which is less than 0.05,
# we reject the Null Hypothesis (H_0) and there is enough evidence to accept
# alternative hypothesis. 

# Conclusion: The difference between gender (Male & Female) mean of CHOL 
# variable is not equal to 0. There is difference between gender mean of CHOL variable. 

# Are the SDs for CHOL the same for both genders?  
var.test (CHOL.M, CHOL.F)

# The p-value of F-test is p = 0.3081 which is greater than the significance level 0.05. 
# In conclusion, there is no significant difference between the two variances. So, we can
# say that the equal SD (variance) assumption is appropriate.

##########################################
# Problem 2
###########################################

# Is the popluation mean of SBP greater than of DBP?

# H_0: mu(dbp) - mu(sbp) >= 0  -- (Null Hypotesis)
# H_1: mu(dbp) - mu(sbp) < 0 -- (Alternate Hypothesis)
# alpha (significance level) = 0.05

t.test(SBP, DBP, mu = 0, alternative = "two.sided", var.equal = TRUE, paired = TRUE)

# As p-value for the test is 2.2e-16, which is less than 0.05, we reject the null hypothesis
# and accept the alternative hypothesis i.e. difference between pop mean b/w DBP & SBP is less than zero.

# Conclusion: The population mean for of SBP is greater than that of DBP.


########################################
# Problem 3
########################################

power.t.test(n=NULL, delta = 5, power = 0.90, type = "one.sample",
             alternative = "two.sided", sig.level = 0.05, sd=sd(HDL), strict = TRUE)

# Conclusion: To detect a difference of 5 HDL points with a power of 0.90, 
# we need a sample size of about 116.5107 ~ 117.


power.t.test(n=NULL, delta = 5, power = 0.90, type = "one.sample",
             alternative = "two.sided", sig.level = 0.05, sd=sd(HDL.M), strict = TRUE)

# Conclusion: To detect a difference of 5 HDL points in male HDL with a power of 0.90, 
# we need a sample size of about 65.24132 ~ 66.

power.t.test(n=NULL, delta = 5, power = 0.90, type = "one.sample",
             alternative = "two.sided", sig.level = 0.05, sd=sd(HDL.F), strict = TRUE)

# Conclusion: To detect a difference of 5 HDL points in female HDL with a power of 0.90, 
# we need a sample size of about 126.2754 ~ 127.