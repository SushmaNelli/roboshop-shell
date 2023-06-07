echo -e "\e[35mCopy mongodb repo file\e[0m"
#copy to repo i.e;
cp mongodb.repo /etc/yum.rpo.d/mongodb.repo
echo -e "\e[35mInstalling mongodb server\e[0m"
yum install mongodb-org -y

#modify the config file
echo -e "\e[35mStart mongodb service\e[0m"
systemctl enable mongod
systemctl restart mongod