class AddOfficialTitleToParties < ActiveRecord::Migration[5.0]
  def change
    add_column(:parties, :official_title, :string)
  end
end
