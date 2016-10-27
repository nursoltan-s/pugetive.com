class UpdateFlickrIdColumnLength < ActiveRecord::Migration[5.0]
  def change
   change_column :works, :flickr_id, :bigint
  end
end
