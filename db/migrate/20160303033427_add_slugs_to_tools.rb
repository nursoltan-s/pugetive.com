class AddSlugsToTools < ActiveRecord::Migration[5.0]
  def change
    add_column(:tools, :slug, :string)
    add_index(:tools, :slug)
  end
end
