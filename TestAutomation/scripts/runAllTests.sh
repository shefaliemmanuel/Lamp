#!/bin/bash 
?
#go to location of text files
Java -cp .org.glucosio.android.tools.Driver'input X input Y input Z'
?
#gradle build
?
#loop to process all test files
for i in $(seq 1 25); do 
?
    #parse text file to save variables and display oracle
    #rm command will remove current info from file before adding new
    rm sampletest$i.txt 2>/dev/null
?
    FIRSTLINE=`sed -n 1p testcase$i.txt`
    echo "Test Case Number: " $FIRSTLINE$'\n' >> sampletest$i.txt
?
?
    SECONDLINE=`sed -n 3p testcase$i.txt`
    echo "Method Signature: " $SECONDLINE$'\n' >> sampletest$i.txt
?
?
    THIRDLINE=`sed -n 5p testcase$i.txt`
    echo "Input Value: " $THIRDLINE$'\n' >> sampletest$i.txt
?
?
    FOURTHLINE=`sed -n 7p testcase$i.txt`
    echo "Expected Output: " $FOURTHLINE$'\n' >> sampletest$i.txt
   
?
    #compile driver
    javac driver$i.java
?
    #pass in method name and input commands to corresponding driver
    #SECONDLINE is method signature, THIRDLINE is input value
    java driver$i.java SECONDLINE, THIRDLINE
?
    #compile the .java file that contains the method we want to test this case
    javac GlucosioConverter.java
?
   
    #display actual
?
    #save to text file
?
#end for loop
done
?
    #open web browser with final expected and actual outputs