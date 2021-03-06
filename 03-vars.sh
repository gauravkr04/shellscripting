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

# Arithmatic Substitution
VAR1=$((2+3+4-1/6-1))
echo The output of Arithmatic expression is $VAR1

#Variable name can have only a-z, A-Z, 0-9, Underscore
# Special Character is not allowed
# Variable name should not start with a number
# it can start with a underscore
# Variable by default dont have a datatype, everything is String
# in LINUX/UNIX, variable names generally goes in CAPS whereas in Java, it is Camel Case.

# ReadOnly Variable
readonly a=100
echo $a
a=200
echo $a

# Scalar Variable - can hold only one value
b=10
echo $b
b=20
echo $b


# Array Variable
c=(10 20)
echo ${c[0]}
echo ${c[1]}
echo ${b[0]}

#Local and Global Variable
# Trying to access a variable from command line

echo Course_Name = $COURSE_NAME

