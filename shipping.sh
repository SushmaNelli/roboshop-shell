echo -e "\e[32mInstall Maven\e[0m"
yum install maven -y &>>/tmp/roboshop.log

echo -e "\e[32mAdd application User\e[0m"
useradd roboshop &>>/tmp/roboshop.log

echo -e "\e[33mRemove Old Content and Create Application Directory\e[0m"
rm -rf /app &>>/tmp/roboshop.log
mkdir /app &>>/tmp/roboshop.log

echo -e "\e[32mDownload application content\e[0m"
curl -L -o /tmp/shipping.zip https://roboshop-artifacts.s3.amazonaws.com/shipping.zip &>>/tmp/roboshop.log
cd /app

echo -e "\e[32mExtract Application content\e[0m"
unzip /tmp/shipping.zip &>>/tmp/roboshop.log

echo -e "\e[32mDownload Maven dependencies \e[0m"
mvn clean package &>>/tmp/roboshop.log
mv target/shipping-1.0.jar shipping.jar &>>/tmp/roboshop.log

echo -e "\e[32mSetup SystemD Shipping Service\e[0m"
cp /home/centos/roboshop-shell/shipping.service /etc/systemd/system/shipping.service &>>/tmp/roboshop.log

echo -e "\e[32mInstall Mysql Client\e[0m"
yum install mysql -y &>>/tmp/roboshop.log

echo -e "\e[32m Load Schema\e[0m"
mysql -h mysql-dev.sushma1923.pics -uroot -pRoboShop@1 < /app/schema/shipping.sql &>>/tmp/roboshop.log

echo -e "\e[32mStart Shipping service.\e[0m"
systemctl daemon-reload &>>/tmp/roboshop.log
systemctl enable shipping &>>/tmp/roboshop.log
systemctl restart shipping &>>/tmp/roboshop.log