class AddFlickrIdToWorks < ActiveRecord::Migration[5.0]
  def change
    add_column(:works, :flickr_id, :integer)
    add_index(:works, :flickr_id)
  end
end
