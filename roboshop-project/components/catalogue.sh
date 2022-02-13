source components/common.sh

echo "Setup nodejs repo"
curl -fsSL https://rpm.nodesource.com/setup_lts.x | bash - &>>$LOG_FILE

echo "Install Nodejs"
yum install nodejs gcc-c++ -y &>>$LOG_FILE

echo "Create App user"
useradd roboshop &>>$LOG_FILE

echo "Download Catalogue code"
curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip" &>>$LOG_FILE

echo "Extract catalogue code"
cd /tmp/
unzip /tmp/catalogue.zip

echo "Copying catalogue content"
cp -r catalogue-main /home/roboshop/catalogue

echo "Install Nodejs dependencies"
npm install



