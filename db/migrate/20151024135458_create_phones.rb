class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :number, limit: 32
      t.string :category, limit: 8

      t.timestamps null: false
    end

    add_index(:phones, :number, unique: true)
    add_index(:phones, :category)
  end
end
