# Dataset:

-- MLB2015data.csv
The given data set "MLB2015data.csv" consist of following variables: Player name, Team, Position, Home Runs, etc.

-- cleanPIMA.txt

The National Institute of Diabetes and Digestive and Kidney Diseases conducted a study on 768 adult female Pima Indians (at least 21 years old) living near Phoenix. The following variables were recorded: regnancies, glucose, diastolic, triceps, insulin, bmi, age, test.

# Problem: one-way-anova.R
* Create a factor variable called type with three levels: mid-infielders, outfielders, and other. The positions LF, CF, RF represent left, center, and right -- "Outfielders". Those who play the SS (shortstop) and 2B positions are "Mid- Infielders". The remaining positions should be in the “Other” group.
* Model the data "HR" (home runs) by "type" using a one-way anova model and test the hypothesis of equality of means for the variable HR. Interpret the results. 
* Using a non-parametric test, test the equality of means for the variable HR.
* Is the equality of variances assumption valid? Perform an appropriate test and interpret the results.
* Create a stripchart that shows the observations, the sample means, and a range that covers the observations that are one (sample) standard deviation from the (sample) mean.

# Problem: one-way-anova2.R
* Model the data diastolic by group using a one-way anova model and test the hypothesis of equality of means for the variable diastolic. Interpret the results.
* Is the equality of variances assumption valid?  Perform an appropriate test and interpret the results. Comment on the validity of the conclusions in part (A).
* Use a non-parametric test to test if the distribution of diastolic is the same for each group. Interpret the results and discuss their validity.
* Create a stripchart that shows the observations, the sample means, and 95% CIs for the (population) group means.
* Construct and interpret 95% confidence intervals for all pairwise mean differences. Assume equal variances. Discuss any possible issues with these confidence intervals.
