echo -e "\e[35mCopy Mongodb Repo file \e[0m"
#copy to repo i.e;
cp mongodb.repo /etc/yum.repos.d/mongodb.repo
echo -e "\e[35mInstalling mongodb server\e[0m"
yum install mongodb-org -y

#modify the config file
echo -e "\e[35mStart mongodb service\e[0m"
systemctl enable mongod
systemctl restart mongod