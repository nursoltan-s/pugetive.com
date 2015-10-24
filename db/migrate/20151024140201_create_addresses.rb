class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street, null: false, limit: 64
      t.string :unit, limit: 32
      t.string :city, null: false, limit: 64
      t.string :state, null: false, limit: 2
      t.string :zip, null: false, limit: 12

      t.timestamps null: false
    end

    add_index(:addresses, :city)
    add_index(:addresses, :state)
    add_index(:addresses, :zip)

  end
end
