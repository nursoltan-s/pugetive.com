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
# alias ct='cd ~/apps/pugetive.com/current'

source ~/.bashrc


rvm requirements
rvm install 2.3.0
rvm use 2.3.0 --default


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
# Include sites-available/pugetive_server.conf


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
# ln -s /home/deployer/.rvm/gems/ruby-2.3.0/bin/wkhtmltopdf /home/deployer/apps/pugetive/shared/bin/wkhtmltopdf


# ---------------------
# Set up server backups via Rackspace
# ---------------------
http://www.rackspace.com/knowledge_center/article/rackspace-cloud-backup-install-the-agent



