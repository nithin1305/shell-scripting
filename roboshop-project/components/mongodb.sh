source components/common.sh

echo "Download Mongodb repofile"
curl -s -o /etc/yum.repos.d/mongodb.repo https://raw.githubusercontent.com/roboshop-devops-project/mongodb/main/mongo.repo &>>$LOG_FILE

echo "Install Mongodb"
yum install -y mongodb-org &>>$LOG_FILE

