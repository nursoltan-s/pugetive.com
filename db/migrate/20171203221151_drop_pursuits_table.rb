class DropPursuitsTable < ActiveRecord::Migration[5.1]
  def change
    drop_table 'pursuits' if ActiveRecord::Base.connection.table_exists? 'pursuits'
  end


end
