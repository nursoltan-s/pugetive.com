class AddAudienceToSeries < ActiveRecord::Migration[5.0]
  def change
    add_column(:series, :audience, :boolean, null: false, default: 0)
    add_index(:series, :audience)
  end
end
