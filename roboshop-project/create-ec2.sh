#!/bin/bash

# use aws-cli in aws documentation
# click on ec2, route 53 documentation
# ec2 - run-instances
# aws ec2 describe-instance
# IAM for AWS - create users - aws configure

# Create a log file
INS_CREATE_LOG_FILE=/tmp/instance-create.log
rm -rf $INS_CREATE_LOG_FILE

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

if [ -z "${PRIVATE_IP}" ]; then
  SEC_GRP=$( aws ec2 describe-security-groups --filters Name=group-name,Values=allow-all-ports --query SecurityGroups[*].GroupId --output text)
  if [ -z "${SEC_GRP}" ]; then
    echo -e "\e[1;31mSecurity Group allow-all-ports does not exist; hence exiting\e[0m"
    exit
  fi
  aws ec2 run-instances --image-id $AMI_ID --instance-type t3.micro --output text --tag-specification "ResourceType=instance,Tags=[{Key=Name,Value=$INSTANCE_NAME}]" "ResourceType=spot-instances-request,Tags=[{Key=Name,Value=$INSTANCE_NAME}]" --instance-market-options "MarketType=spot,SpotOptions={SpotInstanceType=persistent,InstanceInterruptionBehavior=stop}" --security-group-ids=${SEC_GRP} &>>INS_CREATE_LOG_FILE
else
  echo -e "\e[1;33mThe Instance $INSTANCE_NAME is already running\e[0m"
fi

IPADDRESS=$(aws ec2 describe-instances --filters Name=tag:Name,Values=$INSTANCE_NAME --query 'Reservations[*].Instances[*].PrivateIpAddress' --output text)

# Create a json file for DNS record
rm -rf /tmp/record.json

echo '{
            "Comment": "CREATE/DELETE/UPSERT a record ",
            "Changes": [{
            "Action": "CREATE",
                        "ResourceRecordSet": {
                                    "Name": "DNSNAME",
                                    "Type": "A",
                                    "TTL": 300,
                                 "ResourceRecords": [{ "Value": "IPADDRESS"}]
}}]
}' | sed -e "s/DNSNAME/${INSTANCE_NAME}/" -e "s/IPADDRESS/${IPADDRESS}/" >/tmp/record.json

# Retrieve the Hosted Zone ID
ZONE_ID=$(aws route53 list-hosted-zones --query "HostedZones[*].{name:Name,id:Id}" --output text |grep roboshop.internal | awk '{print$1'} | awk -F / '{print$3}')
echo $ZONE_ID

if [ -z "${ZONE_ID}" ]; then
  echo "Hosted Zone ID is not defined. Please create a new one in the console"
  exit
else
  
aws route53 change-resource-record-sets --hosted-zone-id ${ZONE_ID} --change-batch file:///tmp/record.json --output text &>>INS_CREATE_LOG_FILE




