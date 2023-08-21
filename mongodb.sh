source common.sh

echo -e "${color}Copy Mongodb Repo file ${nocolor}"
cp /home/centos/roboshop-shell/mongodb.repo /etc/yum.repos.d/mongodb.repo &>>${log_file}
 stat_check $?

echo -e "${color}Installing mongodb server${nocolor}"
yum install mongodb-org -y &>>${log_file}
 stat_check $?

echo -e "${color}Update MongoDB Listen Address${nocolor}"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf
 stat_check $?

echo -e "${color}Start mongodb service${nocolor}"
systemctl enable mongod &>>${log_file}
systemctl restart mongod &>>${log_file}
 stat_check $?