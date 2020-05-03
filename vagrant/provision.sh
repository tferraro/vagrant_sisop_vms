#!/bin/bash -x

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get -y install aptitude gcc gdb git vim libncurses5 valgrind tig make autotools-dev strace emacs nano openjdk-8-jdk libcunit1 libevent1-dev ssh libfuse-dev build-essential g++ libcunit1-dev curl htop tree wget libreadline libreadline-dev docker docker-compose manpages-posix-dev

# User creation
echo 'Creating user utnso'
su -c "useradd utnso -s /bin/bash -m -g users -G sudo"
echo utnso:utnso | sudo chpasswd

# Allow password in ssh for putty
echo 'Configuring ssh to allow passwords'
sed -i 's/# PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sed -i 's/# PasswordAuthentication yes/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config

# Usefull information on login
echo 'Configuring .bashrc'
if [ "$(grep -c 'didyouknow' /home/utnso/.bashrc)" -eq 0 ]; then
	echo 'alias didyouknow="whatis $(shuf -n1 -e /bin/*); echo Type didyouknow for more commands"' >> /home/utnso/.bashrc
	echo didyouknow >> /home/utnso/.bashrc
	echo "echo 'IPs: '" >> /home/utnso/.bashrc
	echo hostname -I >> /home/utnso/.bashrc
fi
