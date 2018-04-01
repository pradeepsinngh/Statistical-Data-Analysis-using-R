# Dataset:
* health_dataset.txt

The health_dataset.txt contains the following variables: age, gender,(childhood) IQ, systolic blood pressure (SBP), diastolic blood pressure (DBP), choles-terol level (CHOL), high density lipoprotein (HDL), low density lipoprotein (LDL), and body mass index (BMI).

* cleanPIMA.txt

The National Institute of Diabetes and Digestive and Kidney Diseases conducted a study on 768 adult female Pima Indians (at least 21 years old) living near Phoenix. The following variables were recorded: regnancies, glucose, diastolic, triceps, insulin, bmi, age, test.

# Problem: one_sample_test.R -- Perform hypothesis test (t-test)
* For the variables SBP, HDL, and CHOL: Test if there are gender (mean) differences.
* Test if the equal SD (variance) assumption is appropriate.
* Is the population mean of SBP greater than that of DBP?
* Calculate the sample size (in each group) required to detect a mean difference of 5 HDL points with a power of 0.90.

# Problem: one_sample_test2.R -- Perform hypothesis test (t-test)
-- perform the following tasks for the variable log(insulin)

* Find and interpret 95% confidence intervals for the population mean (in the log scale). Can you provide a confidence interval for the population median in the original scale?
* Find and interpret 95% confidence intervals for the mean difference (in the log scale) between the “negative” & “positive”  (test) groups. Can you provide a confidence interval for the ratio of the population medians in the original scale?
* Test if there are mean differences between the “negative” and “positive” groups. Use α = 0.05 and assume the population SDs are (nearly) equal.
* Test if the equal SDs (variances) assumption is appropriate. (log scale)
* Test  group  differences  using  a  non-parametric  approach. Clearly state your null and alternative hypotheses, and give the p-value and conclusion of the test.  Use α= 0.05.
