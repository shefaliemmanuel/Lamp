#! /bin/bash
echo "" >> myScript.html
echo "Hello $USER!" >> myScript.html
echo "" >> myScript.html
echo "What's the root structure?" >> myScript.html
pwd >> myScript.html
echo " " >> myScript.html
echo $"What's inside Lamp?" >> myScript.html
ls >> myScript.html
echo "" >> myScript.html
echo "What's inside TestAutomation?" >> myScript.html
cd TestAutomation >> myScript.html
ls >> myScript.html
echo "" >> myScript.html
cd .. >> myScript.html
open myScript.html
exit 0
