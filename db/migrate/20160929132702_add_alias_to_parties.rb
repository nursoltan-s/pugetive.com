class AddAliasToParties < ActiveRecord::Migration[5.0]
  def change
    add_column(:parties, :alias, :boolean, null: false, default: false)
    add_index(:parties, :alias)
  end
end
