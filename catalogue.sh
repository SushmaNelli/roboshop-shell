component=catalogue
color="\e[36m"
nocolor="\e[0m"
log-file="/tmp/roboshop.log"
app-path="/app"

echo -e "${color} Configuring NodeJS Repos ${nocolor}"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>${log-file}

echo -e "${color} Install NodeJS ${nocolor}"
yum install nodejs -y &>>${log-file}

echo -e "${color} Add Application User ${nocolor}"
useradd roboshop &>>${log-file}

echo -e "${color} Remove Old Content and Create Application Directory ${nocolor}"
rm -rf ${app-path} &>>${log-file}
mkdir ${app-path}

echo -e "${color} Download Application Content ${nocolor}"
curl -o /tmp/$component.zip https://roboshop-artifacts.s3.amazonaws.com/$component.zip &>>${log-file}
cd ${app-path}

echo -e "${color} Extract Application Content ${nocolor}"
unzip /tmp/$component.zip &>>${log-file}
cd ${app-path}

echo -e "${color} Install NodeJS Dependencies ${nocolor}"
npm install &>>${log-file}

echo -e "${color} Setup SystemD Service ${nocolor}"
cp /home/centos/roboshop-shell/$component.service /etc/systemd/system/$component.service &>>${log-file}

echo -e "${color} Start $component Service ${nocolor}"
systemctl daemon-reload &>>${log-file}
systemctl enable $component &>>${log-file}
systemctl restart $component &>>${log-file}

echo -e "${color}Copy Mongodb Repo file${nocolor}"
cp /home/centos/roboshop-shell/mongodb.repo /etc/yum.repos.d/mongo.repo &>>${log-file}

echo -e "${color}Install Mongodb-client${nocolor}"
yum install mongodb-org-shell -y &>>${log-file}

echo -e "${color}Load Schema${nocolor}"
mongo --host mongodb-dev.sushma1923.pics <${app-path}/schema/$component.js &>>${log-file}