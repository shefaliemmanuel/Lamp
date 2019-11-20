# Welcome to Lamp!

This is a repository for a team of students in the CSCI 362 Software Engineering Fall 2019 Cohort. 

Topic: Glucosio

Instructions to run script for testing:
1) Clone project to computer
2) Open terminal
3) Navigate to Lamp-master/TestAutomation/scripts
4) Use command './runAllTests.sh
5) Testing should complete and output to html file in browser

Instruction to create your own test case
1) Create .txt file with name [testcase#].txt with format as displayed in Deliverable #2 or seen here (example):
  _______________________
  1

  kgToLb()

  0.0

  0.0
  
  Requirement
  _______________________

  The file should only contain those five items...the first line is the test number, second line is the method, third line is the expected    output, fourth line is input value, fifth line is requirement of method tested.

2) Need to create a driver for the method/test number you are going to test
3) Our team has written drivers that are functional with specific methods, to use:
4) Navigate to testCasesExecutables,
  Drivers 1-3 are for kgToLb()
  Drivers 4-8 are for lbToKG()
  Drivers 9-13 are for A1cToGlucose()
  Drivers 14-17 glucoseToA1C()
  
  Choose the method you want to test, create new .java file named "Driver[testNo].java" and copy and paste code from the chosen driver.     Change class name from "Driver[testNo]" to "Driver[testNo]" 
  
  The number in [testcase#].txt must match with the class name Driver# in order to run.
  
5) Save the .java file in testCasesExecutables and execute ./runAllTests.sh




(May need to download Gradle components...)
