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