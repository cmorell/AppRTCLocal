#!/usr/bin/env bash
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
sudo apt-get install unzip
sudo apt-get -y install git
sudo apt-get -y install npm
sudo npm install -g grunt-cli
sudo npm install -g npm
sudo apt-get install nodejs-legacy
sudo apt-get -y install python-webtest
sudo apt-get install -y python-software-properties debconf-utils
echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
sudo apt-get install -y oracle-java8-installer
sudo apt-get -y install apache2
sudo apt-get install -y libapache2-mod-proxy-html libxml2-dev
wget https://storage.googleapis.com/appengine-sdks/featured/google_appengine_1.9.38.zip
unzip google_appengine_1.9.38.zip
git clone https://github.com/webrtc/apprtc.git
wget https://storage.googleapis.com/golang/go1.6.2.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.6.2.linux-amd64.tar.gz
echo 'export PATH=$PATH:/home/vagrant/google_appengine/' >> ~/.bashrc 
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc 
echo 'export GOPATH=$HOME/work' >> ~/.bashrc 
echo 'export PATH=$PATH:$GOPATH/bin' >> ~/.bashrc
source ~/.bashrc
export PATH=$PATH:/usr/local/go/bin
mkdir $HOME/work
mkdir $HOME/work/src
export GOPATH=$HOME/work
export PATH=$PATH:$GOPATH/bin
ln -s /home/vagrant/apprtc/src/collider/collider $GOPATH/src/
ln -s /home/vagrant/apprtc/src/collider/collidermain $GOPATH/src/
ln -s /home/vagrant/apprtc/src/collider/collidertest $GOPATH/src/
go get collidermain
go install collidermain
cd apprtc
npm install
grunt