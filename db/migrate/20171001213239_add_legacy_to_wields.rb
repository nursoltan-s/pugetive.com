class AddLegacyToWields < ActiveRecord::Migration[5.1]
  def change
    add_column(:wields, :legacy, :boolean, null: false, default: false)
  end
end
