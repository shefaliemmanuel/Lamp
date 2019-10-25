#!/bin/bash

#/TestAutomation/project/android/app/src/main/java/org/glucosio/android/tools

#navigate to folder location of driver
#cd ../project/android/app/src/main/java/org/glucosio/android/tools

#go to location of text files


#gradle build

#create copy of Report Template
cp ./testCases/reportSummaryTemplate.html ./reports/reportSummary.html


#loop to process all test files
cd scripts

cd ../testCases
for i in $(seq 1 17); do 

    #parse text file to save variables and display oracle
    #rm command will remove current info from file before adding new
    rm sampletest$i.txt 2>/dev/null

    TESTNO=`sed -n 1p testcase$i.txt`    

    METHODNAME=`sed -n 3p testcase$i.txt`   

    outValue=`sed -n 5p testcase$i.txt`

    InValue=`sed -n 7p testcase$i.txt`
    
   
    cd ../testCasesExecutables 
    #copy driver$i.java to correct project location prior to compiling
    
    cp Driver$i.java ../project/android/app/src/main/java/org/glucosio/android/tools
    #compile driver & compile the .java file that contains the method we want to test this case
    cd ..
    javac ./project/android/app/src/main/java/org/glucosio/android/tools/Driver$i.java ./project/android/app/src/main/java/org/glucosio/android/tools/GlucosioConverter.java -Xlint:unchecked
    ## this requires navigation to the appropriate directory to function. Above command will execute properly.

    echo Test $i Complete
    #navigate to folder location to compile (Have not figured out how to do this from current directory)
    cd project/android/app/src/main/java
    
    #pass in method name and input commands to corresponding driver
    #sends output to the reports folder (final file name not identified)
    #METHODNAME is method signature, outValue is input value
    
    #Saves the output of the Driver to outputtest variable.
    outputtest="$(java -cp . org.glucosio.android.tools.Driver$i "$TESTNO" "$METHODNAME" "$InValue" 2>&1)"
    
    #remove .java and .class files created for test
    rm ./org/glucosio/android/tools/Driver$i.java ./org/glucosio/android/tools/Driver$i.class 
	
    #navigate back to scripts folder
    cd ../../../../../../testCases

#comapre Output from test with Oracle
     if [[ "$outputtest" == "$outValue" ]]; then
	echo "<tr><td>"$TESTNO$"</td><td>"$METHODNAME$"</td><td>"$outValue$"</td><td>"$InValue$"</td><td>"PASSED"</td></tr>" >> ../reports/reportSummary.html
     else
	echo "<tr><td>"$TESTNO$"</td><td>"$METHODNAME$"</td><td>"$outValue$"</td><td>"$InValue$"</td><td>"FAILED"</td></tr>" >> ../reports/reportSummary.html
     fi
#end for loop
done

echo "</table></body></html>" >> ../reports/reportSummary.html
    cd ..

#open web browser with final expected and actual output

#xdg-open 
