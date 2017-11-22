Pugetive.com
============

My personal site has moved from pugetive.com to toddgehman.com, but the repo stays the same.

*How am I doing, Code Climate?*

[![Code Climate](https://codeclimate.com/github/pugetive/pugetive.com/badges/gpa.svg)](https://codeclimate.com/github/pugetive/pugetive.com)

Server Setup
------------
The repository includes [step-by-step instructions](doc/aws-server-setup.sh) for setting up a cloud server via AWS.

Ruby
----
Steps to upgrade the Ruby version:

    rvm get head
    gem uninstall bundler
    rvm install 2.4.1
    rvm use 2.4.1 --default
    rvm uninstall 2.3.1
    gem uninstall passenger
    gem install passenger

    passenger-install-apache2-module
    # Copy the settings output after validating paths
    sudo emacs /etc/apache2/mods-available/passenger.load

    gem install bundler

    # From localhost
    cap <environment> deploy

    cap <environment> apache:restart


Capistrano Shortcuts
--------------------
Through a gem I made called [capistrano-shortcuts](https://github.com/pugetive/capistrano-shortcuts) the maintenance commands are available.


## Apache

Apache configuration files are stored in the repository under the [config/apache](config/apache) directory. Note that these include separate configurations for asset servers.  Assuming the appropriate passwordless sudo commands have been added, apache config installation is simple:

    cap <env> apache:install


## Database
To copy the production database down to your development box:

    cap production db:pull

Often you'll want to refresh development and staging at the same time for development and testing. This command will pull a production copy of the database down to development, run migrations pending in the development branch, and then push a migrated DB to staging:

    rake db:sync

Or you can just pull down the production DB and run migrations locally, not bothering to push to staging:

    rake db:fresh


## Memcache
To clear the entire cache (fair warning that the site will incur a major performance hit):

    cap production memcache:flush

<!-- Backups
---------------------
A [cronjob](config/schedule.rb) executes a database dump several times per day. Since these backups are stored on disk in the log directory, they in turn are backed up via the Rackspace nightly backup of the ~deployer file system.
 -->


