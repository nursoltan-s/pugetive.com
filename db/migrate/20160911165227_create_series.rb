class CreateSeries < ActiveRecord::Migration[5.0]
  def change
    create_table :series do |t|
      t.string :name, null: false
      t.string :summary
      t.text :description

      t.timestamps
    end
  end
end
