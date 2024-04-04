#!/bin/bash
sudo apt-get update
sudo apt-get install -y openssh-server
ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
ssh-copy-id-i ~/.ssh/id_rsa.pub vargant@192.168.56.2

