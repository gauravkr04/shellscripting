#!/bin/bash

# Before Execution, we can provide the inputs and those values will be loaded by the Special Variables in the shell.
# Special Variables are $0-$n, $*, $@, $#
# $0 - Script Name
# $1-$n - Arguments passed in the order
# $* , $@ - All Arguments
# $# - Number of Arguments

echo $0
echo $1
echo $2
echo $3
echo $#
echo $*
echo $@