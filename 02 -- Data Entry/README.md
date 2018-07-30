## How to read data files in R?

Reading data in R is fairly simple and staright forward. R provides you functions and packages that can easily read different kinds of data sets (files) with just a single line of code.

### Reading from Text file:
```
# read.table -- funcation to read text file
# mydata.csv -- address of your data files inside the " "
# header     -- TRUE/ FALSE if you want to keep heading of your
#               columns and vice-versa

mydata <- read.table("/mydata.csv", header=TRUE)
```

### Reading from Excel file:
```
# read.xlsx -- funcation to read excel file
# myexcel.xlsx -- address of your data files inside the " "

library(xlsx)
mydata <- read.xlsx("/myexcel.xlsx", 1)
```
