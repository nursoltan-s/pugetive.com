class AddSlugsToProjectsAndParties < ActiveRecord::Migration[5.0]
  def change
    add_column(:projects, :slug, :string)
    add_column(:parties, :slug, :string)
    add_index(:projects, :slug)
    add_index(:parties, :slug)
  end
end
