echo -e "\e[35mCopy Mongodb Repo file \e[0m"
cp /home/centos/roboshop-shell/mongodb.repo /etc/yum.repos.d/mongodb.repo &>>/tmp/roboshop.log

echo -e "\e[35mInstalling mongodb server\e[0m"
yum install mongodb-org -y &>>/tmp/roboshop.log

echo -e "\e[35mUpdate MongoDB Listen Address\e[0m"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf

echo -e "\e[35mStart mongodb service\e[0m"
systemctl enable mongod &>>/tmp/roboshop.log
systemctl restart mongod &>>/tmp/roboshop.log