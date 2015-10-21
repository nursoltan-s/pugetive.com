# # ##################################
# # BASE SERVER: Ubuntu 14.04 LTS
# # ##################################

# # ---------------------
# # Set up user account
# # ---------------------
# # [ as root ]
adduser deployer; adduser deployer sudo


# [ log off server ]
# [ run locally, inserting IP address ]
scp ~/.ssh/id_dsa.pub deployer@[server-ip]:~
# [ ssh back to server as deployer]
ssh deployer@[server-ip]
mkdir ~/.ssh; chmod 700 ~/.ssh;mv ~/id_dsa.pub ~/.ssh/authorized_keys



# ---------------------
# Set up basic software
# ---------------------
sudo apt-get update && sudo apt-get upgrade && sudo apt-get install emacs23 vim curl nodejs apache2-utils
# [If you get a warning about GRUB differences, keep the local version]

# ---------------------
# Disable root ssh
# ---------------------
sudo emacs /etc/ssh/sshd_config
# Then find and set this:
PermitRootLogin no
# Then do this:
sudo service ssh restart

# ---------------------
# Firewall
# ---------------------
sudo apt-get install ufw && sudo ufw default deny && sudo ufw allow ssh && sudo ufw enable
# If you want to double-check or start over:
# sudo ufw status
# sudo ufw reset


# ---------------------
# New Relic Monitor
# ---------------------
sudo sh -c 'echo deb http://apt.newrelic.com/debian/ newrelic non-free >> /etc/apt/sources.list.d/newrelic.list'
wget -O- https://download.newrelic.com/548C16BF.gpg | sudo apt-key add -
sudo apt-get update
sudo apt-get install newrelic-sysmond
sudo nrsysmond-config --set license_key=03b4e1baf4494f6f5bdce85211d19c3066121cb9
sudo /etc/init.d/newrelic-sysmond start

# # ---------------------
# # MySQL
# # ---------------------
sudo apt-get install mysql-server mysql-client libmysqlclient-dev
# Create / add root PW for mysql

# ---------------------
# Firewall
# ---------------------
sudo ufw allow http

# [OPTIONAL] Required for use of RMagick gems
sudo apt-get install imagemagick libmagickcore-dev libmagickwand-dev
#

# # ---------------------
# # Git
# # ---------------------
sudo apt-get install git-core
ssh-keygen -t dsa
# Then install the generated one as a deploy key on GitHub

# ---------------------
# RVM / Ruby
# ---------------------
\curl -L https://get.rvm.io | bash

# DO THIS
sudo emacs ~/.bashrc
# Add this line at the top, without un-commented-out:
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

sudo emacs ~/.profile
# Add this line, un-commented-out
# alias cn='cd ~/apps/nomad/current'

source ~/.bashrc


rvm requirements
rvm install 2.2.1
rvm use 2.2.1 --default


# ---------------------
# MySQL client
# ---------------------
# [If this isn't already the master server]
# sudo apt-get install mysql-client libmysqlclient-dev
gem install mysql2 --no-rdoc --no-ri

# This seemed to be required upon updating to Rails 4.1.0
gem install json

# [ If DB is local: create databases and grant permissions to db_user on localhost, remote IP, and remote host name ]
[create and grant access to DB]
# Example:
# grant all on nomad_staging.* to nomad_db_user@localhost identified by '<password>'

# If the server IP isn't in public DNS yet, set it locally.
# sudo emacs /etc/hosts


# ---------------------
# Rails
# ---------------------
gem install bundler --no-rdoc --no-ri
gem install rails -v <version> --no-rdoc --no-ri

# ---------------------
# Passenger
# ---------------------
sudo apt-get install apache2 libcurl4-openssl-dev apache2-prefork-dev libapr1-dev libaprutil1-dev
gem install passenger --no-rdoc --no-ri
passenger-install-apache2-module

# Contents of this file should be copied from the output from above.
# Something like this (note username, ruby version, passenger version)
# LoadModule passenger_module /home/deployer/.rvm/gems/ruby-2.1.0/gems/passenger-4.0.33/buildout/apache2/mod_passenger.so
# PassengerRoot /home/deployer/.rvm/gems/ruby-2.1.0/gems/passenger-4.0.33
# PassengerDefaultRuby /home/deployer/.rvm/wrappers/ruby-2.1.0/ruby
sudo emacs /etc/apache2/mods-available/passenger.load

sudo a2enmod passenger

# ---------------------
# Memcache
# ---------------------

sudo apt-get install memcached

# ---------------------
# Config Apache
# ---------------------

# Allow us to require URLs and configure asset caching
sudo a2enmod rewrite headers expires


sudo emacs /etc/apache2/apache2.conf
# Add this line at the bottom of the file:
# Include sites-available/experi_server.conf

# ---------------------
# Secure Server (Not required for staging)
# ---------------------
sudo a2enmod ssl
sudo mkdir /etc/apache2/ssl


# -----------------------------
# START SSL NOTES
# (Okay to ignore up to END OF SSL)
# -----------------------------
# THIS WAS TO CREATE A SELF-SIGNED CERT:
# sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/apache2/ssl/apache.key -out /etc/apache2/ssl/apache.crt

# THIS WAS TO CREATE A REAL KEY:
# sudo openssl genrsa -des3 -out <domain-name>.key 2048
#    OR (if you don't want to passphrase the key)
# sudo openssl genrsa -out <domain-name>.key 2048

# THIS WAS TO USE THE REAL KEY TO CREATE A CSR:
# sudo openssl req -new -key <domain-name>.key -out <domain-name>.csr

# PER RAPIDSSL INSTRUCTIONS: "NOTE: Please do not enter an email address, challenge password or an optional company name when generating the CSR."
# Country Name (2 letter code) [AU]:US
# State or Province Name (full name) [Some-State]:Washington
# Locality Name (eg, city) []:Bainbridge Island
# Organization Name (eg, company) [Internet Widgits Pty Ltd]:<company-name>
# Organizational Unit Name (eg, section) []:
# Common Name (e.g. server FQDN or YOUR name) []:*.<domain-name>
# Email Address []:

# THEN DOWNLOADED AN INTERMEDIATE/CHAIN FILE FROM RAPIDSSL AND RENAMED IT:
# sudo mv RapidSSLCABundle.pem intermediate.crt


cd /etc/apache2/ssl/ && sudo chmod 600 *


sudo emacs /etc/apache2/sites-available/default-ssl.conf
# Add under admin email:
ServerName <FILL-IN-DOMAIN>:443
# Make sure the following settings match (should have to edit second and third):
SSLEngine on
SSLCertificateFile /etc/apache2/ssl/<whatever>.crt
SSLCertificateKeyFile /etc/apache2/ssl/<whatever>.key
SSLCertificateChainFile /etc/apache2/ssl/intermediate.crt

# Open up the firewall
sudo ufw allow https

# NOTE: change config.force_ssl value in Rails environment if you want to force https

sudo emacs /etc/apache2/sites-available/default-ssl.conf
# Change opening tag to: <VirtualHost *:443>
# -----------------------------
# END OF SSL NOTES
# -----------------------------





# ---------------------
# Mod PageSpeed
# ---------------------
# Set up mod_pagespeed
cd; wget https://dl-ssl.google.com/dl/linux/direct/mod-pagespeed-beta_current_amd64.deb
sudo dpkg -i mod-pagespeed-*.deb
sudo apt-get -f install && rm *.deb


# ---------------------
# Deploy Code
# ---------------------
# Create config file for the environment
cap <env> deploy

# ---------------------
# Give deployer special permissions
# ---------------------

sudo EDITOR=emacs visudo
# deployer ALL=NOPASSWD:/etc/init.d/memcached restart, /bin/cp /home/deployer/* /etc/apache2/sites-available/, /usr/sbin/service apache2 restart, /usr/sbin/service apache2 reload, /usr/sbin/a2ensite *, /usr/sbin/a2dissite *
# [Note that if you get a syntax error when saving the above, it might be missing a newline before the EOF]


# ---------------------
# Apache
# ---------------------

cap <env> apache:install

# [ If this server is non-public you might need to create a passwords file: ]
htpasswd -c /home/deployer/.htpasswd experi

# ---------------------
# Deploy DB
# ---------------------
cap <env> db:push
# or rake db:sync

# Copy contents of repository files into these locations:
# [ ADMIN: sudo emacs /etc/logrotate.d/experi-nomad-logrotate ]
# [ ADMIN: Add custom message to /etc/motd             ]

# ---------------------
# WKHTMLTOPDF
# ---------------------
gem install wkhtmltopdf-binary
# Set symlink (check locations)
# ln -s /home/deployer/.rvm/gems/ruby-2.2.1/bin/wkhtmltopdf /home/deployer/apps/nomad/current/bin/wkhtmltopdf


# ---------------------
# Set up server backups via Rackspace
# ---------------------
http://www.rackspace.com/knowledge_center/article/rackspace-cloud-backup-install-the-agent



# ---------------------
# FTP (if necessary)
# ---------------------
# http://www.sigerr.org/linux/setup-vsftpd-custom-multiple-directories-users-accounts-ubuntu-step-by-step
sudo apt-get install vsftpd libpam-pwdfile
sudo mv /etc/vsftpd.conf /etc/vsftpd.conf.bak
sudo emacs /etc/vsftpd.conf
# Entire contents of the new conf file:
# ---------------------
listen=YES
anonymous_enable=NO
local_enable=YES
write_enable=YES
local_umask=022
nopriv_user=vsftpd
virtual_use_local_privs=YES
guest_enable=YES
user_sub_token=$USER
local_root=/home/deployer/apps/nomad/shared/public/ftp
chroot_local_user=YES
hide_ids=YES
guest_username=vsftpd
allow_writeable_chroot=YES
seccomp_sandbox=NO
# ---------------------

sudo mkdir /etc/vsftpd
sudo htpasswd -cd /etc/vsftpd/ftpd.passwd rrector
sudo htpasswd -d /etc/vsftpd/ftpd.passwd <user2>

sudo mv /etc/pam.d/vsftpd /etc/pam.d/vsftpd.bak
sudo emacs /etc/pam.d/vsftpd
# Entire contents of file:
# ---------------------
auth required pam_pwdfile.so pwdfile /etc/vsftpd/ftpd.passwd
account required pam_permit.so
# ---------------------

sudo useradd --home /home/vsftpd --gid nogroup -m --shell /bin/false vsftpd
sudo service vsftpd restart
sudo ufw allow ftp

# ---------------------
# Add a new user later:
# ---------------------
sudo htpasswd -d /etc/vsftpd/ftpd.passwd <username>


