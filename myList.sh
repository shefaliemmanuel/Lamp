#! /bin/bash

# <br> is inserted to create a new line in html
# command >> file where result of command is stored

# saying hello to the root user profile
echo "Hello $USER!<br>" > myList.html
echo "<br>" >> myList.html

echo "What's the root structure?<br>" >> myList.html

# print working directory
pwd >> myList.html
echo "<br>" >> myList.html
echo "<br>What's inside Lamp?<br>" >> myList.html

# lists the files/folders in the current directory
ls >> myList.html
echo "<br>" >> myList.html
echo "<br>What's inside TestAutomation?<br>" >> myList.html

# change directory to TestAutomation
cd TestAutomation

# list the files/folders in the TestAutomation
ls >> "/home/shefali/Desktop/Lamp/myList.html"

# change to parent directory
cd ..
echo "<br>" >> myList.html

# print message showing shell program is complete
echo "<br> That's all Folks! <br>" >> myList.html

# open the html file in browser
xdg-open myList.html

exit 0

