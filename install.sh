#!/bin/bash
### vars ###
username=


### yum dev tools ###
yum groupinstall -y "Development Tools"

### yum pkg ###
yum_lst=(
epel-release
python2-pip
python2-devel
terminator
zip
unzip
bind-utils
net-tools
telnet
wget
tree
curl
git
)

for pkg in "${yum_lst[@]}"; do
  yum install -y $pkg
done;

### pip pkg ###
pip_lst=(
setuptools
ansible
molecule
pyvmomi
pysphere
docker
docker-compose
docker-pycreds
awscli
mycli
mysql-connector-python
mysql-utilities
)

for pkg in "${pip_lst[@]}"; do
  pip install $pkg
done;

### atom ###
rpm --import https://packagecloud.io/AtomEditor/atom/gpgkey
sh -c 'echo -e "[Atom]\nname=Atom Editor\nbaseurl=https://packagecloud.io/AtomEditor/atom/el/7/\$basearch\nenabled=1\ngpgcheck=0\nrepo_gpgcheck=1\ngpgkey=https://packagecloud.io/AtomEditor/atom/gpgkey" > /etc/yum.repos.d/atom.repo'
yum install -y atom

### google chrome ###
rpm --import https://dl-ssl.google.com/linux/linux_signing_key.pub
sh -c 'echo -e "[google-chrome]\nname=google-chrome\nbaseurl=http://dl.google.com/linux/chrome/rpm/stable/$basearch\nenabled=1\ngpgcheck=1\ngpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub" > /etc/yum.repos.d/google-chrome.repo'
yum install -y google-chrome-stable

### vbox ###
wget http://download.virtualbox.org/virtualbox/rpm/rhel/virtualbox.repo -O /etc/yum.repos.d/virtualbox.repo
yum install -y VirtualBox
usermod -a -G vboxusers $username

### jdk ###
yum install -y java-1.8.0-openjdk

### apache directory studio ###
mkdir -p /opt/Programme/ApacheDirectoryStudio
wget http://mirror.dkd.de/apache/directory/studio/2.0.0.v20180908-M14/ApacheDirectoryStudio-2.0.0.v20180908-M14-linux.gtk.x86_64.tar.gz -O /opt/Programme/ApacheDirectoryStudio/ApacheDirectoryStudio-2.0.0.v20180908-M14-linux.gtk.x86_64.tar.gz
cd /opt/Programme/ApacheDirectoryStudio/ && tar xfv ApacheDirectoryStudio-2.0.0.v20180908-M14-linux.gtk.x86_64.tar.gz && cd

### mysql workbench ###
wget http://repo.mysql.com/mysql-community-release-el7.rpm -O /tmp/mysql-community-release-el7.rpm
yum install -y /tmp/mysql-community-release-el7.rpm
yum install -y mysql-workbench
rm -f /tmp/mysql-community-release-el7.rpm
