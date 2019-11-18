#!/bin/bash
#Team: Jason Adler, Shefali Emmanuel
#Script used to test Glucosio application
#Scans testCases folder for all text files to create inputs for tests
#Output results to reports folder in an HTML document



#Date stored to use for reportSummary output
todaysDate=`date +%Y-%m-%d.%H:%M:%S`

#commonly used path to be used throughout script
TOOLSPATH="./project/android/app/src/main/java/org/glucosio/android/tools/"

#Create a copy of reportSummaryTemplate.html and name copied file with todays date 
cp ./testCases/reportSummaryTemplate.html ./reports/reportSummary$todaysDate.html

#Build Glucosio project
#Create local.properties file using default Android SDK location
#If script is run with the -b parameter it will build the project.
if [[ "$1" == "-b" ]]; then 
	echo "sdk.dir =/home/$USER/Android/Sdk" > project/android/local.properties
	cd project/android
	gradle build -x test
	cd ../../testCasesExecutables
else
	cd testCasesExecutables
fi

#cd testCasesExecutables

#Copy all method drivers from executables folder to appropriate project folder 
cp kgToLbDriver.java a1cToGlucoseDriver.java glucoseToA1CDriver.java glucoseToMmolLDriver.java glucoseToMgDlDriver.java lbToKgDriver.java .$TOOLSPATH

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

