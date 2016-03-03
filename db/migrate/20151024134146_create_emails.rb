class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :address, null: false, limit: 64
      t.string :category, limit: 8

      t.timestamps null: false
    end

    add_index(:emails, :address, unique: true)
    add_index(:emails, :category)
  end
end
