run_analysis <- function(){
## Reading the given Data
  library(dplyr)
  library(tidyr)
  
  
  Xtrain <- read.table("Schreibtisch/Coursera III/UCI HAR Dataset/train/X_train.txt")
  ytrain <- read.table("Schreibtisch/Coursera III/UCI HAR Dataset/train/y_train.txt")
  sub_train <- read.table("Schreibtisch/Coursera III/UCI HAR Dataset/train/subject_train.txt")
  Xtest <- read.table("Schreibtisch/Coursera III/UCI HAR Dataset/test/X_test.txt")
  ytest <- read.table("Schreibtisch/Coursera III/UCI HAR Dataset/test/y_test.txt")
  sub_test <- read.table("Schreibtisch/Coursera III/UCI HAR Dataset/test/subject_test.txt")
      feature <-read.table("Schreibtisch/Coursera III/UCI HAR Dataset/features.txt")
  
## Fill in the Labels into the dataframes 
  
  feature <- cbind(data.frame("Person", "Activity"),t(feature[2]))
  
  ytrain<-replace(ytrain, (ytrain==1), "WALKING") %>%
  replace((ytrain==2), "WALKING_UPSTAIRS")  %>%
  replace((ytrain==3), "WALKING_DOWNSTAIRS") %>%
  replace((ytrain==4), "SITTING") %>%
  replace((ytrain==5), "STANDING") %>%
  replace((ytrain==6), "LAYING")

  
  ytest<-replace(ytest, (ytest==1), "WALKING")  %>%
  replace((ytest==2), "WALKING_UPSTAIRS")  %>%
  replace((ytest==3), "WALKING_DOWNSTAIRS") %>%
  replace((ytest==4), "SITTING") %>%
  replace((ytest==5), "STANDING") %>%
  replace((ytest==6), "LAYING")
  
  ## Merge the Data together
  
  Train <- cbind(sub_train, ytrain, Xtrain)
  test <- cbind(sub_test, ytest, Xtest)
  
  colnames(Train) <- t(feature)
  colnames(test) <- t(feature)
  FullData <- rbind(test,Train)
  
  ## Extract all Values with "mean" in it
  
  MeanSdtIndex <- grepl("mean|std|Person|Activity", t(feature))
  MeanSdt <- FullData[MeanSdtIndex]
  
  
  ## Create tidy data by building the avarege of each Persons/ activities Values
  TidyData <- MeanSdt[FALSE,]
  
  for (i in 1:30){
  
    
    A <- summarise_each(MeanSdt[MeanSdt$Person == i & MeanSdt$Activity=="WALKING",], funs = mean)
    A[2] <- "WALKING"
    B <- summarise_each(MeanSdt[MeanSdt$Person == i & MeanSdt$Activity=="WALKING_UPSTAIRS",], funs = mean)
    B[2] <- "WALKING_UPSTAIRS"
    C <- summarise_each(MeanSdt[MeanSdt$Person == i & MeanSdt$Activity=="WALKING_DOWNSTAIRS",], funs = mean)  
    C[2] <- "WALKING_DOWNSTAIRS"
    D <- summarise_each(MeanSdt[MeanSdt$Person == i & MeanSdt$Activity=="SITTING",], funs = mean) 
    D[2] <-"SITTING"
    E <- summarise_each(MeanSdt[MeanSdt$Person == i & MeanSdt$Activity=="STANDING",], funs = mean) 
    E[2] <- "STANDING"
    F <- summarise_each(MeanSdt[MeanSdt$Person == i & MeanSdt$Activity=="LAYING",], funs = mean) 
    F[2] <- "LAYING"
    
    TidyData <- rbind(TidyData, A,B,C,D,E,F)
    
  }
  
  TidyData
  }