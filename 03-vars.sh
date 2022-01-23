#! /bin/bash

# Assignment of name to set of Data that is called Variable
# in Bash, declaration : VAR = DATA
# in Bash, accessing the variable : $VAR or  ${VAR}


student_name="Gaurav"

echo student_name = $student_name
echo student_name = ${student_name}

# The Variable can be hardcoded or can be assigned a value dynamically.
# We need to put the output message in quotes in case it has spaces

# Hard Coded Assignment
DATE=2022-01-23
echo Good Morning, Today date is $DATE

#Command Substitution
DATE=$(date +%F)
echo Good Morning, Today date is $DATE
