Pugetive.com
============

I've migrated the site to toddgehman.com, but still serving the pugetive.com repo.

    I've temporarily disabled code climage because it started analyzing crap I threw into my doc directory, and I suddently when from a near-4.0 grade avg to a failing maintainability grade. Whoops!

Server Setup/Maintenance
------------------------
The repository includes [step-by-step instructions](doc/aws-server-setup.sh) for setting up a cloud server via AWS and for [upgrading ruby](doc/upgrading-ruby.sh).

Backups
---------------------
A [cronjob](config/schedule.rb) executes a database daily to the logs directory. Another cron clears out backups more than one week old.

Capistrano Shortcuts
--------------------
Through a gem I made called [capistrano-shortcuts](https://github.com/pugetive/capistrano-shortcuts) the following common maintenance commands are available.


### Apache
Apache configuration files are stored in the repository under the [config/apache](config/apache) directory. Note that these include separate configurations for asset servers.  Assuming the appropriate passwordless sudo commands have been added, apache config installation is simple:

    cap <env> apache:install


### Database
To copy the production database down to your development box:

    cap production db:pull

Often you'll want to refresh development and staging at the same time for development and testing. This command will pull a production copy of the database down to development, run migrations pending in the development branch, and then push a migrated DB to staging:

    rake db:sync

Or you can just pull down the production DB and run migrations locally, not bothering to push to staging:

    rake db:fresh


### Memcache
To clear the entire cache (fair warning that the site may incur a performance hit):

    cap production memcache:flush




