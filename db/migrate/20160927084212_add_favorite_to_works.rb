class AddFavoriteToWorks < ActiveRecord::Migration[5.0]
  def change
    add_column(:works, :favorite, :boolean, null: false, default: 0)
    add_index(:works, :favorite)
  end
end
