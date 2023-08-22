source common.sh
component=dispatch

roboshop_app_password=$1
if [ -z "$roboshop_app_password" ]; then
  echo "roboshop_app_password is missing"
  exit 1
  fi

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