#! /bin/bash
echo "Hello $USER!<br>" >> myScript.html
echo "What's the root structure?<br>" >> myScript.html
pwd >> myScript.html
echo "<br>What's inside Lamp?<br>" >> myScript.html
ls >> myScript.html
echo "<br>" >> myScript.html
echo "<br>What's inside TestAutomation?<br>" >> myScript.html
cd TestAutomation
ls >> myScript.html
cd ..
open myScript.html

exit 0
