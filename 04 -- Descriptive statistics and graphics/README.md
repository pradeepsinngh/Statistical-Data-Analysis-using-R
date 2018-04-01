# Dataset:
* health_dataset.txt

The health_dataset.txt contains the following variables: age, gender,(childhood) IQ, systolic blood pressure (SBP), diastolic blood pressure (DBP), choles-terol level (CHOL), high density lipoprotein (HDL), low density lipoprotein (LDL), and body mass index (BMI).


* cleanPIMA.txt

The National Institute of Diabetes and Digestive and Kidney Diseases conducted a study on 768 adult female Pima Indians (at least 21 years old) living near Phoenix. The following variables were recorded: regnancies, glucose, diastolic, triceps, insulin, bmi, age, test.

# Problem 1: (descriptive_stat1.R)
* Create a factor variable (SBP.H) that records whether or not the subjects have high systolic blood pressure. Subjects with SBP >= 140 are considered to have high SBP. Levels of SBP should be "High SBP" and "Normal SBP".
* Create a freq table for the variable  SBP.H.
* Create a 2-by-2 frequency table for SBP.H (rows) and GENDER (columns). What percanetage of males and females have high sysotlic blood pressure? Obtain a 2-by-2 table that shows these percentages.
* Create a piechart for the variable SBP.H.
* Create stacked and clustered bar charts for SBP.H by gender.

# Problem 2: descriptive_stat2.R)
* Create a factor variable called SBP.H as you have done in problem 1 above.
* Create side-by-side histograms and boxplots of DBP by SBP.H.
* Find appropriate summary statistics for DBP. Find the same summary statistics (of DBP) separately for subjects with high SBP and for subjects with normal SBP.
* Create a variable called DBP.H that records whether or not the subjects have high diastolic blood pressure (DBP ≥ 90). The levels of the variable DBP.H should be “High DBP” and “Normal DBP”.
* Create a 2-by-2 frequency table for SBP.H (rows) and DBP.H (columns). 
* What percent of subjects that have high systolic blood pressure also have high diastolic blood pressure? 
* What percent of subjects that have normal systolic blood pressure also have normal diastolic blood pressure? Obtain a 2-by-2 table that shows these percentages.

# Problem 3: descriptive_stat3.R
-- (Use the dataset mycars in the following questions.)
* Create a new data set called mycars that only includes mpg, hp, wt, and am. Replace the am column (transmission type)with a  column called transmission with entries “automatic” or “manual”. 
* Define transmission as a factor with the appropriate labels. Rename the wt column and call it weight .In other words, clean and relabel data.
* Create histograms of the variables mpg, hp, and weight.
* Provide summary statistics for the variables in the dataset mycars. Provide also summary statistics by transmission type.  
* Calculate the sample standard deviation of each variable by transmission type.
* Export the output of the summary statistics to a .txt file.
* Split the hp data by transmission type.
* Sort the data by transmission type and then by mpg (increasing order).
* Consider a simple linear regression model with y=hp and x=mpg. Plot the (x,y)-pairs together with the Least-Squares line.
* For each type of transmission (manual vs automatic), plot the two regression lines in the same plot. Make the pairs for manual cars blue and those for automatic cars red.
* Export the regression plot in part to a .pdf file.

# Problem 4: descriptive_stat4.R
* Using the number of pregnancies in cleanPIMA.txt, create a factor variable called group with three levels: low, mid (or medium), and high. Women with 3 pregnancies or less are in the “low” group, those with 4 - 7 pregnancies are in the “mid” group, and those with 8 or more are in the “high” group.
* Create a frequency table for the variable group.
* Create a 3-by-2 frequency table for group (rows) and test (columns). What percent of the women in the low group tested positive for diabetes? Obtain a table that shows this type of percentage for the low group as well as the mid and high groups.
* Create piecharts for the variables group and test.
* Create stacked and clustered bar charts for test by group.
* Create histograms and boxplots of diastolic by group.
