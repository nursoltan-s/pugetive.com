namespace :db do

  db_config = YAML::load_file('config/database.yml')
  local_rails_env = 'development'
  dump_file = "capistrano-dump.sql"

  task pull: [:dump_remote_db, :pull_db, :load_local_db]
  task push: [:dump_local_db, :push_db, :load_remote_db]

  task :dump_remote_db do
    on roles(:db) do
      dump_db(db_config[fetch(:rails_env)], dump_file)
    end
  end

  task :pull_db do
    on roles(:db) do
      run_locally do
        if db_config[fetch(:rails_env)]['host'].nil?
          domain = fetch(:domain)
        else
          domain = db_config[fetch(:rails_env)]['host']
        end
        execute("scp #{fetch(:user)}@#{domain}:~/#{dump_file}.gz .")
      end
      execute("rm #{dump_file}.gz")
      run_locally do
        execute("gunzip -f #{dump_file}.gz")
      end
    end
  end

  task :load_local_db do
    run_locally do
      load_db(db_config[local_rails_env], dump_file)
      execute("rm #{dump_file}")
    end
  end

  task :dump_local_db do
    run_locally do
      dump_db(db_config[local_rails_env], dump_file)
    end
  end

  task :push_db do
    if fetch(:rails_env) == 'production'
      raise "Sorry, I refuse to push the local database to production."
    end
    run_locally do
      execute("scp #{dump_file}.gz #{fetch(:user)}@#{db_config[fetch(:rails_env)]['host'].nil? ? fetch(:domain) : db_config[fetch(:rails_env)]['host']}:~")
      execute("rm #{dump_file}.gz")
    end
    on roles(:db) do
      execute("gunzip -f #{dump_file}.gz")
    end
  end

  task :load_remote_db do
    if fetch(:rails_env) == 'production'
      raise "Sorry, I won't load the remote database on production."
    end
    on roles(:db) do
      load_db(db_config[fetch(:rails_env)], "~/#{dump_file}")
      execute("rm #{dump_file}")
    end
  end

  def dump_db(config, output_file)
    execute("MYSQL_PWD=#{config['password']} " +
            "mysqldump -f " +
            "-u #{config['username']} " +
            "#{config['database']} " +
            "-r #{output_file}")
    execute("gzip -f #{output_file}")
  end

  def load_db(config, input_file)
    execute("MYSQL_PWD=#{config['password']} " +
            "mysql " +
            "-u #{config['username']} " +
            "#{config['database']} " +
            "< #{input_file}")
  end

  # task :backup do
  #   on roles(:db) do
  #     dump_file = "cap-backup-#{Time.now.to_i}.sql"
  #     execute("mysqldump " +
  #         "-u #{db_config[fetch(:rails_env)]['username']} " +
  #         "-h #{db_config[fetch(:rails_env)]['host']} " +
  #         "-p " +
  #         "#{db_config[fetch(:rails_env)]['database']} " +
  #         "> #{dump_file}") do |ch, _, out| 
  #       if out =~ /^Enter password: /
  #         ch.send_data "#{db_config[fetch(:rails_env)]['password']}\n"
  #       else
  #         puts out 
  #       end
  #     end
  #   end
  # end
end