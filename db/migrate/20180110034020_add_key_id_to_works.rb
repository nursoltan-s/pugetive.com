class AddKeyIdToWorks < ActiveRecord::Migration[5.1]
  def change
    add_column(:works, :key_id, :integer)
    add_index(:works, :key_id)
  end
end
