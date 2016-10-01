class AddSortToTools < ActiveRecord::Migration[5.0]
  def change
    add_column(:tools, :sort, :integer)
    add_index(:tools, :sort)
    add_index(:tools, [:type, :category, :sort], unique: true)
  end
end
