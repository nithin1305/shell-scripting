#The frontend is the service in RobotShop to serve the web content over Nginx.
#
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

LOG_FILE=/tmp/roboshop.log
rm -f $LOG_FILE

echo "Installing nginx"
yum install nginx -y &>>$LOG_FILE

echo "Download frontend repo"
curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip" &>>$LOG_FILE

echo "Clean old content"
rm -rf /usr/share/nginx/html/* &>>$LOG_FILE

echo "Extract frontend content"
cd /tmp
unzip frontend.zip &>>$LOG_FILE

echo "Copying the files Nginx path"
cp -r frontend-main/static/* /usr/share/nginx/html/ &>>$LOG_FILE

echo "Copying Nginx roboshop Config"
cp frontend-main/localhost.conf /etc/nginx/default.d/roboshop.conf &>>$LOG_FILE

echo "Start Nginx service"
systemctl enable nginx
systemctl start nginx