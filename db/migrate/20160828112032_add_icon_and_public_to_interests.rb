class AddIconAndPublicToInterests < ActiveRecord::Migration[5.0]
  def change
    add_column(:interests, :icon, :string, limit: 32)
    add_column(:interests, :public, :boolean, null: false, default: false)
    add_index(:interests, :public)

  end

end
