#!/bin/bash

#/TestAutomation/project/android/app/src/main/java/org/glucosio/android/tools

#navigate to folder location of driver
#cd ../project/android/app/src/main/java/org/glucosio/android/tools

#go to location of text files

#java -cp .org.glucosio.android.tools.Driver'input X input Y input Z'

#gradle build
rm ./reports/output.txt


wordCount=0;


#loop to process all test files
cd scripts

cd ../testCases
for i in $(seq 1 17); do 

    #parse text file to save variables and display oracle
    #rm command will remove current info from file before adding new
    rm sampletest$i.txt 2>/dev/null

    TESTNO=`sed -n 1p testcase$i.txt`
    #echo "Test Case Number: " $TESTNO$'\n' >> sampletest$i.txt


    METHODNAME=`sed -n 3p testcase$i.txt`
    #echo "Method Signature: " $METHODNAME$'\n' >> sampletest$i.txt

    outValue=`sed -n 5p testcase$i.txt`
    #echo "Input Value: " $outValue$'\n' >> sampletest$i.txt


    InValue=`sed -n 7p testcase$i.txt`
    #echo "Expected Output: " $InValue$'\n' >> sampletest$i.txt
   
    cd ../testCasesExecutables 
    #copy driver$i.java to correct project location prior to compiling
    
    cp Driver$i.java ../project/android/app/src/main/java/org/glucosio/android/tools
    #compile driver & compile the .java file that contains the method we want to test this case
    
    PWD="$(pwd)"
    #javac -cp ${PWD}/project/android/app/src/main/java/org/glucosio/android/tools project/android/app/src/main/java/org/glucosio/android/tools/driver$i.java project/android/app/src/main/java/org/glucosio/android/tools/GlucosioConverter.java
    cd ..
    javac ./project/android/app/src/main/java/org/glucosio/android/tools/Driver$i.java ./project/android/app/src/main/java/org/glucosio/android/tools/GlucosioConverter.java
    ## this requires navigation to the appropriate directory to function. Above command will execute properly.
    #javac driver$i.java GlucosioConverter.java
    

    #navigate to folder location to compile (Have not figured out how to do this from current directory)
    cd project/android/app/src/main/java
    

    #pass in method name and input commands to corresponding driver
    #sends output to the reports folder (final file name not identified)
    #METHODNAME is method signature, outValue is input value
    #java -cp . org.glucosio.android.tools.Driver$i "$TESTNO" "$METHODNAME" "$outValue" >> ../../../../../../reports/output.txt
    
    #Saves the output of the Driver to outputtest variable.
    outputtest="$(java -cp . org.glucosio.android.tools.Driver$i "$TESTNO" "$METHODNAME" "$InValue" 2>&1)"
    
    #echo ${outputtest}
    #navigate back to scripts folder
    cd ../../../../../../testCases
       
    #display actual
    printf "\n" > testing.html
    echo "Test Number: "$TESTNO$'\n'
    echo "Method: "$METHODNAME$'\n'
    echo "Expected Output: "$outValue$'\n'
    echo "Input: "$InValue$'\n'

    
    #echo "Actual Test File Contains:  "$outputtest$'\n'

    #(IFS=',';for actualValue in $outputtest; do 
  #let "wordCount++"
  #echo "Word Count: $wordCount"
  #echo "Word Found: $actualValue"
    
  #if [[ "$wordCount" -eq "1" ]]; then
   echo "Actual Output: "$outputtest$'\n'
     if [[ "$outputtest" == "$outValue" ]]; then
	
        echo "TEST NUMBER "$TESTNO$": PASSED"$'\n'
     else
	
        echo "TEST NUMBER "$TESTNO$": FAILED"$'\n'
     fi
  #else
   #echo "Word Count is not equal to hardcoded value 3"$'\n'
 # fi
 
 
 #done)

    #save to text file


#end for loop
done
    cd ../scripts
    #open web browser with final expected and actual output

#open ./testing.html
