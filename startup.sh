sudo su
#stop any menus from interupting provision
export DEBIAN_FRONTEND=noninteractive

apt-get update -y
apt-get upgrade -y
apt-get install php5 -y
apt-get install mysql-server-5.6 -y

sudo ln -fs /vagrant/public_html/ /var/www/site

FILE="/etc/apache2/sites-available/default.conf"

cat << EOF | sudo tee -a $FILE

<Directory "/var/www">
		AllowOverride All
</Directory>

<VirtualHost *:80>
		DocumentRoot /var/www/site
		ServerName site.dev
</VirtualHost>
EOF
a2ensite default.conf
service apache2 restart
mkdir /vagrant/public_html
mkdir /var/www/site

echo "##############################"
echo "### Add to your host machine"
echo "##############################"
