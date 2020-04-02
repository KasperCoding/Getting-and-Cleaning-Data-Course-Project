Code Book Coursera III

  Xtrain
      Class = Dataframe
      Includes all the imported Values from X_Train.txt
      Rows: 7352
      Columns: 561
      
  ytrain 
      Class = Dataframe
      Includes all the imported values from ytrain.txt
      Rows: 7352
      Columns: 1
      
  sub_train
      Class = Dataframe
      Includes all the imported values from subject_train.txt
      Rows: 7352
      Columns: 1
      

  Xtest
      Class = Dataframe
      Includes all the imported Values from X_Test.txt
      Rows: 2947
      Columns: 561
      
  ytest
      Class = Dataframe
      Includes all the imported values from ytest.txt
      Rows: 2947
      Columns: 1
      
  sub_test
      Class = Dataframe
      Includes all the imported values from subject_test.txt
      Rows: 2947
      Columns: 1  

  feature
      Class = Dataframe
      Includes all the feature-names that has been measured
      Rows: 2
      Columns: 561 
      
  Train
      Class = Dataframe
      Inclued all the values from Xtrain with two extra columns for subject and activity
      Rows: 7352
      columns: 563
      
  Test
      Class = Dataframe
      Inclued all the values from Xtest with two extra columns for subject and activity
      Rows: 2947
      columns: 563
      
  FullData
      Class = Dataframe
      Is the combiation of the measurements froom Train-Data and Test-Data
      Rows:10299
      columns: 563
      
  MeanSdtIndex
      Class = Dataframe of Booleans
      Shows which of the features is a mean or a sdt
      Rows: 563
      Columns: 1
      
  MeanSdt
      Class = Dataframe 
      a compomised dataframe of all values that are means or sdts
      Rows: 10299
      Columns: 81
      
  TidyData
      Class = Dataframe
      a compormised dataframe tha inclued all means of the means and sdts tha heas been measured
      
      
      
      
      
    