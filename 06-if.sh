#!/bin/bash

## String Expression
a=abc1
if [ $a = "abc" ]
then
  echo " Value of a is correct : $a"
fi

if [ $a != "abc" ]; then
  echo NOTOK
fi

if [ -z $b]; then
  echo b is empty/not declared variable
fi