### Deliverable 1 ###

# import MechaCar_mpg.csv and read into a dataframe

  MechaCar <- read.csv(file='Data/MechaCar_mpg.csv')

# Perform linear regression on all six variables

  # Learn the name of the six variables
  (ls(MechaCar))

  # create and summarize linear regression model
  summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,MechaCar))
  
  # remove any extraneous data in model
  summary(lm(mpg ~ vehicle_length + ground_clearance + AWD,MechaCar))
  
  # p-value = 9.854e-12
  # r-squared = 0.6891
  
  # See README for analysis

### Deliverable 2 ###

  # Import and read in the Suspension_Coil.csv file as a table
  SusCoil <- read.csv(file="Data/Suspension_Coil.csv")
  
  #Write an RScript that creates a total_summary dataframe using the summarize() function to get the mean, median, variance, and standard deviation of the suspension coil's PSI column.
  
  total_summary <- SusCoil %>% summarize(Mean_PSI=mean(PSI),
                                            Median_PSI=median(PSI),
                                            Var_PSI=var(PSI),
                                            Std_Dev_PSI=sd(PSI),
                                            Num_Coil=n(), .groups = 'keep') 
  
  # Create a lot_summary dataframe using the group_by() and the summarize() functions to group each manufacturing lot by the mean, median, variance, and standard deviation of the suspension coil's PSI column.
  lot_summary <- SuSCoill  %>% group_by(Manufacturing_Lot) %>% summarize(Mean_PSI=mean(PSI),
                                                                           Median_PSI=median(PSI),
                                                                           Var_PSI=var(PSI),
                                                                           Std_Dev_PSI=sd(PSI),
                                                                           Num_Coil=n(), .groups = 'keep')
  
 ### Deliverable 3 ###
  
  # Use t.test() function to determine if the PSI across all manufacturing lots is statistically different from the population mean of 1,500 pounds per square 
  
  #Find number of unique manufacturing lots
  ls(SusCoil)
  unique(SusCoil[[2]])
  
  # Compare sample vs. population means of 1500
  t.test(SusCoil$PSI,mu=1500) #compare sample versus population means
  
  # Compare sample vs population means of 1500 Per lot
    #Make ssubsets
    lot1 <-subset(SusCoil, Manufacturing_Lot=="Lot1")
    lot2 <-subset(SusCoil, Manufacturing_Lot=="Lot2")
    lot3 <-subset(SusCoil, Manufacturing_Lot=="Lot3")
  
    #Run t.tests(
    t.test(lot1$PSI,mu=1500)
    t.test(lot2$PSI,mu=1500)
    t.test(lot3$PSI,mu=1500)