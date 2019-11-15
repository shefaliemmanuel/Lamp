#!/bin/bash

#Date stored to use for reportSummary output
todaysDate=`date +%Y-%m-%d.%H:%M:%S`

#commonly used path to be used throughout script
TOOLSPATH="./project/android/app/src/main/java/org/glucosio/android/tools/"

#Create a copy of reportSummaryTemplate.html and name copied file with todays date 
cp ./testCases/reportSummaryTemplate.html ./reports/reportSummary$todaysDate.html

cd testCasesExecutables

#Copy all method drivers from executables folder to appropriate project folder 
cp kgToLbDriver.java a1CToGlucoseDriver.java glucoseToA1CDriver.java glucoseToMmolLDriver.java glucoseToMgDlDriver.java lbToKgDriver.java .$TOOLSPATH

cd ..

#Compile all drivers at one time
javac $TOOLSPATH``kgToLbDriver.java $TOOLSPATH``a1cToGlucoseDriver.java $TOOLSPATH``glucoseToA1CDriver.java $TOOLSPATH``glucoseToMmolLDriver.java $TOOLSPATH``glucoseToMgDlDriver.java $TOOLSPATH``lbToKgDriver.java $TOOLSPATH``GlucosioConverter.java -Xlint:unchecked


cd scripts

cd ../testCases

#For each .txt file in testCases the for loop will parse the file for Test Number, Method Name, Oracle, and Input to be passed. 
#The output will be compared to the Oracle will result in a "Passed" or "Failed" result being added to the reportSummary html table.
for f in *.txt
do
	
	#Create variable with testcase.txt file name
	TESTNAME=${f##*/}

    #Read testcase.txt file lines and assign them to appropriate variables
    TESTNO=`sed -n 1p $TESTNAME`    

    METHODNAME=`sed -n 3p $TESTNAME`   

    outValue=`sed -n 5p $TESTNAME`

    InValue=`sed -n 7p $TESTNAME`

    REQUIREMENT=`sed -n 9p $TESTNAME`

    
	DriverName="${METHODNAME//()/Driver.java}"

	cd ..

	echo Test $TESTNO Complete
	
	cd project/android/app/src/main/java

	outputTest="$(java -cp . org.glucosio.android.tools.${DriverName//.java} "$TESTNO" "$METHODNAME" "$InValue" 2>&1)"

	##remove java and class files? May do at end
	#rm ./org/glucosio/android/tools/$DriverName ./org/glucosio/android/tools/${DriverName//.java/.class}



	cd ../../../../../../testCases

	if [[ "$outputTest" == "$outValue" ]]; then
	echo "<tr><td>"$TESTNO$"</td><td>"$METHODNAME$"</td><td>"$REQUIREMENT"</td><td>"$InValue$"</td><td>"$outputTest$"</td><td>"$outValue"</td><td>"PASSED"</td></tr>" >> ../reports/reportSummary$todaysDate.html
     else
	echo "<tr><td>"$TESTNO$"</td><td>"$METHODNAME$"</td><td>"$REQUIREMENT"</td><td>"$InValue$"</td><td>"$outputTest$"</td><td>"$outValue"</td><td>"FAILED"</td></tr>" >> ../reports/reportSummary$todaysDate.html
     fi


done

#Print the end of the html file
echo "</table></body></html>" >> ../reports/reportSummary$todaysDate.html
	cd ..
	
	#Open the generated report in users browser
	xdg-open ./reports/reportSummary$todaysDate.html
	
	#Delete the .java files from the project folder
	rm $TOOLSPATH``kgToLbDriver.java $TOOLSPATH``a1cToGlucoseDriver.java $TOOLSPATH``glucoseToA1CDriver.java $TOOLSPATH``glucoseToMmolLDriver.java $TOOLSPATH``glucoseToMgDlDriver.java $TOOLSPATH``lbToKgDriver.java
	#Delete the .class files from the project folder
	rm $TOOLSPATH``kgToLbDriver.class $TOOLSPATH``a1cToGlucoseDriver.class $TOOLSPATH``glucoseToA1CDriver.class $TOOLSPATH``glucoseToMmolLDriver.class $TOOLSPATH``glucoseToMgDlDriver.class $TOOLSPATH``lbToKgDriver.class $TOOLSPATH``GlucosioConverter.class

