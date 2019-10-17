#!/bin/bash

#/TestAutomation/project/android/app/src/main/java/org/glucosio/android/tools

#navigate to folder location of driver
#cd ../project/android/app/src/main/java/org/glucosio/android/tools

#go to location of text files

#java -cp .org.glucosio.android.tools.Driver'input X input Y input Z'

#gradle build

#loop to process all test files
cd ../testCases
for i in $(seq 1 3); do 

    #parse text file to save variables and display oracle
    #rm command will remove current info from file before adding new
    rm sampletest$i.txt 2>/dev/null

    FIRSTLINE=`sed -n 1p testcase$i.txt`
    echo "Test Case Number: " $FIRSTLINE$'\n' >> sampletest$i.txt


    SECONDLINE=`sed -n 3p testcase$i.txt`
    echo "Method Signature: " $SECONDLINE$'\n' >> sampletest$i.txt

    THIRDLINE=`sed -n 5p testcase$i.txt`
    echo "Input Value: " $THIRDLINE$'\n' >> sampletest$i.txt


    FOURTHLINE=`sed -n 7p testcase$i.txt`
    echo "Expected Output: " $FOURTHLINE$'\n' >> sampletest$i.txt
   
    cd ../testCasesExecutables 
    #copy driver$i.java to correct project location prior to compiling
    
    cp driver$i.java ../project/android/app/src/main/java/org/glucosio/android/tools
    #compile driver & compile the .java file that contains the method we want to test this case
    
    PWD="$(pwd)"
    #javac -cp ${PWD}/project/android/app/src/main/java/org/glucosio/android/tools project/android/app/src/main/java/org/glucosio/android/tools/driver$i.java project/android/app/src/main/java/org/glucosio/android/tools/GlucosioConverter.java
    cd ..
    javac ./project/android/app/src/main/java/org/glucosio/android/tools/driver$i.java ./project/android/app/src/main/java/org/glucosio/android/tools/GlucosioConverter.java
    ## this requires navigation to the appropriate directory to function. Above command will execute properly.
    #javac driver$i.java GlucosioConverter.java
    

    #navigate to folder location to compile (Have not figured out how to do this from current directory)
    cd project/android/app/src/main/java
    

    #pass in method name and input commands to corresponding driver
    #sends output to the reports folder (final file name not identified)
    #SECONDLINE is method signature, THIRDLINE is input value
    java -cp . org.glucosio.android.tools.driver$i "$FIRSTLINE" "$SECONDLINE" "$THIRDLINE" >> ../../../../../../reports/output.txt

    #navigate back to scripts folder
    cd ../../../../../../testCases
       
    #display actual

    #save to text file

#end for loop
done
    cd ../scripts
    #open web browser with final expected and actual output
