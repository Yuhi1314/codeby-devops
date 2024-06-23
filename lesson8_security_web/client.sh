echo "192.168.56.2 server.local" | sudo tee -a /etc/hosts
  
# Copy SSL cert
sudo mkdir /usr/local/share/ca-certificates/server/

# Add SSL certificate to trusted certificates
sudo cp /etc/ssl/certs/server.crt /usr/local/share/ca-certificates/server.crt
sudo update-ca-certificates