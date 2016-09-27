class CreateLyrics < ActiveRecord::Migration[5.0]
  def change
    create_table :lyrics do |t|
      t.integer :work_id, null: false
      t.text :content, null: false
      t.timestamps
    end
  end
end
