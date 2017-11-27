rvm get head
gem uninstall bundler
gem uninstall passenger
rvm install 2.4.1
rvm use 2.4.1 --default
rvm uninstall 2.3.1
gem install bundler
gem install passenger

passenger-install-apache2-module
# Copy the settings output after validating paths
sudo emacs /etc/apache2/mods-available/passenger.load


# From localhost
cap <environment> deploy

cap <environment> apache:restart

