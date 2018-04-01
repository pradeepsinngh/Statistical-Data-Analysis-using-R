# STAT 596 -- Take Home Exam
# Pradeep Singh

mtcars
attach(mtcars)

# creating a new data set -- "my cars"
mycars <- data.frame(mpg, hp, wt, am)
attach(mycars)

# rename the 3rd and 4th column
colnames(mycars)[4] <- "transmission"
colnames(mycars)[3] <- "weight"
attach(mycars)

# transmission as a factor with levels -- Automatic & Manual
transmission <- ifelse(transmission == "1", "Automatic", "Manual")
transmission = factor(transmission)
levels(transmission)
#----------------------------------------------------

break.pt <- seq(from=0, to=350, by=5)

# histogram of variables -- "mpg", "hp", "weight"
par(mfrow=c(1,3))
hist(mpg, main = "Histogram of MPG", breaks = break.pt,
     xlab = "MPG",col = "yellow", ylim=c(0, 15))
hist(hp, main = "Histogram of HP", breaks = break.pt,
     xlab = "HP",col = "blue", ylim=c(0, 15))
hist(weight, main = "Histogram of Weight", breaks = break.pt,
     xlab = "Weight",col = "red", ylim=c(0, 15))
dev.off()

#-------------------------------------------------
# summary statistics for "mycars"
summary(mycars)
# summary stat by transmission type -- automatic and manual
by(mycars, transmission, summary)

#----------------------------------------------------

# function to calculate S.D. of a given vector
myoutput <- function(x){ 
  myvector <- c(sd(x))
  names(myvector) <- c("sample sd")
  return(myvector) }

# sample S.D. of each variables by transmission type
# variable: mpg
tapply(mpg, transmission, myoutput)

# variable: hp
tapply(hp, transmission, myoutput)

# variable: weight
tapply(weight, transmission, myoutput)

# variable: am = transmission
tapply(am, transmission, myoutput)

#-----------------------------------------------------

# export the summary() O/P in a .txt file
summary_stat <- summary(mycars)
capture.output(summary_stat, file = "summary_stat.txt")

# summary stat by transmission type -- automatic and manual
summary_stat_group <- by(mycars, transmission, summary)
capture.output(summary_stat_group, file = "summary_stat_group.txt")

#-----------------------------------------------------

# split hp data by transmission
split(hp, transmission)

#--------------------------------------------------

# sort the data by tranmission type and mpg (increasing order)
sort(mpg,transmission, decreasing = FALSE)
sort(hp,transmission, decreasing = FALSE)
sort(weight,transmission, decreasing = FALSE)

sort(mycars$transmission, mpg, decreasing = FALSE)
sort(hp, mpg, decreasing = FALSE)
sort(weight, mpg, decreasing = FALSE)

#------------------------------------------------------

# Plotting (x,y)-pairs together with Least-Sqaures line
y <- hp
x <- mpg

# exporting the regression plot to PDF
pdf("Regression_plot.pdf",width=6, height=3) 
plot(x,y, xlab = "MPG", ylab = "HP", 
     main = "Linear relationship by type of Transmision")
fit <- lm(y ~ x)
abline(fit, col = "red")
dev.off()

plot(x,y, xlab = "MPG", ylab = "HP", 
     main = "Linear relationship by type of Transmision (Automatic vs Manual)")
points(x[transmission=="Automatic"], y[transmission=="Automatic"] , col="red", pch = 2, cex = 0.5) 
points(x[transmission=="Manual"], y[transmission=="Manual"] , col="blue", pch = 3, cex = 0.5)
fit.A <- lm(y ~ x, subset = transmission=="Automatic")
fit.M <- lm(y ~ x, subset=transmission=="Manual")

points(y[transmission=="Automatic"], x[transmission=="Automatic"] , col="red", pch = 2, cex = 0.5) 
points(y[transmission=="Manual"], x[transmission=="Manual"] , col="blue", pch = 3, cex = 0.5)
abline(fit.A, col="red")
abline(fit.M, col="blue")
legend("topright", c("Automatic", "Manual"), col=c("red", "blue"), 
       pch = c(2,3), title = "Cars Type", cex = 1)

#-----------------------------------------------------------

# 

