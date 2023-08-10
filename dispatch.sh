echo -e "\e[31mInstall GoLang\e[0m"
yum install golang -y &>>/tmp/roboshop.log

echo -e "\e[32mAdd application User\e[0m"
useradd roboshop &>>/tmp/roboshop.log

echo -e "\e[33mRemove Old Content and Create Application Directory\e[0m"
rm -rf /app &>>/tmp/roboshop.log
mkdir /app &>>/tmp/roboshop.log

echo -e "\e[34mDownload application content\e[0m"
curl -L -o /tmp/dispatch.zip https://roboshop-artifacts.s3.amazonaws.com/dispatch.zip &>>/tmp/roboshop.log
cd /app

echo -e "\e[35mExtract Application content\e[0m"
unzip /tmp/dispatch.zip

echo -e "\e[36mSetup SystemD Dispatch Service\e[0m"
cp /home/centos/roboshop-shell/dispatch.service /etc/systemd/system/dispatch.service &>>/tmp/roboshop.log

echo -e "\e[32mStart Dispatch service\e[0m"
systemctl daemon-reload &>>/tmp/roboshop.log
systemctl enable dispatch &>>/tmp/roboshop.log
systemctl restart dispatch &>>/tmp/roboshop.log