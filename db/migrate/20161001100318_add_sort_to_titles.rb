class AddSortToTitles < ActiveRecord::Migration[5.0]
  def change
    add_column(:titles, :sort, :integer)
    add_index(:titles, :sort)
    add_index(:titles, [:category, :sort], unique: true)
  end
end
