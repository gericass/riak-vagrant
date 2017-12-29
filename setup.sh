#!/bin/bash

curl -s https://packagecloud.io/install/repositories/basho/riak/script.deb.sh | sudo bash
apt-get install riak=2.2.3-1
cd /etc/riak
sudo sed -i "/listener/d" riak.conf
echo 'listener.http.internal = 0.0.0.0:8098' >> riak.conf
echo 'listener.protobuf.internal = 0.0.0.0:8087' >> riak.conf
echo "nodename = riak@192.168.33.1$1" >> riak.conf
echo 'storage_backend = leveldb' >> riak.conf
rm -fr /var/lib/riak/ring/
riak start
sudo add-apt-repository ppa:gophers/archive
sudo apt update
sudo apt-get -y install golang-1.9-go
sudo mkdir /home/vagrant/go
sudo echo "GOPATH=/home/vagrant/go" >> ~/.bashrc
sudo echo "PATH=$PATH:/usr/lib/go-1.9/bin:$GOPATH" >> ~/.bashrc
source ~/.bashrc
