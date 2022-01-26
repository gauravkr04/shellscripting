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