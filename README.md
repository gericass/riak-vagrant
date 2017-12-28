# riak-vagrant

Start up 3 virtual machines that set up riak and create a cluster

## Requirements

- Virtualbox
- Vagrant

## Setting up a virtual machine

1. `vagrant box add ubuntu16.04 https://atlas.hashicorp.com/bento/boxes/ubuntu-16.04/versions/2.3.0/providers/virtualbox.box`
2. `vagrant up`

## Create a cluster

1. `for node in node{2,3}; do; vagrant ssh $node -c "sudo riak-admin cluster join riak@192.168.33.11"; done;`
2. `vagrant ssh node1`
3. `sudo riak-admin cluster plan`
4. `sudo riak-admin cluster commit`
