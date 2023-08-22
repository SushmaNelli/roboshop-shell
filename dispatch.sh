source common.sh

echo -e "${color}Install GoLang${nocolor}"
yum install golang -y &>>${log_file}
 stat_check $?

app_presetup

echo -e "${color}Download the dependencies${nocolor}"
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