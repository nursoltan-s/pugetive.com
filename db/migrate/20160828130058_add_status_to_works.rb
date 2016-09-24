class AddStatusToWorks < ActiveRecord::Migration[5.0]
  def change
    add_column(:works, :status, :string, limit: 16, null: false, default: 'pre')
    add_index(:works, :status)
  end


end
