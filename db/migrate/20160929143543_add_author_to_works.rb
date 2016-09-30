class AddAuthorToWorks < ActiveRecord::Migration[5.0]
  def change
    add_column(:works, :author_id, :integer, null: false, default: 1)
    add_index(:works, :author_id)
  end
end
