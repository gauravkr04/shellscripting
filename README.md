# shellscripting
Practising Shell Scripting

# Sed Editor

### sed with -i : edit the file
### sed without -i : will print the change on output
### -e is for multiple coniditons in sed commands
#### _-e cond 1 -e cond 2_

## 1. Search and replace / Substitute
### eg
sed -i -e 's/root/ROOT/g' 's/admin/ADMIN/g' sample.txt

## 2. Delete Lines
sed -i -e 'id' -e '/root/ d' sample.txt

## 3. Add Lines
sed -i -e '/root/ i Hello World' sample.txt

## Examples
#### To search and replace root with ROOT
_sed -i -e 's/root/ROOT/g' /tmp/passed_
#### To delete the second line
_sed -i -e '2d' /tmp/passed_
#### To delete the line containing world ROOT
_sed -i -e '/ROOT/d' /tmp/passed_
#### To insert a new line at first place
_sed -i -e '1 i Hello World' /tmp/passed_
#### To append a new line after first line
_sed -i -e '1 a New World' /tmp/passed_
#### To replace the line with Hello Universe where the word World present
_sed -i -e '/World/ c Hello Universe' /tmp/passed_

## To Interrupt on Shell prompt - CTL + C
## To comment the selected text - CTL + /
## To come out from Mongo Shell - CTL + D
## To clear screen on Shell Prompt - CTL + L



