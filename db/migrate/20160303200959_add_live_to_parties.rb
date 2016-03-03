class AddLiveToParties < ActiveRecord::Migration[5.0]
  def change
    add_column(:parties, :live, :boolean, default: false)
  end
end
