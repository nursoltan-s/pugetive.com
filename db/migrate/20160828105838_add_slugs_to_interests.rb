class AddSlugsToInterests < ActiveRecord::Migration[5.0]
  def change
    add_column(:interests, :slug, :string)
    add_index(:interests, :slug)

  end
end
