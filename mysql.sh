echo -e "\e[32mDisable Mysql default version\e[0m"
yum module disable mysql -y &>>/tmp/roboshop.log

echo -e "\e[32mSetup the MySQL5.7 repo file\e[0m"
cp /home/centos/roboshop-shell/mysql.repo /etc/yum.repos.d/mysql.repo &>>/tmp/roboshop.log

echo -e "\e[32mInstall MySQL Community Server\e[0m"
yum install mysql-community-server -y &>>/tmp/roboshop.log

echo -e "\e[32mStart MySQL Service\e[0m"
systemctl enable mysqld &>>/tmp/roboshop.log
systemctl restart mysqld &>>/tmp/roboshop.log

echo -e "\e[32mSetup Mysql Password\e[0m"
mysql_secure_installation --set-root-pass RoboShop@1 &>>/tmp/roboshop.log