# config valid only for current version of Capistrano
lock '>=3.5.0'
set :user, 'deployer'

set :format, :pretty

set :application, 'pugetive'
set :repo_url, 'git@github.com:pugetive/pugetive.com.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/deployer/apps/pugetive"

set :ssh_options, {
  forward_agent: true,
  user: fetch(:user),
  auth_methods: ["publickey"],
  keys: ["/Users/todd/.ssh/deployer-key-pair-us-east.pem"]
}

set :aws_key_pair, '~/.ssh/deployer-key-pair-us-east.pem'

set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}" }


# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml')
set :linked_files, %w{config/database.yml
                      config/honeybadger.yml
                      config/pugetive.yml
                      config/secrets.yml
                      config/newrelic.yml
                      .env
                      .env.staging
                      .env.production
                      .env.test}


# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('bin', 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/assets}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

# after :deploy, "config:symlink"
set :passenger_restart_with_touch, true


namespace :deploy do

  before :deploy, "config:push"
  after :deploy, "config:symlink"
  after "deploy:updated", "newrelic:notice_deployment"

  after :publishing, :restart


  # after :restart, :clear_cache do
  #   on roles(:web), in: :groups, limit: 3, wait: 10 do
  #     # Here we can do anything such as:
  #     # within release_path do
  #     #   execute :rake, 'cache:clear'
  #     # end
  #   end
  # end

end
