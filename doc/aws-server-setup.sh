# # ##################################
# # BASE SERVER: Ubuntu 14.04 LTS
# # ##################################

# ssh -i /path/to/aws/key-pair.pem ubuntu@[public-ip-or-domain]

# # ---------------------
# # Set up user account
# # ---------------------
sudo adduser deployer
sudo adduser deployer sudo
sudo su - deployer
mkdir ~/.ssh; chmod 700 ~/.ssh;touch ~/.ssh/authorized_keys; chmod 600 ~/.ssh/authorized_keys
nano ~/.ssh/authorized_keys
# Run locally if not already created:
# ssh-keygen -y -f ./deployer-key-pair-us-east.pem

# Paste in AWS pem key stored locally to servers authorized_keys


# Make a shortcut for ssh'ing to the server.
# ssh -i ~/.ssh/path-to-deployers-key-pair.pem deployer@[public-ip-or-domain]


# ---------------------
# Set up basic software
# ---------------------
sudo apt-get update && sudo apt-get upgrade && sudo apt-get install emacs24 vim curl nodejs apache2-utils


# # ---------------------
# # MySQL
# # ---------------------
sudo apt-get install mysql-server mysql-client libmysqlclient-dev


# [OPTIONAL] Required for use of RMagick gems
sudo apt-get install imagemagick libmagickcore-dev libmagickwand-dev

# # ---------------------
# # Git
# # ---------------------
sudo apt-get install git-core
# Below needed to be rsa (not dsa) or wouldn't work for EC2
ssh-keygen -t rsa
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
# Add these lines, un-commented-out
# alias ct='cd ~/apps/pugetive/current'
# export RAILS_ENV=<stage-name>

source ~/.bashrc


# ---------------------
# Ruby
# ---------------------
rvm requirements && rvm install 2.3.1 && rvm use 2.3.1 --default


# ---------------------
# MySQL client
# ---------------------
# [If this isn't already the master server]
# sudo apt-get install mysql-client libmysqlclient-dev
gem install mysql2 --no-rdoc --no-ri

# This seemed to be required upon updating to Rails 4.1.0
gem install json --no-rdoc --no-ri

# [ If DB is local: create databases and grant permissions to db_user on localhost, remote IP, and remote host name ]
[create and grant access to DB]
# Example:
# grant all on pugetive_staging.* to pugetive_db_user@localhost identified by '<password>'

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
sudo apt-get install apache2 libcurl4-openssl-dev apache2-dev libapr1-dev libaprutil1-dev
gem install passenger --no-rdoc --no-ri

# If building a smaller server, you may get a swap space warning. Create swap space first:
sudo dd if=/dev/zero of=/swap bs=1M count=1024
sudo mkswap /swap
sudo swapon /swap

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
# If pushing an existently-running site, bootstrap the DB.
cap <env> db:push

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
htpasswd -c /home/deployer/.htpasswd todd

# ---------------------
# Deploy DB
# ---------------------
cap <env> config:push
cap <env> db:push
# or rake db:sync

# Copy contents of repository files into these locations:
# [ ADMIN: sudo emacs /etc/logrotate.d/pugetive-logrotate ]
# [ ADMIN: Add custom message to /etc/motd             ]

# ---------------------
# WKHTMLTOPDF
# ---------------------
gem install wkhtmltopdf-binary
# Set symlink (check locations)
# ln -s /home/deployer/.rvm/gems/ruby-2.3.0/bin/wkhtmltopdf /home/deployer/apps/pugetive/shared/bin/wkhtmltopdf


sudo a2enmod ssl

# ---------------------
# Free SSL
# ---------------------
# https://letsencrypt.org/getting-started/
# https://www.digitalocean.com/community/tutorials/how-to-secure-apache-with-let-s-encrypt-on-ubuntu-14-04

sudo ufw allow https

sudo apt-get update
sudo git clone https://github.com/letsencrypt/letsencrypt /opt/letsencrypt
cd /opt/letsencrypt
./letsencrypt-auto --apache -d pugetive.net -d assets.pugetive.net

