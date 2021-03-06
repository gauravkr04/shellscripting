#cho Installing mongodb

#1. Setup MongoDB repos.
#
#```bash
#curl -s -o /etc/yum.repos.d/mongodb.repo https://raw.githubusercontent.com/roboshop-devops-project/mongodb/main/mongo.repo
#```
#
#1. Install Mongo & Start Service.
#
#```bash
## yum install -y mongodb-org
## systemctl enable mongod
## systemctl start mongod
#
#```
#
#1. Update Listen IP address from 127.0.0.1 to 0.0.0.0 in config file
#
#Config file: `/etc/mongod.conf`
#
#then restart the service
#
#```bash
## systemctl restart mongod
#
#```
# Download the schema and load it
# curl -s -L -o /tmp/mongodb.zip "https://github.com/roboshop-devops-project/mongodb/archive/main.zip"

# cd /tmp
# unzip mongodb.zip
# cd mongodb-main
# mongo < catalogue.js
# mongo < users.js


#Importing the common script
source components/common.sh

#1. Setup MongoDB repos.
echo "Downloading MongoDB repo file"
curl -s -o /etc/yum.repos.d/mongodb.repo https://raw.githubusercontent.com/roboshop-devops-project/mongodb/main/mongo.repo &>>$LOG_FILE

# Install Mongo & Start Service.
echo "Install MongoDB"
yum install -y mongodb-org &>>$LOG_FILE

# Update Listen IP address from 127.0.0.1 to 0.0.0.0 in config file
# using sed editor
echo "Update MongoDB Config File"
sed -i -e 's/127.0.0.1/0.0.0.0' /etc/mongod.conf &>>$LOG_FILE

# Enable and Start the database
echo "Start Database"
systemctl enable mongod &>>$LOG_FILE
systemctl start mongod &>>$LOG_FILE

# Download the schema and load it
echo "Download Schema"
curl -s -L -o /tmp/mongodb.zip "https://github.com/roboshop-devops-project/mongodb/archive/main.zip" &>>$LOG_FILE

echo "Extract Schema"
cd /tmp
unzip -o mongodb.zip &>>$LOG_FILE

echo "Load Schema"
cd mongodb-main &>>$LOG_FILE
mongo < catalogue.js &>>$LOG_FILE
mongo < users.js &>>$LOG_FILE