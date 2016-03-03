class AddSummaryToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column(:projects, :summary, :string)
  end
end
