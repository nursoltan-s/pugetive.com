class InterestsNotCategories < ActiveRecord::Migration[5.1]
  def change
    add_column(:tools, :interest_id, :integer, null: false, default: 1)
    Tool.all.each do |tool|
      interest = Interest.find_by_token(tool.category.downcase)
      tool.interest_id = interest.id
      tool.save!
    end
    add_index(:tools, :interest_id)
    add_index(:tools, [:interest_id, :sort])

    remove_column(:tools, :category)


    add_column(:titles, :interest_id, :integer, null: false, default: 1)
    Title.all.each do |title|
      interest = Interest.find_by_token(title.category.downcase)
      title.interest_id = interest.id
      title.save!
    end
    add_index(:titles, :interest_id)
    add_index(:titles, [:interest_id, :sort])

    remove_index(:titles, [:category, :sort])
    remove_column(:titles, :category)


    add_column(:series, :interest_id, :integer, null: false, default: 1)
    Gallery.all.each do |gallery|
      gallery.interest_id = PHOTOGRAPHY_INTEREST_ID
      gallery.save!
    end

    Album.all.each do |album|
      album.interest_id = MUSIC_INTEREST_ID
      album.save!
    end

    Collection.all.each do |collection|
      collection.interest_id = WRITING_INTEREST_ID
      collection.save!
    end

    add_index(:series, :interest_id)

  end
end
