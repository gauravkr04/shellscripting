echo "Installing frontend"

#To Install Nginx.
#
#```
## yum install nginx -y
## systemctl enable nginx
## systemctl start nginx
#
#```
#
#Let's download the HTDOCS content and deploy under the Nginx path.
#
#```
## curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"
#
#```
#
#Deploy in Nginx Default Location.
#
#```
## cd /usr/share/nginx/html
## rm -rf *
## unzip /tmp/frontend.zip
## mv frontend-main/* .
## mv static/* .
## rm -rf frontend-master README.md
## mv localhost.conf /etc/nginx/default.d/roboshop.conf
#
#```
#
#Finally restart the service once to effect the changes.
#
#```
## systemctl restart nginx
#
#```

# Define a Log File
LOG_FILE=/tmp/roboshop.log
# clear the logfile
rm -f $LOG_FILE

echo "Installing NGINX"
yum install nginx -y &>>$LOG_FILE

echo "Download frontend Content"
curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip" &>>$LOG_FILE

#cd /usr/share/nginx/html
echo "Clean Old Content"
rm -rf /usr/share/nginx/html/* &>>$LOG_FILE

echo "Extract Frontend Content"
cd /tmp
unzip -o /tmp/frontend.zip &>>$LOG_FILE

echo "Copy Extracted content to Nginx path"
cp -r frontend-main/static/* /usr/share/nginx/html/ &>>$LOG_FILE

echo "Copy Nginx Roboshop Config"
cp frontend-main/localhost.conf /etc/nginx/default.d/roboshop.conf &>>$LOG_FILE

echo "Start Nginx Service"
systemctl enable nginx &>>$LOG_FILE
systemctl start nginx &>>$LOG_FILE



