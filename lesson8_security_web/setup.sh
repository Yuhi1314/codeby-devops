apt-get update
apt-get install -y apache2

# Generate self-signed SSL certificate
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/server.key -out /etc/ssl/certs/server.crt -subj "/C=US/ST=New York/L=New York City/O=Example/CN=server.local"
sudo cp /etc/ssl/certs/server.crt /etc/ssl/certs/server.crt
# Enable SSL module
sudo a2enmod ssl

# Configure Apache to use SSL certificate
sudo sed -i 's/\/etc\/ssl\/certs\/ssl-cert-snakeoil.pem/\/etc\/ssl\/certs\/server.crt/' /etc/apache2/sites-available/default-ssl.conf
sudo sed -i 's/\/etc\/ssl\/private\/ssl-cert-snakeoil.key/\/etc\/ssl\/private\/server.key/' /etc/apache2/sites-available/default-ssl.conf

# Create redirect from HTTP to HTTPS
echo "Redirect permanent / https://server.local/" | sudo tee -a /etc/apache2/sites-available/000-default.conf

# Restart Apache server
sudo systemctl restart apache2