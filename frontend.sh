echo -e "\e[35mInstalling nginx\e[0m"
yum install nginx -y

echo -e "\e[35mRemoving old app. content\e[0m"
rm -rf /usr/share/nginx/html/*

echo -e "\e[35mDownloading frontend content\e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip

echo -e "\e[35mExtracting the content\e[0m"
cd /usr/share/nginx/html

echo -e "\e[35Unzipping the content\e[0m"
unzip /tmp/frontend.zip

#we need to copy config file

echo -e "\e[35mStarting nginx server\e[0m"
systemctl enable nginx
systemctl restart nginx