class AddStatusMessageToWorks < ActiveRecord::Migration[5.0]
  def change
    add_column(:works, :status_message, :string)
  end
end
