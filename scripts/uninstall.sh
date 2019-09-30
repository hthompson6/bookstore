echo "========Uninstalling Docker========"
sudo apt-get purge -y docker-ce
sudo rm -rf /var/lib/docker

echo "========Uninstalling Docker Compose========"
sudo apt-get purge -y docker-compose

echo "========Uninstalling MongoDB========"
sudo service mongod stop
sudo apt-get purge -y mongodb-org*
sudo rm -r /var/log/mongodb
sudo rm -r /var/lib/mongodb

echo "========Uninstalling MongoDB========"
sudo apt-get purge -y nginx nginx-common
