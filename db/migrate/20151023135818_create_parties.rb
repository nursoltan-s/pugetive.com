class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.string :name, null: false
      t.string :type, null: false
      t.string :url
      t.text :description
      t.integer :start_year, null: false
      t.integer :stop_year

      t.timestamps null: false
    end

    add_index(:parties, :name)
    add_index(:parties, :type)
    add_index(:parties, :start_year)
    add_index(:parties, :stop_year)
  end
end
