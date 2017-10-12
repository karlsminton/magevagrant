sudo su

#stop any menus from interupting provision
export DEBIAN_FRONTEND=noninteractive

apt-get update -y
apt-get upgrade -y

apt-get install php5 -y

apt-get install mysql-server-5.6 -y
# apache2 already installed
ln -s /vagrant/public_html /var/www/html
