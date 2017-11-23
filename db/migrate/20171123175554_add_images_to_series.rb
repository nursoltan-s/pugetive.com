class AddImagesToSeries < ActiveRecord::Migration[5.1]
  def change
    add_attachment :series, :image
  end
end
