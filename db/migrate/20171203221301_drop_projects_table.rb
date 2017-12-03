class DropProjectsTable < ActiveRecord::Migration[5.1]
  def change
    drop_table 'projects' if ActiveRecord::Base.connection.table_exists? 'projects'
  end

end
