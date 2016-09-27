class AddSlugToSeries < ActiveRecord::Migration[5.0]
  def change
    add_column(:series, :slug, :string)
    add_index(:series, :slug)

  end
end
