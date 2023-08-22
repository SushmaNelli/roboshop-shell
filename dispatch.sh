source common.sh
component=dispatch

echo -e "${color}Install GoLang${nocolor}"
yum install golang -y &>>${log_file}
 stat_check $?

app_presetup

echo -e "${color}Download the dependencies${nocolor}"
go mod init $component &>>${log_file}
go get &>>${log_file}
go build &>>${log_file}
 stat_check $?

systemd_setup