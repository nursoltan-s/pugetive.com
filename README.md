Pugetive.com
============

The word "pugetive" is a portmanteau of fugitive and "Puget" as in Puget Sound, the body of water between Seattle and the Olympic Peninsula. I continue to use it even though I don't live in Seattle anymore, because as an invented word it gives me a nice open namespace for projects and user accounts.

I've never worked at a company where testing was prioritized over shipping, so I'm a bit of a cowboy coder. Still, I like to write clean and well-factored code.

*How am I doing, Code Climate?*

[![Code Climate](https://codeclimate.com/repos/562917c0e30ba0431f00012e/badges/cf7290c5be0fd3b44211/gpa.svg)](https://codeclimate.com/repos/562917c0e30ba0431f00012e/feed)


Server Setup
------------
The repository includes [step-by-step instruction](doc/rackspace-server-setup.sh) for setting up a cloud server.

Apache
------------

Apache configuration files are stored in the repository under the [config/apache](config/apache) directory. Note that these include separate configurations for asset servers.  Assuming the appropriate passwordless sudo commands have been added, apache config installation is simple:

    cap <env> apache:install


Ruby
----
Steps to upgrade the Ruby version:

    rvm get head
    gem uninstall bundler
    gem install bundler
    rvm install 2.3.0
    rvm use 2.3.0 --default
    rvm uninstall 2.2.1
    gem uninstall passenger
    gem install passenger

    passenger-install-apache2-module
    # Copy the settings output after validating paths
    sudo emacs /etc/apache2/mods-available/passenger.load

    # From localhost
    cap <environment> deploy

    cap <environment> apache:restart

Database
---------
To copy the production database down to your development box:

    cap production db:pull

Often you'll want to refresh development and staging at the same time for development and testing. This command will pull a production copy of the database down to development, run migrations pending in the development branch, and then push a migrated DB to staging:

    rake db:sync

Or you can just pull down the production DB and run migrations locally, not bothering to push to staging:

    rake db:fresh


Memcache
--------
To clear the entire cache (fair warning that the site will incur a major performance hit):

    cap production memcache:flush

Backups
---------------------
A [cronjob](config/schedule.rb) executes a database dump several times per day. Since these backups are stored on disk in the log directory, they in turn are backed up via the Rackspace nightly backup of the ~deployer file system.



