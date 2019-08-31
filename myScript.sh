#! /bin/bash

# <br> is inserted to create a new line in html
# command >> file where result of command is stored

# saying hello to the root user profile
echo "Hello $USER!<br>" > myScript.html
echo "<br>" >> myScript.html

echo "What's the root structure?<br>" >> myScript.html

# print working directory
pwd >> myScript.html
echo "<br>" >> myScript.html
echo "<br>What's inside Lamp?<br>" >> myScript.html

# lists the files/folders in the current directory
ls >> myScript.html
echo "<br>" >> myScript.html
echo "<br>What's inside TestAutomation?<br>" >> myScript.html

# change directory to TestAutomation
cd TestAutomation

# list the files/folders in the TestAutomation
ls >> "/Users/shefaliemmanuel 1/Lamp/myScript.html"

# change to parent directory
cd ..
echo "<br>" >> myScript.html

# print message showing shell program is complete
echo "<br> That's all Folks! <br>" >> myScript.html

# open the html file in browser
open myScript.html

exit 0
