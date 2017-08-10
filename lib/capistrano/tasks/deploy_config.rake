namespace :config do

  task :symlink do
    on roles(:app) do
      execute("ln -sf #{current_path}/public/.htaccess-#{fetch(:rails_env)} #{current_path}/public/.htaccess ")
      execute("ln -sf #{current_path}/public/robots-#{fetch(:rails_env)}.txt #{current_path}/public/robots.txt ")
    end
  end

  task :push do
    on roles(:app) do
      execute("mkdir -p #{shared_path}/config")
      fetch(:linked_files).each do |file|
        run_locally do
          # execute("rsync -avz #{file} ")
          execute("rsync -avz -rave 'ssh -i #{fetch(:aws_key_pair)}' #{file} #{fetch(:user)}@#{fetch(:domain)}:#{shared_path}/#{file}")
# rsync -rave "ssh -i PEMKEYFILE.pem" /path/to/local/files/* ec2-user@EC2_INSTANCE_HOSTNAME:/path/to/remote/files
        end
        execute("chmod 600 #{shared_path}/#{file}")
      end
    end
  end

  task :pull do
    run_locally do
      fetch(:linked_files).each do |file|
        execute("scp #{fetch(:user)}@#{fetch(:domain)}:#{shared_path}/#{file} #{file}")
      end
    end
  end

  task :reconfig do
    run_locally do
      execute("cap #{fetch(:stage)} config:push")
      execute("cap #{fetch(:stage)} deploy:restart")
    end
  end

  task :sitemap do
    on roles(:app) do
      if fetch(:stage) == :production
        execute("cd #{current_path};RAILS_ENV=#{fetch(:stage)} bundle exec rake -s sitemap:refresh")
      else
        execute("cd #{current_path};RAILS_ENV=#{fetch(:rails_env)} bundle exec rake -s sitemap:refresh:no_ping")
      end
    end
  end
end