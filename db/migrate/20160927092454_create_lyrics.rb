class CreateLyrics < ActiveRecord::Migration[5.0]
  def change
    create_table :lyrics do |t|
      t.integer :work_id
      t.text :content

      t.timestamps
    end
  end
end
