#!/usr/bin/env bash
echo "Updating Ubuntu..."
sudo apt-get update
sudo apt-get -y upgrade
echo "Done"
echo "Installing Postgresql..."
sudo apt-get -y install postgresql postgresql-contrib
echo "Done"
echo "Installing GO..."
echo "export GOPATH="${HOME}/.go"" >> ~/.profile
echo "export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin" >> ~/.profile
test -d "${GOPATH}" || mkdir "${GOPATH}"
test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"
curl -O https://dl.google.com/go/go1.10.3.linux-amd64.tar.gz
tar xvf go1.10.3.linux-amd64.tar.gz
sudo chown -R root:root ./go
sudo mv go /usr/local
rm go1.10.3.linux-amd64.tar.gz
echo "Done"
echo "Install Fragmenta..."
go get -u github.com/fragmenta/fragmenta
fragmenta new cms test
cd test
sudo -H -u postgres bash -c 'psql -c "\q"'
echo "Enter 'ubuntu' for role and select 'y' to be superuser"
sudo -u postgres createuser --interactive
sudo -u postgres createdb sammy
fragmenta migrate
sudo iptables -t nat -I OUTPUT -p tcp -d 127.0.0.1 --dport 80 -j REDIRECT --to-ports 3000
sudo iptables -t nat -I PREROUTING -p tcp --dport 80 -j REDIRECT --to-ports 3000
"Done"
