class DropCompaniesTable < ActiveRecord::Migration[5.1]
  def change
    drop_table 'companies' if ActiveRecord::Base.connection.table_exists? 'companies'
  end
end
