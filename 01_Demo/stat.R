#Stat- Qualitative test for normality

ggplot(mtcars,aes(x=wt)) + geom_density() #visualize distribution using density plot

head(mtcars)

view(mtcars)

#Quantitative Test

shapiro.test(mtcars$wt)

#Population Dataset

population_table <- read.csv('used_car_data.csv',check.names = F,stringsAsFactors = F) #import used car dataset
plt <- ggplot(population_table,aes(x=log10(Miles_Driven))) #import dataset into ggplot2
plt + geom_density() #visualize distribution using density plot

#Sample Dataset

sample_table <- population_table %>% sample_n(50) #randomly sample 50 data points
plt <- ggplot(sample_table,aes(x=log10(Miles_Driven))) #import dataset into ggplot2
plt + geom_density() #visualize distribution using density plot

#One-sided T-Test

t.test(log10(sample_table$Miles_Driven),mu=mean(log10(population_table$Miles_Driven))) #compare sample versus population means

#Two-sided T-Test

sample_table <- population_table %>% sample_n(50) #generate 50 randomly sampled data points
sample_table2 <- population_table %>% sample_n(50) #generate another 50 randomly sampled data points

t.test(log10(sample_table$Miles_Driven),log10(sample_table2$Miles_Driven)) #compare means of two samples

#Paired T-Test

mpg_data <- read.csv('mpg_modified.csv') #import dataset
mpg_1999 <- mpg_data %>% filter(year==1999) #select only data points where the year is 1999
mpg_2008 <- mpg_data %>% filter(year==2008) #select only data points where the year is 2008

#pair T-Test for two samples

t.test(mpg_1999$hwy,mpg_2008$hwy,paired = T) #compare the mean difference between two samples


### The analysis of variance (ANOVA) test

#"Is there any statistical difference in the horsepower of a vehicle based on its engine type?"

#cyl is a numerical interval vector, not a categorical vector, we must clean our data 

mtcars_filt <- mtcars[,c("hp","cyl")] #filter columns from mtcars dataset
mtcars_filt$cyl <- factor(mtcars_filt$cyl) #convert numeric column to factor

view(mtcars_filt)

aov(hp ~ cyl,data=mtcars_filt) #compare means across multiple levels

summary(aov(hp ~ cyl,data=mtcars_filt))

### Correlation Coefficient -> r-value

head(mtcars)

plt <- ggplot(mtcars,aes(x=hp,y=qsec)) #import dataset into ggplot2

plt + geom_point() #create scatter plot

cor(mtcars$hp,mtcars$qsec) #calculate correlation coefficient

#correlation -Example 2 -> r-value

used_cars <- read.csv('used_car_data.csv',stringsAsFactors = F) #read in dataset
head(used_cars)

plt <- ggplot(used_cars,aes(x=Miles_Driven,y=Selling_Price)) #import dataset into ggplot2
plt + geom_point() #create a scatter plot

cor(used_cars$Miles_Driven,used_cars$Selling_Price) #calculate correlation coefficient

#correlation matrix - pairwise comparison

used_matrix <- as.matrix(used_cars[,c("Selling_Price","Present_Price","Miles_Driven")]) #convert data frame into numeric matrix
cor(used_matrix)

#predict one variable given another: use linear regression!

lm(qsec ~ hp,mtcars) #create linear model

#qsec = -0.02hp + 20.56. ( for p-value and r-squared value use the summary() function)

summary(lm(qsec~hp,mtcars)) #summarize linear model

#Plotting and linear line
model <- lm(qsec ~ hp,mtcars) #create linear model

yvals <- model$coefficients['hp']*mtcars$hp +
  model$coefficients['(Intercept)'] #determine y-axis values from linear model

#linear model over our scatter plot

plt <- ggplot(mtcars,aes(x=hp,y=qsec)) #import dataset into ggplot2
plt + geom_point() + geom_line(aes(y=yvals), color = "red") #plot scatter and linear model

#(quarter-mile time was not adequately predicted from just horsepower)

#Multi linear model

lm(qsec ~ mpg + disp + drat + wt + hp,data=mtcars) #generate multiple linear regression model

summary(lm(qsec ~ mpg + disp + drat + wt + hp,data=mtcars)) #generate summary statistics

#chisq() test 

table(mpg$class,mpg$year) #generate contingency table

tbl <- table(mpg$class,mpg$year) #generate contingency table

chisq.test(tbl) #compare categorical distributions


