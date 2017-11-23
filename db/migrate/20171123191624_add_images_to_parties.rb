class AddImagesToParties < ActiveRecord::Migration[5.1]
  def change
    add_attachment :parties, :image
  end
end
