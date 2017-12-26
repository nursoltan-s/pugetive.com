class RemoveDeprecatedImageColumns < ActiveRecord::Migration[5.1]
  def change
    [:works, :parties, :series].each do |token|
      remove_column(token, :image_file_name)
      remove_column(token, :image_content_type)
      remove_column(token, :image_file_size)
      remove_column(token, :image_updated_at)
    end
  end
end
