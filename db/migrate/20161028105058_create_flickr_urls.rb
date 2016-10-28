class CreateFlickrUrls < ActiveRecord::Migration[5.0]
  def change
    create_table :flickr_urls do |t|
      t.integer :work_id, null: false
      t.string :flickraw_token, null: false
      t.string :url, null: false

      t.timestamps
    end
    add_index(:flickr_urls, :work_id)
    add_index(:flickr_urls, :flickraw_token)
    add_index(:flickr_urls, [:work_id, :flickraw_token], unique: true)
  end
end
