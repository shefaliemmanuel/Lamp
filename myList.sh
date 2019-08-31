#/bin/env bash

echo "This script shows the top-level directory contents of the directory it is contained in and diesplays it in a browser."

ls > dirlist.html
firefox dirlist.html
rm dirlist.html
