#!/bin/bash

# Before Execution, we can provide the inputs and those values will be loaded by the Special Variables in the shell.
# Special Variables are $0-$n, $*, $@, $#
# $0 - Script Name
# $1-$n - Arguments passed in the order
# $* , $@ - All Arguments
# $# - Number of Arguments

echo $0  # Script Name
echo $1  # First Argument
echo $2  # Second Argument
echo $3  # Third Argument
echo $#  # Number of Arguments
echo $*  # Print all Arguments
echo $@  # Print all Arguments