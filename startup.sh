sudo su
#stop any menus from interupting provision
export DEBIAN_FRONTEND=noninteractive

apt-get update -y
apt-get upgrade -y
apt-get install php5 -y
apt-get install mysql-server-5.6 -y
apt-get install php5-gd -y
apt-get install php5-mysql -y
apt-get install php5-curl -y
apt-get install php5-mcrypt -y
sudo ln -fs /vagrant/public_html/ /var/www/site

FILE="/etc/apache2/sites-available/default.conf"

cat << EOF | sudo tee -a $FILE

<Directory "/var/www">
		AllowOverride All
</Directory>

<VirtualHost *:80>
		DocumentRoot /var/www/site
		ServerName site.local
</VirtualHost>
EOF
php5enmod curl
php5enmod mcrypt
a2enmod rewrite
a2ensite default.conf
service apache2 restart
mkdir /vagrant/public_html
mkdir /var/www/site

echo "##############################"
echo "### Add to your host machine"
echo "##############################"
