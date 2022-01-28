#!/bin/bash

# use aws-cli in aws documentation
# click on ec2, route 53 documentation
# ec2 - run-instances
# aws ec2 describe-instance
# IAM for AWS - create users - aws configure

# Receiving the first argument as Instance Name
INSTANCE_NAME=$1

if [ -z ${INSTANCE_NAME} ]; then
  echo -e "\e[1;31mThe Instance Name has not been passed\e[0m"
  exit
fi

# describe-image to get the AMI ID
AMI_ID=$(aws ec2 describe-images --filters "Name=name,Values=Centos-7-DevOps-Practice" --query 'Images[*].[ImageId]' --output text)

if [ -z ${AMI_ID} ]; then
  echo -e "\e[1;31mUnable to find the Image AMI_ID\e[0m"
  exit
else
  echo $AMI_ID
fi

# describe-instance to find whether a particular instance is up and running or not

PRIVATE_IP=$(aws ec2 describe-instances --filters Name=tag:Name,Values=$INSTANCE_NAME --query 'Reservations[*].Instances[*].PrivateIpAddress' --output text)

if [ -z ${PRIVATE_IP} ]; then
  aws ec2 run-instances --image-id $AMI_ID --instance-type t3.micro --output text --tag-specification "ResourceType=instance,Tags=[{Key=Name,Value=$INSTANCE_NAME}]"
else
  echo -e "\e[1;33mThe Instance $INSTANCE_NAME is already running\e[0m"
  exit
fi






