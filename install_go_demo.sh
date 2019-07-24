#!/usr/bin/env bash
echo "Updating Ubuntu..."
apt-get update
apt-get -y upgrade
echo "Done"
echo "Installing Postgresql..."
apt-get -y install postgresql postgresql-contrib
echo "Done"
echo "Installing GO..."
curl -O https://dl.google.com/go/go1.10.3.linux-amd64.tar.gz
tar xvf go1.10.3.linux-amd64.tar.gz
chown -R root:root ./go
mv go /usr/local
mkdir Projects
mkdir Projects/Proj1
export GOROOT=/usr/local/go
export GOPATH=$HOME/Projects/Proj1
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
rm go1.10.3.linux-amd64.tar.gz
echo "Done"
echo "Install Fragmenta..."
go get -u github.com/fragmenta/fragmenta
fragmenta new cms test
cd test
fragmenta migrate
iptables -t nat -I OUTPUT -p tcp -d 127.0.0.1 --dport 80 -j REDIRECT --to-ports 3000
iptables -t nat -I PREROUTING -p tcp --dport 80 -j REDIRECT --to-ports 3000
"Done"
