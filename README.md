# riak-vagrant

riakをセットアップした仮想マシンを3台起動する

## Requirements

- Virtualbox
- Vagrant

## Usage

1. `vagrant up`

### clusterの作成

1. `vagrant ssh node2`
2. `sudo riak-admin cluster join riak@192.168.33.1`
3. `exit`
4. `vagrant ssh node1`
5. `sudo riak-admin cluster plan`
6. `sudo riak-admin cluster commit`

`node3`も同様にクラスタに追加する