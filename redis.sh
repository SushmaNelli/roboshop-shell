echo -e "\e[32mInstall Redis Repos\e[0m"
yum install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y &>>/tmp/roboshop.log

echo -e "\e[32mEnable Redis 6.2 Version\e[0m"
yum module enable redis:remi-6.2 -y &>>/tmp/roboshop.log

echo -e "\e[32m Install Redis\e[0m"
yum install redis -y &>>/tmp/roboshop.log

echo -e "\e[32mUpdate Redis listen address\e[0m"
sed -i 's/127.0.0.1/0.0.0.0/' /etc/redis.conf /etc/redis/redis.conf &>>/tmp/roboshop.log

echo -e "\e[32mStart Redis Service\e[0m"
systemctl enable redis &>>/tmp/roboshop.log
systemctl start redis &>>/tmp/roboshop.log