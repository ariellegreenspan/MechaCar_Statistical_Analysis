library(dplyr)
mecha_df <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data = mecha_df) #create linear regression
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data = mecha_df)) #create summary

suspension_coil <-read.csv('Suspension_Coil.csv', check.names=F,stringsAsFactors = F) #create dataframe
total_summary <- suspension_coil %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep') #create total summary table with multiple columns
lot_summary <- suspension_coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep') #create lot summary table with multiple columns
t.test(suspension_coil$PSI,mu=1500) #compare sample versus population mean
t.test(subset(suspension_coil$PSI,suspension_coil$Manufacturing_Lot== "Lot1"),mu=1500) #t-test for lot1 
t.test(subset(suspension_coil$PSI,suspension_coil$Manufacturing_Lot== "Lot2"),mu=1500) #t-test for lot2 
t.test(subset(suspension_coil$PSI,suspension_coil$Manufacturing_Lot== "Lot3"),mu=1500) #t-test for lot3
