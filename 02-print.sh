#! /bin/bash

# echo is used to print the message on the console.
echo Hello World!!

# Print the message in Colors
# Syntax : echo -e "\e[COLmMESSAGE\e0m"
# -e to enable the esc seq
# \e to enable the color
# [COLm - Color number
# MESSAGE - print message
# \e[0m to disable the color

# Color codes and Color Names -
# COL Name    COL Code
# RED         31
# GREEN       32
# YELLOW      33
# BLUE        34
# MAGENTA     35
# CYAN        36

echo -e "\e[31mRED\e[32mGREEN\e33mYELLOW\e34mBLUE\e35mMAGENTA\e36mCYAN\e[0m"
