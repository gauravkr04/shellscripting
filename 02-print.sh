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

echo -e "\e[31mRED\e[32mGREEN\e[33mYELLOW\e[34mBLUE\e[35mMAGENTA\e[36mCYAN\e[0m"

# The same color can be print with more Brightness and BOLD color
# 1 for BOLD
# 4 for Underline
# 2 for less brightness
# 3 for normal
echo -e "\e[1;31mRED\e[1;32mGREEN\e[1;33mYELLOW\e[1;34mBLUE\e[1;35mMAGENTA\e[1;36mCYAN\e[0m"
echo -e "\e[4;31mRED\e[4;32mGREEN\e[4;33mYELLOW\e[4;34mBLUE\e[4;35mMAGENTA\e[4;36mCYAN\e[0m"
echo -e "\e[2;31mRED\e[2;32mGREEN\e[2;33mYELLOW\e[2;34mBLUE\e[2;35mMAGENTA\e[2;36mCYAN\e[0m"
echo -e "\e[3;31mRED\e[3;32mGREEN\e[3;33mYELLOW\e[3;34mBLUE\e[3;35mMAGENTA\e[3;36mCYAN\e[0m"

