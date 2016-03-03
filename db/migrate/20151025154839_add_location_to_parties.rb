class AddLocationToParties < ActiveRecord::Migration
  def change
    add_column(:parties, :location, :string, limit: 32)
  end
end
