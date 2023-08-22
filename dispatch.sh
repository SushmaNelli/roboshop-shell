source common.sh

echo -e "${color}Install GoLang${nocolor}"
yum install golang -y &>>${log_file}
 stat_check $?

echo -e "${color}Add application User${nocolor}"
useradd roboshop &>>${log_file}
 stat_check $?

echo -e "${color}Remove Old Content and Create Application Directory${nocolor}"
rm -rf /app &>>${log_file}
mkdir /app &>>${log_file}
 stat_check $?

echo -e "${color}Download application content${nocolor}"
curl -L -o /tmp/dispatch.zip https://roboshop-artifacts.s3.amazonaws.com/dispatch.zip &>>${log_file}
cd ${app_path}
 stat_check $?

echo -e "${color}Extract Application content${nocolor}"
unzip ${log_file}
 stat_check $?

echo -e "${color}Download the dependencies${nocolor}"
cd ${app_path}
go mod init dispatch &>>${log_file}
go get &>>${log_file}
go build &>>${log_file}
 stat_check $?

echo -e "${color}Setup SystemD Dispatch Service${nocolor}"
cp /home/centos/roboshop-shell/dispatch.service /etc/systemd/system/dispatch.service &>>${log_file}
 stat_check $?

echo -e "${color}Start Dispatch service${nocolor}"
systemctl daemon-reload &>>${log_file}
systemctl enable dispatch &>>${log_file}
systemctl restart dispatch &>>${log_file}
 stat_check $?