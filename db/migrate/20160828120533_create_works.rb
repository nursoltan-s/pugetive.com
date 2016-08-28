class CreateWorks < ActiveRecord::Migration[5.0]
  def change
    create_table :works do |t|
      t.string :name, null: false
      t.integer :interest_id, null: false
      t.integer :party_id, null: false
      t.string :url
      t.integer :start_year, null: false
      t.integer :stop_year
      t.text :description
      t.string :summary
      t.boolean :live, null: false, default: true
      t.string :slug

      t.timestamps
    end
    add_index(:works, :interest_id)
    add_index(:works, :party_id)
    add_index(:works, :start_year)
    add_index(:works, :stop_year)
    add_index(:works, :live)
    add_index(:works, :slug)

  end
end
