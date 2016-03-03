class CreateAwards < ActiveRecord::Migration[5.0]
  def change
    create_table :awards do |t|
      t.string :name
      t.string :official_title
      t.string :summary
      t.string :url
      t.boolean :live
      t.integer :start_year
      t.integer :stop_year

      t.timestamps
    end
  end
end
