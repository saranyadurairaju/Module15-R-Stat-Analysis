#Loading the Package
library(dplyr)

## Deliverable 1: Linear Regression to Predict MPG

# 4. Importing the csv file
mechaCar_table <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)

# 5. Multi linear Regression
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mechaCar_table)

# 6. Summary statistics
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mechaCar_table))


## Deliverable 2 Summary Statistics Data

#2. Import and read in the Suspension_Coil.csv file as a table
suspnCoil_table <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)

#3. Summary Statistics of the suspension coil's PSI column
total_summary <- suspnCoil_table %>% summarize(Mean_PSI=mean(PSI),
                                          Median_PSI=median(PSI),
                                          Var_PSI=var(PSI),
                                          Std_Dev_PSI=sd(PSI),
                                          Num_Coil=n(), .groups = 'keep') #create summary table

#4. Create a lot_summary using the group_by() and the summarize() functions to group each manufacturing lot. 
lot_summary <- suspnCoil_table %>% group_by(Manufacturing_Lot) %>% summarize(Mean_PSI=mean(PSI),
                                               Median_PSI=median(PSI),
                                               Var_PSI=var(PSI),
                                               Std_Dev_PSI=sd(PSI),
                                               Num_Coil=n(), .groups = 'keep') #create summary table for each Lot

## Deliverable 3: T-Tests on Suspension Coils

#1. use t.test() to determine if the PSI across ALL lots is statistically different from the pop. mean of 1,500 PSI.
t.test(suspnCoil_table$PSI,mu=1500)


#2. Use t.test() function 3 more times with subset() to determine if PSI for each manufacturing lot is statistically different from the pop. mean of 1,500 PSI
lot1 <- subset(suspnCoil_table, Manufacturing_Lot=="Lot1")
lot2 <- subset(suspnCoil_table, Manufacturing_Lot=="Lot2")
lot3 <- subset(suspnCoil_table, Manufacturing_Lot=="Lot3")

t.test(lot1$PSI,mu=1500)
t.test(lot2$PSI,mu=1500)
t.test(lot3$PSI,mu=1500)

# log10 was not used as the data was not skewed and did not need any smoothing

##Additional Analysis

#box plot: PSI Whole lot
plt1 <- ggplot(suspnCoil_table,aes(y=PSI)) #import dataset into ggplot2
plt1 + geom_boxplot() #add boxplot

#box plot: PSI each individual Lot
plt2 <- ggplot(suspnCoil_table,aes(x=Manufacturing_Lot,y=PSI)) #import dataset into ggplot2
plt2 + geom_boxplot()


#For (1) Eliminate the independent variables that have little impact on predicting mpg to see impact:
lm(mpg ~ vehicle_length + ground_clearance, data=mechaCar_table)
summary(lm(mpg ~ vehicle_length + ground_clearance, data=mechaCar_table)) 



