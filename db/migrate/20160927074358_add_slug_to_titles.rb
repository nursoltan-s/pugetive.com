class AddSlugToTitles < ActiveRecord::Migration[5.0]
  def change
    add_column(:titles, :slug, :string)
    add_index(:titles, :slug)
  end
end
