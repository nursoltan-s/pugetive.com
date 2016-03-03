class AddOfficialTitleToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column(:projects, :official_title, :string)
  end
end
