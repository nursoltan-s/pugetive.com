class FixTableCollation < ActiveRecord::Migration[5.1]
  def change
    db = ActiveRecord::Base.connection.current_database
    execute("ALTER DATABASE #{db} CHARACTER SET utf8 COLLATE utf8_general_ci;")
    ActiveRecord::Base.connection.tables.each do |table|
      execute("ALTER TABLE `#{table}` CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci")
    end
  end
end
