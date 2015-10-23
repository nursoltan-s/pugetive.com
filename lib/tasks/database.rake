namespace :db do

  task :rebuild do
    system("rake db:drop")
    system("rake db:create")
    # system("rake db:sync")
    system("rake db:migrate")
    system("rake db:seed")
  end

  task :reseed do
    system("cap production db:pull")
    system("rake db:migrate")
    system("rake db:seed")
  end

  task :backup do
    db_config = YAML::load_file('config/database.yml')
    dump_file = "#{Rails.root}/log/#{Rails.env}-backup-#{Time.now.strftime("%Y-%m-%d--%H-%M")}.sql"
    system("MYSQL_PWD=#{db_config[Rails.env]['password']} mysqldump " +
           "-u #{db_config[Rails.env]['username']} " +
           "#{db_config[Rails.env]['database']} " +
           "> #{dump_file} " +
           "&& gzip #{dump_file}")

  end

  task :fresh do
    system("cap production db:pull")
    system("rake db:migrate")
  end

  task :sync do
    system("rake db:fresh")
    system("cap staging db:push")
  end
end