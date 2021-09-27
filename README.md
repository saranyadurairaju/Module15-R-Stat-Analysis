# AutosRUs MechaCar Analysis using R & Statistics

In this project we are using statistics and hypothesis testing to analyze a series of datasets from the automotive industry using R programming language. R is built for statistics. R's syntax makes it easy to create complex statistical models with just a few lines of code. Since so many statisticians use and contribute to R packages, you're likely to be able to find support for any statistical analysis you need to perform. Below are few advantages of R:

1) Open Source.
2) Platform Independent.
3) Machine Learning Operations.
4) The array of packages. 
5) Statistics.

## Overview of Project

Jeremy is working for AutosRUs’ and he was approached by the management team for the newest prototype, the MechaCar. It is suffering from production troubles that are blocking the manufacturing team’s progress. To fix this, Jeremy and the data analytics team is deciding to do the following:

•	Perform multiple linear regression analysis to identify which variables in the dataset predict the mpg of MechaCar prototypes

•	Collect summary statistics on the pounds per square inch (PSI) of the suspension coils from the manufacturing lots

•	Run t-tests to determine if the manufacturing lots are statistically different from the mean population

•	Design a statistical study to compare vehicle performance of the MechaCar vehicles against vehicles from other manufacturers. 

**For this Analysis we will come up with three technical deliverables and a proposal for further statistical study. So, we are submitting the following by end of this project:**

•	Data Source: MechaCar_mpg.csv and Suspension_Coil.csv

•	Data Tools: tidyverse, dplyr, ggplot2 and MechaCarChallenge.RScript.

•	Software: RStudio and R


## Deliverable 1 : Linear Regression to Predict MPG

The MechaCar_mpg.csv dataset contains mpg test results for 50 prototype MechaCars. The MechaCar prototypes were produced using multiple metrics, such as vehicle length, vehicle weight, spoiler angle, drivetrain, and ground clearance for each vehicle. We need to design a linear model that predicts the mpg of MechaCar prototypes using the variables from the MechaCar_mpg.csv file. Then, we are writing a short interpretation of the multiple linear regression results.

### Technical Analysis

In this we are Importing and reading the MechaCar_mpg.csv file as a dataframe. Then we need to perform linear regression using the lm() function. In the lm() function, we are passing all six variables (i.e., columns), and add the dataframe as the data parameter. Then using the summary() function, we will find the p-value and the r-squared value for the linear regression model.

![image](https://user-images.githubusercontent.com/85472349/134844805-3672ed80-78c4-468b-8690-847d472f8903.png)

### Statistical Summary

![image](https://user-images.githubusercontent.com/85472349/134844968-483319bf-2a4e-4058-ab0f-ed7e0fd55d56.png)

### Written Summary 

From the above Statistical summary results we can say that:

1. There were two variables that provided a non-random amount of variance: The vehicle length and the ground_clearance. Both of these have extremely small p-value meaning that they had a high level of significant impact on Miles per gallon. Conversely, the vehicle weight, spoiler angle, and AWD have p-Values that indicate a random amount of variance with the dataset.

2. The p-Value for this model, p-Value: 5.35e-11, is much smaller than the assumed significance level of 0.05%. This indicates there is sufficient evidence to reject our null hypothesis. Also, some of the independent variables had a significant effect on the dependent variable, which indicates that the slope of this linear model is not zero.

3. The main indicator of whether the linear model predicts the mpg of the MechaCar is the r-squared value. We have a value of 0.7149, which means that approximately 71% of all mpg predictions will be determined by this model. This tells that the model would be considered effective.


## Deliverable 2 : Summary Statistics on Suspension Coils

The MechaCar Suspension_Coil.csv dataset contains the results from multiple production lots. In this dataset, the weight capacities of multiple suspension coils were tested to determine if the manufacturing process is consistent across production lots. Using the knowledge of R, we are creating a summary statistics table to show:

* The suspension coil’s PSI continuous variable across all manufacturing lots
* The mean, median, variance, and standard deviation PSI metrics for each lot.

### Technical Analysis

We will import and read the Suspension_Coil.csv file as a table. Then using RScript we will create a total_summary dataframe using the summarize() function to get the mean, median, variance, and standard deviation of the suspension coil’s PSI column. 

![image](https://user-images.githubusercontent.com/85472349/134851723-98ca5994-bafc-4a37-8409-2deaeef01711.png)

* **The total_summary dataframe looks like below:**

![image](https://user-images.githubusercontent.com/85472349/134851596-6a4b95b8-7bd2-461a-9614-2c827e59aeb5.png)

* Below is the RScript that creates a lot_summary dataframe using the group_by() and the summarize() functions to group each manufacturing lot by the mean, median, variance, and standard deviation of the suspension coil’s PSI column.

![image](https://user-images.githubusercontent.com/85472349/134851839-f8381a3c-bcda-4d4c-920a-70be91efc1ff.png)

* **The lot_summary dataframe looks like below:**

![image](https://user-images.githubusercontent.com/85472349/134851965-d444e2f1-1d4d-4a67-b2e1-d8777a6b00ef.png)

### Written Summary 

From the above Statistical summary results we can say that:

**Total Manufacturing lot**

1. As per the summary table, the metrics values are Mean = 1498.78 Median = 1500 Variance = 62.29356 Standard deviation = 7.892627. So, the mean and median are nearly same. Hence we can say that the dataset has a normal distribution and it has zero skewness. 

2. A high standard deviation (7.89) indicates that the data points are spread out over a large range of values.

3. The design specifications for the MechaCar suspension coils dictate that the variance of the suspension coils must not exceed 100 pounds per inch. The variance in our summary table is 62.29356, which is below the specified value. Hence the current manufacturing data meet this design specification.

**Individual Manufacturing lots**

When looking at the individuals lots, the Lot1 and Lot2 lotas meet the design specification at a varaince of approximately 0.98 and 7.47 PSI (less than 100 PSI) respectively. But the third Lot's variance is 170.29 PSI, which is exceeding the design specification. Therefore, the manufacturing team should work with Lot3.

We can even create a simple box plot to illustrate the difference visually:

![image](https://user-images.githubusercontent.com/85472349/134854255-bd541dce-3405-48eb-b350-c2b00223ccff.png)


![image](https://user-images.githubusercontent.com/85472349/134854140-5eea645b-2cdd-44c9-b716-ce7c2d7c7046.png)


## Deliverable 3 : T-Test on Suspension Coils

Using our knowledge of R, we will perform t-tests to determine if all manufacturing lots and each lot individually are statistically different from the population mean of 1,500 pounds per square inch.

### Technical Analysis

1. We will writte a RScript using the t.test() function to determine if the PSI across all manufacturing lots is statistically different from the population mean of 1,500 pounds per square inch.

![image](https://user-images.githubusercontent.com/85472349/134854801-525e31b1-e91c-422c-88f2-b2169992ee8b.png)

2. In this we are writting a three more RScripts using the t.test() function and subset() argument to determine if the PSI for each manufacturing lot is statistically different from the population mean of 1,500 pounds per square inch.

![image](https://user-images.githubusercontent.com/85472349/134854993-b35dfde6-1e2a-4073-a5fd-d70359e8fc08.png)


### Statistical Summary

**Total Manufacturing Lot**

![image](https://user-images.githubusercontent.com/85472349/134855111-0041121d-5de6-4ca5-8ff2-1e853f48c7c0.png)

**Individual Manufacturing lots**

![image](https://user-images.githubusercontent.com/85472349/134855193-9cc227d9-6f27-4931-85cc-4a85ff1a5928.png)


![image](https://user-images.githubusercontent.com/85472349/134855239-fee5caf2-1693-40b3-821c-087cccddecf4.png)


![image](https://user-images.githubusercontent.com/85472349/134855283-b12da592-0b4f-4950-afed-1575ba304b09.png)


### Written Summary 

From the above t-test Summary Statistics we can conclude the below points:

1. The mean of PSI across all lots is 1498.78 and a p-Value is 0.06, which is higher than the significance level of 0.05. So, the data is considered to be normally distributed and there is no sufficient evidence to reject the null hypothesis. And we can conclude that the mean of all three of these manufacturing lots is statistically similar to the population mean of 1500.

2. Lot 1 sample has the true sample mean of 1500 and a p-Value of 1, which clearly indicate that we cannot reject the null hypothesis that there is no statistical difference between the observed sample mean and then population mean.

3. Lot 2 also has the same outcome with a sample mean of 1500.2, a p-Value of 0.61. So the null hypothesis cannot be rejected, and the sample mean and the population mean of 1500 are statistically similar.

4. Surprisingly Lot 3 has the sample mean of 1496.14 and the p-Value of 0.04, which is lower than the common significance level of 0.05. So we have a clear evidence to reject the null hypothesis that this sample mean and the population mean are not statistically similar.


## Deliverable 4: Design a Study Comparing the MechaCar to the Competition

In this section, we are going to compare performance of the MechaCar vehicles against performance of vehicles from other manufacturers. In this Study we are not performing any R testing, but we are doing a Statistical study that can quantify how the MechaCar performs against the competition. And the design has the below important studys:

•	A metric to be tested

•	A null hypothesis or an alternative hypothesis 

•	A statistical test and Data to test the hypothesis


### Metrics:

The metrics fuel efficiency, cost, Resale Value and maybe color options are important interms of customer pespective. By handling all these metrics properly, MechaCar can  outperforms the competition.


### Hypothesis:	


After considering the key factors, we can go deep into Fuel efficiency & Cost.

**Null Hypothesis (Ho):** The means of fuel efficiency (mpg) for all groups are equal.
**Alternative Hypothesis (Ha):** At least one of the means is different from all other groups.

**Null Hypothesis (Ho):** The cars are priced correctly based on its key factors. 
**Alternative Hypothesis (Ha):** The cars are NOT priced correctly based on its key factors.


### Statistical Test:

We are analysing that the mpg of MechaCars is better than other competitors. 

-> Hence we can use **ANOVA** tests to compare the means of a continuous numerical variable across a number of groups. A one-way ANOVA is used to test the means of a single dependent variable across a single independent variable with multiple groups (fuel efficiency(mpg) of different cars based on vehicle class). In addition to this we can use the ggplot2 library to show how the data are spread between different cars using a boxplot.

-> To determine the highest correlation between the selling price and the other factors, we can use a **multiple linear regression**. So, we will come to know all of the combination of factors which has the greatest impact on price.


### Data for Statistical Test:

For conducting all of this test, we would need a data from different individual cars to create a sample size of data in each class. Also, our data has to collected from all class type randomly. So that we will have a perfect data which is normally distributed and have enough sample data which are randomly collected. 


**So, Jeremy and the data analytics team has successfully reviewed the production data to help the manufacturing team and produced the report to management. AutosRUs’ upper management is very happy that this is going to help them improve their business! Success!!!** 

