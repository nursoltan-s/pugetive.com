class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :noteable_type, null: false, limit: 32
      t.integer :noteable_id, null: false
      t.string :contents

      t.timestamps null: false
    end

    add_index(:notes, [:noteable_type, :noteable_id])
  end
end
