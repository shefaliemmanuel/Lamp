#!/bin/bash


todaysDate=`date +%Y-%m-%d.%H:%M:%S`
TOOLSPATH="./project/android/app/src/main/java/org/glucosio/android/tools/"

cp ./testCases/reportSummaryTemplate.html ./reports/reportSummary$todaysDate.html

cd scripts

cd ../testCases

for f in *.txt
do
	
	TESTNAME=${f##*/}

    TESTNO=`sed -n 1p $TESTNAME`    

    METHODNAME=`sed -n 3p $TESTNAME`   

    outValue=`sed -n 5p $TESTNAME`

    InValue=`sed -n 7p $TESTNAME`

    
	DriverName="${METHODNAME//()/Driver.java}"

	cd ../testCasesExecutables

	cp $DriverName ../project/android/app/src/main/java/org/glucosio/android/tools

	cd ..

	javac $TOOLSPATH$DriverName $TOOLSPATH``GlucosioConverter.java -Xlint:unchecked

	echo Test $TESTNO Complete
	
	cd project/android/app/src/main/java

	outputTest="$(java -cp . org.glucosio.android.tools.${DriverName//.java} "$TESTNO" "$METHODNAME" "$InValue" 2>&1)"

	##remove java and class files? May do at end
	rm ./org/glucosio/android/tools/$DriverName ./org/glucosio/android/tools/${DriverName//.java/.class}



	cd ../../../../../../testCases

	if [[ "$outputTest" == "$outValue" ]]; then
	echo "<tr><td>"$TESTNO$"</td><td>"$METHODNAME$"</td><td>"$InValue$"</td><td>"$outputTest$"</td><td>"$outValue"</td><td>"PASSED"</td></tr>" >> ../reports/reportSummary$todaysDate.html
     else
	echo "<tr><td>"$TESTNO$"</td><td>"$METHODNAME$"</td><td>"$InValue$"</td><td>"$outputTest$"</td><td>"$outValue"</td><td>"FAILED"</td></tr>" >> ../reports/reportSummary$todaysDate.html
     fi


done

echo "</table></body></html>" >> ../reports/reportSummary$todaysDate.html
	cd ..
	
	xdg-open ./reports/reportSummary.html



