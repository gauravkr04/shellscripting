#!/bin/bash

# use aws-cli in aws documentation
# click on ec2, route 53 documentation
# ec2 - run-instances
# aws ec2 describe-instance
# IAM for AWS - create users - aws configure
# describe-image to get the AMI ID

AMI_ID=$(aws ec2 describe-images --filters "Name=name,Values=Centos-7-DevOps-Practice" --query 'Images[*].[ImageId]' --output text)

if [ -z $AMI_ID ]; then
  echo -e "\e[1,31mUnable to find the Image AMI_ID-e[0m"
else
  echo $AMI_ID
fi





