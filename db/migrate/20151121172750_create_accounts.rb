class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts, force: true do |t|
      t.string :company
      t.string :username
      t.string :url

      t.timestamps null: false
    end
  end
end
