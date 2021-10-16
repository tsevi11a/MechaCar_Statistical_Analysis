#loading the dplyr package
library(dplyr) 


#DELIVERABLE 1
#import the MechaCar_mpg.csv file
MechaCar_table <- read.csv(file = 'MechaCar_mpg.csv', check.names = F, stringsAsFactors = F) 

#linear regression (passing all columns; mpg=dependent variable)
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MechaCar_table)

#determine the p-value and the r-squared value for the linear regression model
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MechaCar_table))


#DELIVERABLE 2
#import the Suspension_Coil.csv file
SuspensionCoil_table <- read.csv(file = 'Suspension_Coil.csv', check.names = F, stringsAsFactors = F) 

#create a dataframe using the summarize() function to get the mean, median, variance, and standard deviation of the suspension coil’s PSI column
total_summary <- SuspensionCoil_table %>% summarize(Mean_PSI=mean(PSI), Median_PSI=median(PSI), Variance=var(PSI), Std_Dev=sd(PSI), .groups='keep')

#create a dataframe using the group_by() and the summarize() functions to group each manufacturing lot by the mean, median, variance, and standard deviation of the suspension coil’s PSI column
lot_summary <- SuspensionCoil_table %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), Std_Dev=sd(PSI), .groups='keep')


#DELIVERABLE 3
#determine if the PSI across all manufacturing lots is statistically different from the population mean of 1,500 
t.test(SuspensionCoil_table$PSI, mu=1500)

#determine if the PSI for each manufacturing lot is statistically different from the population mean of 1,500
Lot1_table <- subset(SuspensionCoil_table,Manufacturing_Lot=="Lot1")
Lot2_table <- subset(SuspensionCoil_table,Manufacturing_Lot=="Lot2")
Lot3_table <- subset(SuspensionCoil_table,Manufacturing_Lot=="Lot3")

t.test(Lot1_table$PSI, mu=1500)
t.test(Lot2_table$PSI, mu=1500)  
t.test(Lot3_table$PSI, mu=1500)
             
