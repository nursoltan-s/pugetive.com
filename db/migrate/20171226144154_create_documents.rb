class CreateDocuments < ActiveRecord::Migration[5.1]
  def change
    create_table :documents, force: true do |t|
      t.string :name
      t.string :description
      t.integer :documentable_id, null: false
      t.string :documentable_type, null: false
      t.attachment :data
    end

    add_index(:documents, [:documentable_type, :documentable_id])
    add_index(:documents, :name)

  end
end
