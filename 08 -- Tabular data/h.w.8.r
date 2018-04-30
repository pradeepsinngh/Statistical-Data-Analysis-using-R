#
# STAT 596 -- H.W. 8
# Pradeep Singh

######### Problem 8.2 ############

#H0: P1 = P2 (proportions in both group)
#H1: P1 != P2
prop.test(x=c(210, 122), n=c(747, 661), alternative ="two.sided", 
          conf.level=0.95, correct=FALSE)
# As p-value is not greater than 0.05, we fail to reject null hypothesis and it seems
# alternate hypothesis is true. Proportions of people died in group 1(Wester US) is greater
# than group 2(Eastern US). We can say that the there is statistically significant
# difference between two groups.

mymatrix <- matrix(c(210, 122, 747, 661), nrow=2, ncol=2)
rownames(mymatrix) <- c("Western US", "Eastern US")
colnames(mymatrix) <- c("Died", "Total")
mymatrix

#H0: Odds Ratio = 1
#H1: Odds Ratio != 1
fisher.test(mymatrix) # returns information about the odds ratio 

# As we can see odds ratio is greater than 1, so we reject null hypothesis and it seems
# alternate hypothesis is true. Odds of group 1 (Western US) is greater than group 2 
# (Eastern US). It is more likely that people suffering "Rocky mountain spotted fever"
# in western US are dieing as compared to people in eastern US.

#Therefore, we can say that the differen is statistically significant.

######### Problem 8.3 ############

mymatrix <- matrix(c(23,7,18,13), nrow=2, ncol=2)
rownames(mymatrix) <- c("Pirenzepine", "Trithiozine")
colnames(mymatrix) <- c("Healed", "Not Healed")
mymatrix

#### Fisher's Exact Test

# H0: Odds Ratio = 1
# H1: Odds Ratio != 1
fisher.test(mymatrix)
# As we can see odds ratio is greater than 1, so we reject null hypothesis and it seems
# alternate hypothesis is true. Odds of getting healed in group 1 is greater than group 2. 

####  Chisq.test

# H0: P1 = P2    [Null Hypothesies]
# H1: P1 != P2   [Alternate Hypothesies]
chisq.test(mymatrix)
# As p-value is greater than 0.05, we fail to reject null hypothesies. 
# This means proportions in each cell is same.

####### Two-sample proportions test (To find CI)

prop.test(mymatrix)
# The approximate 95% confidence interval for the difference in healing 
# probability is: (-0.08462185, 0.50657307)

######### Problem 8.4 ############

# H0: Pij = Pi. * P.j    [Null Hypothesies]
# H1: Pij != Pi. * P.j   [Alternate Hypothesies]
# where i = 1,2,3,4 and j = 1,2,3
eggs <- c(42, 157, 47, 62, 4, 15, 4, 1, 8, 28, 9, 7)
dim(eggs) <- c(2,2,3)
dimnames(eggs) <- list(c("A","B"),
                      c("not pierced","pierced"),
                      c("ok","broken","cracked"))
ftable(eggs)
fisher.test(eggs["B",,])
# As we can see, p-value is greater than 0.05, therfore we fail to reject
# null hypothesis. That means, pierceing doesn't seems to have any effect 
# in this case (B).

fisher.test(eggs["A",,])
# As we can see, p-value is greater than 0.05, therfore we fail to reject
# null hypothesis. That means, pierceing doesn't seems to have any effect 
# in this case (A).

fisher.test(margin.table(eggs,2:3))

# As we can see that p-value is greater than 0.05, therefore we fail to reject the
# null hypothesies. Therefore, it seems that null hypothesis is true. On the basis of
# these reulst we believe that piercer does not to have had any effect.
#
