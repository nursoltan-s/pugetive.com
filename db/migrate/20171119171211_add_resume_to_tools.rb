class AddResumeToTools < ActiveRecord::Migration[5.1]
  def change
    add_column(:tools, :resume, :boolean, default: false)
  end
end
