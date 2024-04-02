#!/bin/bash

log_path=~/lamp_job/run-status.log

#uninstalling the Lamp stack
#uncomment next line to delete log file everytime you run this script
#rm -rf ~lamp_job
#echo "successfully deleted" >> $log_path

echo -e "Welcome to Lamp Unistaller ! \n Enter ^c to exit, \n #REMEMBER  to edit script if you dont want to delete the full Lamp stack \n what Project file  would you like to delete ?"
read ProjectName

sudo apt purge apache2 -y

sudo apt purge install php libapache2-mod-php php mysql -y

sudo apt purge mysql-server -y

sudo rm -r  /var/www/$ProjectName
echo "---------------------------------------------------"
sudo rm  /etc/apache2/sites-available/$ProjectName.conf
echo "------------////////////--------////////////"

ls /etc/apache2/sites-available/
ls /var/www/


echo "ABOVE FILES AVAILABLE FOR DELETE"
echo "________________________________________________________________________________________________"

echo "successfully deleted" >> $log_path


