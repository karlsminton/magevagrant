sudo su

#stop any menus from interupting provision
export DEBIAN_FRONTEND=noninteractive

apt-get update -y
apt-get upgrade -y

apt-get install php5 -y

apt-get install mysql-server-5.6 -y
mkdir /vagrant/public_html

mv /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-avaiable/000-default.conf.original
touch /etc/apache2/sites-available/000-default.conf
FILE="/etc/apache2/sites-available/000-default.conf"

cat <<EOM > $FILE
<VirtualHost *:80>
	ServerAdmin webmaster@localhost
	DocumentRoot /vagrant/public_html
	ErrorLog ${APACHE_LOG_DIR}/error.log
	CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOM
