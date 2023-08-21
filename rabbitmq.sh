source common.sh

echo -e "${color}}Configure Erlang repos${nocolor}}"
curl -s https://packagecloud.io/install/repositories/rabbitmq/erlang/script.rpm.sh | bash &>>${log_file}
 stat_check $?

echo -e "${color}}Configure Rabbitmq Repos${nocolor}}"
curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | bash &>>${log_file}
 stat_check $?

echo -e "${color}}Install Rabbitmq Server${nocolor}}"
yum install rabbitmq-server -y &>>${log_file}
 stat_check $?

echo -e "${color}}Start Rabbitmq Service${nocolor}}"
systemctl enable rabbitmq-server &>>${log_file}
systemctl restart rabbitmq-server &>>${log_file}
 stat_check $?

echo -e "${color}}Add Rabbitmq Application user${nocolor}}"
rabbitmqctl add_user roboshop $1 &>>${log_file}
rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*" &>>${log_file}
 stat_check $?