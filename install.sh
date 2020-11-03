 
apt-get update
apt upgrade -y
apt-get install -y apache2-utils apache2
service apache2 start
curl localhost
nano /etc/apache2/apache2.conf
#Remove AllowOverride under / and /var/www from None to All
service apache2 restart
apt-get install -y mysql-server
apt-get install -y php7.0 libapache2-mod-php7.0
apt-get install -y phpmyadmin
curl localhost
#If a bunch of random text pops up, it will show that it is working correctly 
echo >> /etc/apache2/apache2.conf
echo '#phpmyadmin include' >> /etc/apache2/apache2.conf
echo 'Include /etc/phpmyadmin/apache.conf' >> /etc/apache2/apache2.conf
service apache2 restart
apt-get install -y php-mbstring php-gettext
phpenmod mcrypt
phpenmod mbstring
mkdir ~/Downloads
mkdir ~/Downloads/Multicraft
cd ~/Downloads/Multicraft
wget http://www.multicraft.org/download/linux64 -O multicraft.tar.gz
tar xvzf multicraft.tar.gz
sudo apt-get install -y default-jre zip unzip
cd multicraft/
./setup.sh
ip a | grep inet | sed '/inet6/d'
#This will show your IPv4 Address that you need to access the website. 
#http://<ipaddress>. You need a device connected to the same network
#Do the web setup then run the next command
/home/minecraft/multicraft/bin/multicraft start
#Return to the web setup and then run the next set of commands to finish up
rm -Rf /var/www/html/multicraft/install.php
ufw enable
ufw allow 21
ufw allow 25565
echo y | ufw delete 3
echo y | ufw delete 3
ufw allow 80
echo y | ufw delete 4
#You can do 'ufw status verbose' to view if 80, 21 and 25565 ports are open through firewall
wget http://www.multicraft.org/files/multicraft.service -O /etc/systemd/system/multicraft.service
chmod 644 /etc/systemd/system/multicraft.service
systemctl enable multicraft
#I suggest a reboot at the end, as in my case there was some kernel updates.
