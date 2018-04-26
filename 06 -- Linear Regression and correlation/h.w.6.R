# STAT 596 -- H.W.6
# Author: Pradeep Singh

# read the data
mlb <- read.csv(file="MLB2015data.csv", header=TRUE)
attach(mlb)

# diving players in 3 groups -- "mid-inf", "outfielders", "remaining players".
mid.inf <- ifelse((Pos=="2B") | (Pos=="SS"), 1, 0)
outfielder <- ifelse((Pos=="CF") | (Pos=="RF") | (Pos=="LF"), 1, 0)
# remaining players are in mid.inf = 0 and outfielder = 0.

R.game <- R / G
OBP <- OBP * 1000

# -----------------------------------------------------
# Part A

# Obtain separate regression lines for each group
fit.Mid <- lm(R.game~OBP, subset=mid.inf==1)
fit.Out <- lm(R.game~OBP, subset=outfielder==1)
fit.Rem <- lm(R.game~OBP, subset=(mid.inf==0) & (outfielder==0))

summary(fit.Mid)
summary(fit.Out)
summary(fit.Rem)

# Add points to empty plot. 
plot(OBP, R.game, type="n", main="Linear relationship by position")
points(OBP[mid.inf==1], R.game[mid.inf==1] , col="blue")
points(OBP[outfielder==1], R.game[outfielder==1] , col="red")
points(OBP[(mid.inf==0) & (outfielder==0)], R.game[(mid.inf==0) & (outfielder==0)], 
       col="green")

# Add regression lines with color
abline(fit.Mid, col="blue")
abline(fit.Out, col="red")
abline(fit.Rem, col="green")

# Add legend
legend("topleft", c("Middle-Infielders", "Outfielders", "Remaining Positions" ), 
       col=c("blue", "red", "green"), pch = .5, title = "Positions")

# ----------------------------------------------------------
# Part B

fit.nointeraction <- lm(R.game ~ OBP + mid.inf + outfielder)
summary(fit.nointeraction)

# beta0 = intercept of the "remaining group" line
# beta1 = slope of the 3 lines 
# beta2 = difference of intercepts, (mid infielders - remaining group)
# beta3 = difference of intercepts, (outfielders - remaining group)

# This model assumes that the slopes of the 3 lines are equal. 

# Note that there is a statistically significant difference (at the 0.05 level) 
# between the intercepts of the "outfielders" line and the "remaining" players line. 

# The difference between the intercepts of the "mid-infielders" line and the 
# "remaining" players line is not so statistically significant.

# Under the assumption of equal slopes, it seems that outfielders tend to be faster 
# (or at least better base runners) than mid-infielders and remaining players.

# ----------------------------------------------------
# Part C.

fit.interaction <- lm(R.game ~ OBP + mid.inf + outfielder + OBP * mid.inf 
                      + OBP * outfielder)
summary(fit.interaction)

# beta0 = intercept of the "remaining group" line
# beta1 = slope of the "remaining group" line
# beta2 = difference of intercepts between middle infielders - remaining group
# beta3 = difference of intercepts between outfielders - remaining group
# beta4 = difference of slopes between middle infielders - remaining group
# beta5 = difference of slopes between outfielders - remaining group

# The t-tests for beta4 and beta5 suggest that the differences in slopes 
# are not statistically significant. 

# Part D.
anova(fit.nointeraction, fit.interaction)  # Test difference in slopes (joint F-test)

# The F-test above suggest that we can drop the interaction terms from the model, 
# so the equal slopes assumption is appropriate. The no-interaction model is enough 
# (assuming we are not interested in other variables).
