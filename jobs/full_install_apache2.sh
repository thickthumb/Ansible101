#!/bin/bash

ProjectName=DavidTaiwo_repo
home_ip=http://localhost:80
log_path=~/lamp_job/run-status.log
sitefile_path=/var/www/
sitefile_pathA=~/webdisplayA/
clone_repo=
repo_name=

##################___DO NOT EDIT BEYOND THIS LINEexcept you are sure of what you are doing _____#############

mkdir ~/lamp_job
touch ~/lamp_job/run-status.log

#echo "WHat would you like to name this project ?"
#read ProjectName

sudo apt update

#sudo apt upgrade


sudo apt install apache2 -y

systemctl status apache2  >> $log_path

curl home_ip >> $log_path




sudo apt install mysql-server -y


#sudo mysql show databases;

sudo apt install php libapache2-mod-php php mysql -y

php -v >> $log_path

sudo service mysql status >> $log_path

echo "Apache2, Mysql, Php has been sucessfully installed and configured the Linux system. Enter preffered directory name for apache index folder "
#read ProjectName

sudo mkdir /var/www/$ProjectName

ls -al /var/www/$ProjectName >> $log_path



sudo chown -R $USER:$USER /var/www/$ProjectName

ls -al /var/www/$ProjectName >> $log_path


sudo touch /etc/apache2/sites-available/$ProjectName.conf
sudo chown -R $USER:$USER /etc/apache2/sites-available/$ProjectName.conf

sudo echo  "<VirtualHost *:80> ServerName $ProjectName ServerAlias www.$ProjectName ServerAdmin webmaster@localhost DocumentRoot /var/www/$ProjectName ErrorLog ${APACHE_LOG_DIR}/error.log CustomLog ${APACHE_LOG_DIR}/access.log combined </VirtualHost>" >> /etc/apache2/sites-available/$ProjectName.conf


sudo cat /etc/apache2/sites-available/$ProjectName.conf >> $log_path

sudo a2ensite $ProjectName

sudo a2dissite 000-default

sudo systemctl reload apache2
mkdir $sitefile_pathA
cd $sitefile_pathA

#ls

sudo git init >> $log_path

#echo "Git initialized ! Enter link for repo clone : "
#read clone_repo


sudo git clone $clone_repo
cd $repo_name
sudo cp -R /* /var/www/$ProjectName/
sudo systemctl reload apache2


#echo "Clone Successful and cloned data now uploaded"

echo "Webserver up and Running on set port"

