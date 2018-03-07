# H.W.5 Code
# Pradeep Singh

# read the data
data <- read.csv(file.choose(), header = TRUE)
attach(data)

# divide the Pos column dependng upon position of player in diff levels
data.h <- ifelse((data$Pos == "LF") | (data$Pos == "CF") | (data$Pos == "RF"), 
                "outfielders", ifelse((data$Pos == "SS") | (data$Pos == "2B"), 
                                      "Mid-infielders", "others"))

# creating a factor variable named "type"
type = factor(data.h)

# preparing (cleaning) data for aov func
cleandata = data.frame(HR, type)

# make a boxplot using "cleandata"
boxplot(HR ~ type, xlab="Positions", ylab="Home Runs", data=cleandata)

# 
analysis = aov(HR ~ type, data= cleandata)
summary(analysis)  # F-test for equality of means


durbinWatsonTest(analysis) # Test independence 
bartlett.test(HR ~ type, data=cleandata) # Test equality of variances 

# make a stripchart
attach(cleandata)
group.means <- tapply(HR, type, mean)
group.sds <- tapply(HR, type, sd)
group.sizes <- tapply(HR, type, length)
se <- group.sds / sqrt(group.sizes)
stripchart(HR ~ type, method="jitter", jitter=0.05, pch=16, vert=T)
arrows(1:3, group.means -  se, 1:3, group.means + se, angle = 90, code = 3, length= 0.1 )
lines(1:3, group.means, type = "b", cex = 1.5, col = "red")
