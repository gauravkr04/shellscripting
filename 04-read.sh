#!/bin/bash

# Input in shell scripting can be taken in two ways :
# 1. During Execution  2. Before Execution
# During Execution inputs can only be done when the execution is manual. Will not work for Automation.
#

read -p "Enter Your Name : " name
echo " Your Name = $name "
read -p "Enter Course Name : " course
echo "Your Course = $course"
