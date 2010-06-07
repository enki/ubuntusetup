add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ lucid universe"
add-apt-repository "deb-src http://us.archive.ubuntu.com/ubuntu/ lucid universe"
add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ lucid-updates universe"
add-apt-repository "deb-src http://us.archive.ubuntu.com/ubuntu/ lucid-updates universe"

add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ lucid multiverse"
add-apt-repository "deb-src http://us.archive.ubuntu.com/ubuntu/ lucid multiverse"
add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ lucid-updates multiverse"
add-apt-repository "deb-src http://us.archive.ubuntu.com/ubuntu/ lucid-updates multiverse"

add-apt-repository "deb http://archive.canonical.com/ lucid partner"
add-apt-repository "deb-src http://archive.canonical.com/ lucid partner"
add-apt-repository "deb http://archive.canonical.com/ lucid-updates partner"
add-apt-repository "deb-src http://archive.canonical.com/ lucid-updates partner"
aptitude update

exit

read -p 'hostname? '
echo $REPLY > /etc/hostname
hostname $REPLY
echo "127.0.0.1 $REPLY" >> /etc/hosts

echo grub-pc grub2/linux_cmdline string | sudo debconf-set-selections
echo grub-pc grub-pc/install_devices_empty boolean true | sudo debconf-set-selections

aptitude -y update
aptitude -y safe-upgrade
aptitude -y install build-essentials binutils-doc debian-keyring debian-maintainers g++-multilib g++-4.4-multilib gcc-4.4-doc libstdc++6-4.4-dbg gcc-multilib autoconf automake1.9  libtool flex bison gdb gcc-doc gcc-4.4-multilib libmudflap0-4.4-dev gcc-4.4-locales libgcc1-dbg libgomp1-dbg libmudflap0-dbg libcloog-ppl0 libppl-c2 libppl7 glibc-doc libstdc++6-4.4-doc python-dev ant sun-java6-jdk sun-java6-jre sun-java6-bin git-core python-virtualenv tmux vim-nox ec2-api-tools

pip install virtualenvwrapper

update-alternatives --set editor /usr/bin/vim.nox
A=`echo /root/certs/pk-*.pem`
echo "export EC2_PRIVATE_KEY=$A" >> /root/.bashrc
A=`echo /root/certs/cert-*.pem`
echo "export EC2_CERT=$A" >> /root/.bashrc
git config --global user.name "Paul Bohm"
git config --global user.email enki@bbq.io


