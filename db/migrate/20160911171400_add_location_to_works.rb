class AddLocationToWorks < ActiveRecord::Migration[5.0]
  def change
    add_column(:works, :location, :string)
    add_index(:works, :location)
  end
end
